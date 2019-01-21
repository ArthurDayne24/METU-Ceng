#include "GameEngine.h"

/*
YOU MUST WRITE THE IMPLEMENTATIONS OF THE REQUESTED FUNCTIONS
IN THIS FILE. START YOUR IMPLEMENTATIONS BELOW THIS LINE 
*/



/**
 * Constructor.
 *
 * GameEngine "owns" these players.
 * GameEngine also "ofwns" the vector.
 *
 * @param boardSize The side length of the board.
 * @param players All players to participate in the game.
 */
GameEngine::GameEngine(uint boardSize, std::vector<Player *> *players):board(boardSize,players){
	this->currentRound = 1;
	this->killFlag = 0;
}

GameEngine::~GameEngine(){
	int size = (board.getPlayers())->size();
	for (int i = 0; i < size; ++i)
	{
		Player *tempPlayer = (*board.getPlayers()->begin());
		board.getPlayers()->erase(board.getPlayers()->begin());
		delete tempPlayer;
	}
	delete (board.getPlayers());
}

const Board& GameEngine::getBoard() const{
	return board;
}

/**
 * Indexing.
 *
 * Find the player with given ID.
 *
 * nullptr if not exists.
 *
 * @param id ID of the player.
 * @return The player with given ID.
 */
Player* GameEngine::operator[](uint id) const{
	for (int i = 0; i < (board.getPlayers())->size(); ++i)
	{
		if((*(board.getPlayers()))[i]->getID() == id)
			return (*(board.getPlayers()))[i];
	}
	return nullptr;
}

/**
 * Decide whether the game is finished.
 *
 * @return true if there is only 1 player (alive), on top of the hill; or there are 0 players. False otherwise.
 */
bool GameEngine::isFinished() const{
	if ((board.getPlayers())->size() == 0)
		return true;
	else if ((board.getPlayers())->size() == 1 && (board.isCoordHill((*board.getPlayers())[0] ->getCoord())))
	{
		return true;
	}
	else false;
}

/**
 * Take turn for every player.
 *
 * How-to:
 * - Announce turn start (cout).
 * Example: -- START ROUND 1  --
 * - board.updateStorm(currentRound)
 * - For every player (sorted according to their IDs) that isn't dead (HP <= 0):
 *      - takeTurnForPlayer(player).
 * - Announce turn end (cout).
 * Example: -- END ROUND 1 --
 */
void GameEngine::takeTurn(){
	std::cout << "-- START ROUND " << currentRound << " --" << std::endl;
	board.updateStorm(currentRound);
	for (int i = 0; i < (board.getPlayers())->size(); ++i)
	{
		this->takeTurnForPlayer((*board.getPlayers())[i]->getID());
		if (killFlag)
		{
			i--;
			killFlag = 0;
		}
	}
	std::cout << "-- END ROUND " << currentRound << " --" << std::endl;
	this->currentRound++;
}

/**
 * The most important (algorithm-wise) method.
 *
 * How-to:
 * - Get player with ID. Return NOOP if not exists.
 * - Get player's priority list.
 * - Get player's visibility from the board (visibleCoordsFromCoord).
 *
 * - If the player is in the storm (isStormInCoord), announce the damage and give player stormDamage.
 * - Example: Tracer01(10) is STORMED! (-10)
 *
 * - If dead, announce the death, remove player from the board/list/anywhere, and return NOOP.
 * - Example: Tracer01(0) DIED.
 *
 * - For MOVE in player's priority list:
 *          - If the MOVE is NOOP:
 *              - return NOOP.
 *          - Else if the MOVE is ATTACK:
 *              - Get all players that this player can attack (board[coord] for each in visibilityCoords).
 *              - If none, continue.
 *              - Else:
 *                  - Pick the one with most priority (lowest ID).
 *                  - isPlayerDead = player.attackTo(thatPlayer).
 *                  - if isPlayerIsDead:
 *                      - announce the death.
 *                      - remove thatPlayer from the board/list/anywhere.
 *                  - return ATTACK.
 *          - Else (UP/DOWN/LEFT/RIGHT):
 *              - calculateCoordWithMove(move).
 *              - If the new coordinate is different than the player's (meaning it's able to do that move)
 *              AND the player is getting closer to the hill;
 *                  - player.executeMove(MOVE).
 *                  - return MOVE.
 *              - Else:
 *                  - continue.
 *
 * // If the priority list is exhausted;
 * return NOOP.
 *
 * @param player Player ID to move.
 * @return move Decided move.
 */
Move GameEngine::takeTurnForPlayer(uint playerID){
	std::vector<Move> priorityList;
	std::vector<Coordinate> VisibleCoords;
	if((*this)[playerID] == nullptr){
		return NOOP;
	}
	else{
		priorityList = (*this)[playerID]->getPriorityList();
		VisibleCoords = board.visibleCoordsFromCoord((*this)[playerID]->getCoord());
		if (board.isStormInCoord((*this)[playerID]->getCoord()))
		{
			
			if ((*this)[playerID]->getHP() > 0){
				std::cout << (*this)[playerID]->getFullName() << "(" << (*this)[playerID]->getHP() << ") is STORMED! (-" << Entity::stormDamageForRound(currentRound) << ")" << std::endl;
				(*this)[playerID]->setHP((*this)[playerID]->getHP() - Entity::stormDamageForRound(currentRound));
			}
			if((*this)[playerID]->getHP() <= 0){
				std::cout << (*this)[playerID]->getFullName() << "(" << (*this)[playerID]->getHP() <<") DIED." << std::endl;
				(*this)[playerID]->setHP((*this)[playerID]->getHP() - Entity::stormDamageForRound(currentRound));
				int index=0;
				Player *tempPlayer;
				for (int i = 0; i < board.getPlayers()->size(); ++i)
				{
					if(playerID == (*board.getPlayers())[i]->getID()){
						tempPlayer = (*board.getPlayers())[index];
						board.getPlayers()->erase(board.getPlayers()->begin() + index);
					}
					index++;
				}
				delete tempPlayer;
				this->killFlag = 1;
				return NOOP;
			}

		}
		for (int i = 0; i < priorityList.size(); ++i)
		{
			if (priorityList[i] == NOOP)
			{
				return NOOP;
			}
			else if (priorityList[i] == ATTACK)
			{
				int min = 1000;
				int index = -1;
				Player* tempPlayer;
				for (int j = 0; j < VisibleCoords.size(); ++j)
				{
					if (board[VisibleCoords[j]] != NULL)
					{
						if (board[VisibleCoords[j]]->getID() < min)
						{
							min = board[VisibleCoords[j]]->getID();
							tempPlayer = board[VisibleCoords[j]];
							index = j;
						}
					}
				}
				if (index != -1)
				{
					bool isPlayerDead = (*this)[playerID]->attackTo(tempPlayer);
					if (isPlayerDead)
					{
						std::cout << (*this)[min]->getFullName() << "(" << tempPlayer->getHP() << ") DIED." << std::endl;
						for (int k = 0; k < (board.getPlayers())->size() ; ++k)
						{
							if ((*board.getPlayers())[k]->getID() == min)
							{	if (min < playerID)
								{
									this->killFlag = 1;
									
								}
								board.getPlayers()->erase(board.getPlayers()->begin() + k);
							}
						}	
						
						delete tempPlayer;
					}
					index = -1;
					return ATTACK;
				}
			}
			else{
				if (board.calculateCoordWithMove(priorityList[i],(*this)[playerID]->getCoord()) != (*this)[playerID]->getCoord())
				{
					if(board.isClose(board.calculateCoordWithMove(priorityList[i],(*this)[playerID]->getCoord()),(*this)[playerID]->getCoord())){
						(*this)[playerID]->executeMove(priorityList[i]);
						return priorityList[i];
					}
				}
			}
		}

		return NOOP;
	}
}

/**
 * Find the winner player.
 *
 * nullptr if there are 0 players left, or the game isn't finished yet.
 *
 * @return The winner player.
 */
Player* GameEngine::getWinnerPlayer() const{
	if (this->isFinished() && board.getPlayers()->size() == 1)
	{
		return (*board.getPlayers())[0];
	}	
	else
		return NULL;
}


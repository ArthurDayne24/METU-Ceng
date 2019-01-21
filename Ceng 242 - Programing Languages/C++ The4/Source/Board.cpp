#include "Board.h"
#include "Player.h"
/*
YOU MUST WRITE THE IMPLEMENTATIONS OF THE REQUESTED FUNCTIONS
IN THIS FILE. START YOUR IMPLEMENTATIONS BELOW THIS LINE 
*/

Board::Board(uint boardSize, std::vector<Player *> *players):boardSize(boardSize),players(players){
	this->stormSize = 0;
}
Board::~Board(){

}

uint Board::getSize() const{
	return boardSize;
}


bool Board::isCoordInBoard(const Coordinate& coord) const{
	if(coord.x < 0)
		return false;
	else if(coord.y < 0)
		return false;
	else if(coord.x >= this->boardSize)
		return false;
	else if(coord.y >= this->boardSize)
		return false;
	else 
		return true;
}


bool Board::isStormInCoord(const Coordinate &coord) const{
	if(!isCoordInBoard(coord))
	{
		return false;
	}
	else if (isCoordHill(coord))
	{
		return false;
	}
	else{
		if (coord.x < this->stormSize){
			return true;
		}
		else if(coord.y < this->stormSize){
			return true;
		}
		else if(coord.x >= boardSize-this->stormSize){
			return true;
		}
		else if(coord.y >= boardSize-this->stormSize){
			return true;
		}
		else
			return false;
	}
}


bool Board::isCoordHill(const Coordinate& coord) const{
	if ((coord.x) == boardSize/2 && (coord.y) == boardSize/2 )
	{
		return true;
	}
	return false;
}


Player* Board::operator[](const Coordinate& coord) const{
	for (int i = 0; i < players->size(); ++i)
	{
		if((*players)[i]->getCoord() == coord)
			return (*players)[i];
	}
	return nullptr;
}


Coordinate Board::calculateCoordWithMove(Move move, const Coordinate &coord) const{
	if (move == ATTACK || move == NOOP)
	{
		return coord;
	}
	else if (move == UP){
		if(isCoordInBoard(coord+(UP))){
			if ((*this)[coord+(UP)] == NULL){
				return coord+(UP);
			}
		}
	}
	else if (move == DOWN){
		if(isCoordInBoard(coord+(DOWN))){
			if ((*this)[coord+(DOWN)] == NULL){
				return coord+(DOWN);
			}	
		}
	}
	else if (move == RIGHT){
		if(isCoordInBoard(coord+(RIGHT))){
			if ((*this)[coord+(RIGHT)] == NULL){
				return coord+(RIGHT);
			}
		}
	}
	else if (move == LEFT){
		if(isCoordInBoard(coord+(LEFT))){
			if ((*this)[coord+(LEFT)] == NULL){
				return coord+(LEFT);
			}
		}
	}
	return coord;
}

std::vector<Coordinate> Board::visibleCoordsFromCoord(const Coordinate &coord) const{
	std::vector<Coordinate> Coords;
	if (isCoordInBoard(coord))
	{
    	if(isCoordInBoard(coord+(UP)))
    	{
    		Coords.push_back(coord+(UP));
    	}
    	if(isCoordInBoard(coord+(DOWN)))
    	{
    		Coords.push_back(coord+(DOWN));
    	}
    	if(isCoordInBoard(coord+(RIGHT)))
    	{
    		Coords.push_back(coord+(RIGHT));
    	}
    	if(isCoordInBoard(coord+(LEFT)))
    	{
    		Coords.push_back(coord+(LEFT));
    	}
	}
	return Coords;
}

void Board::updateStorm(uint currentRound){
	this->stormSize = Entity::stormWidthForRound(currentRound);
}

std::vector<Player *> * Board::getPlayers() const{
	return players;
}

bool Board::isClose(Coordinate aim, Coordinate current){
	int currentX = abs((this->boardSize/2) - current.x);
	int currentY = abs((this->boardSize/2) - current.y);
	int aimX = abs((this->boardSize/2) - aim.x);
	int aimY = abs((this->boardSize/2) - aim.y);

	if (currentX +currentY > aimX + aimY)
		return true;
	else
		return false;
}
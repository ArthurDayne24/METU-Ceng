#include "GameParser.h"
#include "Player.h"
#include "Berserk.h"
#include "Ambusher.h"
#include "Tracer.h"
#include "Pacifist.h"
#include "Dummy.h"
/*
YOU MUST WRITE THE IMPLEMENTATIONS OF THE REQUESTED FUNCTIONS
IN THIS FILE. START YOUR IMPLEMENTATIONS BELOW THIS LINE 
*/


std::pair<int, std::vector<Player *> *> GameParser::parseFileWithName(const std::string& filename){
	int boardSize, playerCount;
	int index;

	std::ifstream inputFileStream(filename);
	std::string line;
	
	std::getline(inputFileStream, line);
	index = line.find(":");
	line.erase(0,index);
	line.erase(0,2);
	boardSize = std::stoi(line);

	

	std::getline(inputFileStream, line);
	index = line.find(":");
	line.erase(0,index);
	line.erase(0,2);
	playerCount = std::stoi(line);


	std::vector<Player *> *Field = new std::vector<Player *> ;	





    
    for (int i = 0; i < playerCount; ++i)
    {	

    	int id,x,y;
    	std::string name;
	   	std::getline(inputFileStream, line);
		index = line.find(":");

		id = std::stoi(line.substr(0,index));
		
		line.erase(0,index+2);
		
		index = line.find(":");
		name = line.substr(0,index);
		line.erase(0,index+2);

		index = line.find(":");
		x = std::stoi(line.substr(0,index));
		line.erase(0,index+2);

		y = std::stoi(line);


		if (name == "Berserk"){
    		Player *berserk = new Berserk(id, x, y);
    		Field->push_back(berserk);
		}
		else if (name == "Ambusher"){
    		Player *ambusher = new Ambusher(id, x, y);
    		Field->push_back(ambusher);
		}
		else if (name == "Tracer"){
    		Player *tracer = new Tracer(id, x, y);
    		Field->push_back(tracer);
    		
		}
		else if (name == "Pacifist"){
    		Player *pacifist = new Pacifist(id, x, y);
    		Field->push_back(pacifist);
		}
		else if (name == "Dummy"){
    		Player *dummy = new Dummy(id, x, y);
    		Field->push_back(dummy);
    		
		}

    }
    return std::make_pair(boardSize, Field);

}
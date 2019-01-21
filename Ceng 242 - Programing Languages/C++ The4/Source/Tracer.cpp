#include "Tracer.h"

/*
YOU MUST WRITE THE IMPLEMENTATIONS OF THE REQUESTED FUNCTIONS
IN THIS FILE. START YOUR IMPLEMENTATIONS BELOW THIS LINE 
*/

Tracer::Tracer(uint id, int x, int y):Player(id,x,y){
	weapon= SHOVEL;
	armor = BRICK;
	PriList = { UP, LEFT, DOWN, RIGHT, ATTACK };
}

Armor Tracer::getArmor() const{
	return armor;
}

Weapon Tracer::getWeapon() const{
	return weapon;
}
	

std::vector<Move> Tracer::getPriorityList() const{
	return PriList;
}


const std::string Tracer::getFullName() const{
	std::string isim = "Tracer" + this->getBoardID();
	return isim;
}


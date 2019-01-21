#include "Pacifist.h"

/*
YOU MUST WRITE THE IMPLEMENTATIONS OF THE REQUESTED FUNCTIONS
IN THIS FILE. START YOUR IMPLEMENTATIONS BELOW THIS LINE 
*/


Pacifist::Pacifist(uint id, int x, int y):Player(id,x,y){
	weapon= NOWEAPON;
	armor = METAL;
	PriList = { UP, LEFT, DOWN, RIGHT };
}

Armor Pacifist::getArmor() const{
	return armor;
}

Weapon Pacifist::getWeapon() const{
	return weapon;
}
	

std::vector<Move> Pacifist::getPriorityList() const{
	return PriList;
}


const std::string Pacifist::getFullName() const{
	std::string isim = "Pacifist" + this->getBoardID();
	return isim;
}


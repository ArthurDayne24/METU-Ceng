#include "Ambusher.h"

/*
YOU MUST WRITE THE IMPLEMENTATIONS OF THE REQUESTED FUNCTIONS
IN THIS FILE. START YOUR IMPLEMENTATIONS BELOW THIS LINE 
*/

Ambusher::Ambusher(uint id, int x, int y):Player(id,x,y){
	weapon= SEMIAUTO;
	armor = NOARMOR;
	PriList = { ATTACK };
}

Armor Ambusher::getArmor() const{
	return armor;
}

Weapon Ambusher::getWeapon() const{
	return weapon;
}
	

std::vector<Move> Ambusher::getPriorityList() const{
	return PriList;
}


const std::string Ambusher::getFullName() const{
	std::string isim = "Ambusher" + this->getBoardID();
	return isim;
}


#include "Dummy.h"

/*
YOU MUST WRITE THE IMPLEMENTATIONS OF THE REQUESTED FUNCTIONS
IN THIS FILE. START YOUR IMPLEMENTATIONS BELOW THIS LINE 
*/



Dummy::Dummy(uint id, int x, int y):Player(id,x,y){
	weapon= NOWEAPON;
	armor = NOARMOR;
	PriList = { NOOP };
	this->HP = 1000;
}

Armor Dummy::getArmor() const{
	return armor;
}

Weapon Dummy::getWeapon() const{
	return weapon;
}
	

std::vector<Move> Dummy::getPriorityList() const{
	return PriList;
}


const std::string Dummy::getFullName() const{
	std::string isim = "Dummy" + this->getBoardID();
	return isim;
}


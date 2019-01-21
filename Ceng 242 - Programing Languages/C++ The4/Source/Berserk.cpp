#include "Berserk.h"

/*
YOU MUST WRITE THE IMPLEMENTATIONS OF THE REQUESTED FUNCTIONS
IN THIS FILE. START YOUR IMPLEMENTATIONS BELOW THIS LINE 
*/

Berserk::Berserk(uint id, int x, int y):Player(id,x,y){
	weapon= PISTOL;
	armor = WOODEN;
	PriList = { ATTACK, UP, LEFT, DOWN, RIGHT };
}

Armor Berserk::getArmor() const{
	return armor;
}

Weapon Berserk::getWeapon() const{
	return weapon;
}
	

std::vector<Move> Berserk::getPriorityList() const{
	return PriList;
}


const std::string Berserk::getFullName() const{
	std::string isim = "Berserk" + this->getBoardID();
	return isim;
}


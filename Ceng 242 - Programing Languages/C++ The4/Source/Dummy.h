#ifndef HW4_DUMMY_H
#define HW4_DUMMY_H


#include "Player.h"

class Dummy : public Player {
public:
	Armor armor;
	Weapon weapon;
	std::vector<Move> PriList;
    Dummy(uint id, int x, int y);

    // Name     : Dummy
    // Priority : { NOOP }

    // Armor    : NOARMOR
    // Weapon   : NOWEAPON
    // HP       : 1000

    // DO NOT MODIFY THE UPPER PART
    // ADD OWN PUBLIC METHODS/PROPERTIES/OVERRIDES BELOW
    Armor getArmor() const;
    Weapon getWeapon() const;

    std::vector<Move> getPriorityList() const;

    const std::string getFullName() const;
};


#endif //HW4_DUMMY_H

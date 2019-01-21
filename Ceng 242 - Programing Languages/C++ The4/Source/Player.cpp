#include "Player.h"

/*
YOU MUST WRITE THE IMPLEMENTATIONS OF THE REQUESTED FUNCTIONS
IN THIS FILE. START YOUR IMPLEMENTATIONS BELOW THIS LINE 
*/
#include <iostream>

Player::Player(uint id, int x, int y):id(id),coordinate(x,y){
	this->HP = 100;
}

uint Player::getID() const {
	return this->id;
}

Player::~Player(){

}

const Coordinate& Player::getCoord() const{
	return this->coordinate;

}


int Player::getHP() const{
	return HP;
}


std::string Player::getBoardID() const{
	if (this->id >= 10){
		return std::to_string(this->id);
	}
	else{
		return '0' + std::to_string(this->id);
	}
}


void Player::executeMove(Move move){
	if (move == NOOP)
	{
		;
	}
	else if (move == ATTACK)
	{
		;
	}
	else if (move == UP)
	{

		this->coordinate = coordinate+(move);
		std::cout << getFullName()  <<"(" << getHP() << ") " << "moved UP." << std::endl;

	}
	else if (move == DOWN)
	{
		this->coordinate = coordinate+(move);
		std::cout << getFullName()  <<"(" << getHP() << ") " << "moved DOWN." << std::endl;
	}
	else if (move == LEFT)
	{
		this->coordinate = coordinate+(move);
		std::cout << getFullName()  <<"(" << getHP() << ") " << "moved LEFT." << std::endl;
	}
	else if (move == RIGHT)
	{
		this->coordinate = coordinate+(move);
		std::cout << getFullName()  <<"(" << getHP() << ") " << "moved RIGHT." << std::endl;
	}
}


bool Player::attackTo(Player *player){
	if(this->getID() == player->getID()){
		return false;
	}
	else{
		std::cout << this->getFullName() << "(" << this->getHP() << ") ATTACKED " << player->getFullName() << "(" << player->getHP() << ")! (-" << Entity::damageForWeapon(this->getWeapon()) - Entity::damageReductionForArmor(player->getArmor()) << ")" << std::endl;
		player->HP -= std::max(Entity::damageForWeapon(this->getWeapon()) - Entity::damageReductionForArmor(player->getArmor()),0);
		if(player->HP > 0){
			return false;
		}
		else{
			return true;
		}	
	}
}


bool Player::isDead() const{
	if(this->HP > 0){
		return false;
	}
	else{
		return true;
	}
}

void Player::setHP(int hp){
	this->HP = hp;
}

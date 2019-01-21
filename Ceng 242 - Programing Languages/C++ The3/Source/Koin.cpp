#include "Koin.h"
/*
YOU MUST WRITE THE IMPLEMENTATIONS OF THE REQUESTED FUNCTIONS
IN THIS FILE. START YOUR IMPLEMENTATIONS BELOW THIS LINE 
*/

Koin::Koin(double value){
	this->value = value;
	this->next = NULL;
}

Koin::Koin(const Koin& rhs){
	this->value = rhs.value;
	this->next = rhs.next;
}

Koin& Koin::operator=(const Koin& rhs){
	value = rhs.value;
	next = rhs.next;
	return *this;
}

Koin::~Koin(){
	
}

double Koin::getValue() const{
	return this->value;
}

Koin* Koin::getNext() const{
	return this->next;
}

void Koin::setNext(Koin *next){
	this->next = next;
}

bool Koin::operator==(const Koin& rhs) const{
	if(this->next == rhs.next ){ 
		if((this->value - rhs.value) < Utilizer::doubleSensitivity() && (rhs.value - this->value) < Utilizer::doubleSensitivity())
			return true;
		else
			return false;
	}
	else
		return false;
}

bool Koin::operator!=(const Koin& rhs) const{
	if(this->next == rhs.next ){ 
		if((this->value - rhs.value) < Utilizer::doubleSensitivity() && (rhs.value - this->value) < Utilizer::doubleSensitivity())
			return false;
		else
			return false;
	}
	else
		return true;	
}

Koin& Koin::operator*=(int multiplier){
	this->value *= multiplier;
	return *this;
}

Koin& Koin::operator/=(int divisor){
	this->value /= divisor;
	return *this;
}

std::ostream& operator<<(std::ostream& os, const Koin& koin){
	const Koin *yusuf = &koin;
	while(yusuf!= NULL){
		os << std::fixed << std::setprecision(Utilizer::koinPrintPrecision()) << yusuf->value << "--";
		yusuf = yusuf->getNext();
	}
	os << "|";
	return os;
}
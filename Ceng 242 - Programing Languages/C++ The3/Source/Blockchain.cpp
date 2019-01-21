#include "Blockchain.h"
#include "Utilizer.h"
/*
YOU MUST WRITE THE IMPLEMENTATIONS OF THE REQUESTED FUNCTIONS
IN THIS FILE. START YOUR IMPLEMENTATIONS BELOW THIS LINE 
*/

Blockchain::Blockchain(int id):id(id)
{
	this->head = NULL;
}

Blockchain::Blockchain(int id, Koin *head):id(id)
{
	this->head = head; 
}

Blockchain::Blockchain(const Blockchain& rhs):id(rhs.id)
{
	Koin *yusuf = new Koin(rhs.getHead()->getValue());
	yusuf->setNext(rhs.getHead()->getNext());
	this->head = yusuf;
}

Blockchain& Blockchain::operator=(Blockchain&& rhs) noexcept{
	Koin *temp = this->head;
	while(temp != NULL){
		this->head = temp->getNext();
		delete temp;
		temp = this->head;
	}
	this->head = rhs.head;
	rhs.head = NULL;
	return *this;
}

Blockchain::~Blockchain(){
	Koin * tempKoin = this->head;
	while(tempKoin != NULL){
		this -> head = tempKoin->getNext();
		delete(tempKoin);
		tempKoin = this->head;
	}
}

int Blockchain::getID() const{
	return this->id;
}

Koin* Blockchain::getHead() const{
	return this->head;
}

double Blockchain::getTotalValue() const{
	double sum=0;
	Koin* yusuf = this-> getHead();
	while(yusuf!= NULL){
		sum += yusuf->getValue();
		yusuf = yusuf->getNext();
	}
	return sum;
}

long Blockchain::getChainLength() const{
	long sum=0;
	Koin* yusuf = this-> getHead();
	while(yusuf!= NULL){
		sum += 1;
		yusuf = yusuf->getNext();
	}
	return sum;
}

void Blockchain::operator++(){
	Koin* yusuf = this-> getHead();
	if(yusuf== NULL){
		Koin* newKoin = new Koin(Utilizer::fetchRandomValue());
		this->head = newKoin;
	}
	else{
		while(yusuf->getNext()!= NULL){
			yusuf = yusuf->getNext();
		}
		Koin* newKoin = new Koin(Utilizer::fetchRandomValue());
		yusuf->setNext(newKoin);
	}
}

void Blockchain::operator--(){
	Koin* yusuf = this-> getHead();
	if(yusuf == NULL){
		return;
	}
	else{
		if(yusuf->isSoftKoin == false){
			if(yusuf->getNext() == NULL){
				delete(yusuf);
				this->head = NULL;
			}
			else{
				while(yusuf->getNext()->getNext()!= NULL){
					yusuf = yusuf->getNext();
				}
				if (yusuf->isSoftKoin == false)
				{
					delete(yusuf->getNext());
					yusuf ->setNext(NULL);
				}
			}
			/* code */
		}
	}
}

Blockchain& Blockchain::operator*=(int multiplier){
	Koin* yusuf = this-> getHead();
	while(yusuf!= NULL){
		(*yusuf) *= multiplier; 
		yusuf = yusuf->getNext();
	}
	return *this;
}

Blockchain& Blockchain::operator/=(int divisor){
	Koin* yusuf = this-> getHead();
	while(yusuf!= NULL){
		(*yusuf) /= divisor; 
		yusuf = yusuf->getNext();
	}
	return *this;
}

std::ostream& operator<<(std::ostream& os, const Blockchain& blockchain){
	const Blockchain *yusufBlock = &blockchain;
	if (yusufBlock->getHead() == NULL)
	{
		os << "Block "<< yusufBlock->getID() << ": Empty.";
		return os;
	}
	else{
		Koin *yusufKoin = yusufBlock->getHead();
		os << "Block " << yusufBlock->getID() << ": ";
		while(yusufKoin != NULL){
			os << std::fixed << std::setprecision(Utilizer::koinPrintPrecision())  <<  yusufKoin->getValue() << "--";
			yusufKoin = yusufKoin->getNext();
		}
		os << "|(" << std::fixed << std::setprecision(Utilizer::koinPrintPrecision())  << yusufBlock->getTotalValue() << ")";
		return os; 
	}
}

void Blockchain::setHead(Koin * newKoin){
	this->head = newKoin;
}

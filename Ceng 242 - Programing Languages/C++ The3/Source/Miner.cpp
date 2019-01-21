#include "Miner.h"

/*
YOU MUST WRITE THE IMPLEMENTATIONS OF THE REQUESTED FUNCTIONS
IN THIS FILE. START YOUR IMPLEMENTATIONS BELOW THIS LINE 
*/


int Miner::getNextAvailableBlockchainID() const{
	if ((this->MinerBlocks).empty())
	{
		return 0;
	}
	else{
		return MinerBlocks.size();
	}
}

Miner::Miner(std::string name){
	this->name = name;
}

Miner::~Miner(){
	int size = (this->MinerBlocks).size();
	for (int i = 0; i < size; ++i)
	{
		if ((this->MinerBlocks)[i] -> isSoftBlock == true){
			this->MinerBlocks[i] ->setHead(NULL);
		}
	}
	for (int i = 0; i < size; ++i)
	{
		delete MinerBlocks[i];
	}
}

void Miner::createNewBlockchain(){
	Blockchain *newBlock = new Blockchain(getNextAvailableBlockchainID());
	(this->MinerBlocks).push_back(newBlock);
}

void Miner::mineUntil(int cycleCount){
	for (int i = 0; i < cycleCount; ++i)
	{
		for (int j = 0; j < (this->MinerBlocks).size(); ++j)
		{
			Koin* yusuf = (this->MinerBlocks)[j]->getHead();
			if(yusuf== NULL){
				Koin* newKoin = new Koin(Utilizer::fetchRandomValue());
				(this->MinerBlocks)[j]->setHead(newKoin);
			}
			else{
				while(yusuf->getNext()!= NULL){
					yusuf = yusuf->getNext();
				}
				Koin* newKoin = new Koin(Utilizer::fetchRandomValue());
				yusuf->setNext(newKoin);
			}
		}
	}
}

void Miner::demineUntil(int cycleCount){
	for (int i = 0; i < cycleCount; ++i)
	{
		for (int j = 0; j < (this->MinerBlocks).size(); ++j)
		{
			if ((this->MinerBlocks)[j]->isSoftBlock == false)
			{
				//--(*(this->MinerBlocks)[j]);
				Koin* yusuf = (this->MinerBlocks)[j]->getHead();
				if(yusuf == NULL){
					continue;
				}
				else{
					if (yusuf->isSoftKoin == false)
					{
						if(yusuf->getNext() == NULL){
							delete(yusuf);
							(this->MinerBlocks)[j]->setHead(NULL);
						}
						else{
							while(yusuf->getNext()->getNext()!= NULL){
								yusuf = yusuf->getNext();
							}
							if (yusuf->getNext()->isSoftKoin == false)
							{
								delete(yusuf->getNext());
								yusuf ->setNext(NULL);
							}
						}
					}
				}
			}
		}
	}
}

double Miner::getTotalValue() const{
	double sum = 0;
	for (int i = 0; i < (this->MinerBlocks).size(); i++)
	{
		if((this->MinerBlocks)[i]->isSoftBlock == true){
			continue;
		}
		else{
			sum += (this->MinerBlocks)[i] ->getTotalValue();
		}
	}
	return sum;
}

long Miner::getBlockchainCount() const{
	return (this->MinerBlocks).size();
}

Blockchain* Miner::operator[](int id) const{
	if ((this->MinerBlocks).size()== 0)
		return nullptr;
	else if((this->MinerBlocks).size() <=id)
		return nullptr;
	else
		return (this->MinerBlocks)[id];
}

bool Miner::softFork(int blockchainID){
	if (blockchainID < 0 || blockchainID >= (this->MinerBlocks).size()){
		return false;
	}
	else{
		int newID = this->getNextAvailableBlockchainID();
		this->createNewBlockchain();
		Koin *tempKoin = (this->MinerBlocks)[blockchainID]->getHead();
		while(tempKoin->getNext() != NULL)
			tempKoin = tempKoin->getNext();
		(this->MinerBlocks)[newID]->isSoftBlock = true;
		(this->MinerBlocks)[newID] -> setHead(tempKoin);
		(this->MinerBlocks)[newID] -> getHead()->isSoftKoin = true;
		return true;
	}
}

bool Miner::hardFork(int blockchainID){
	if (blockchainID < 0 || blockchainID >= (this->MinerBlocks).size()){
		return false;
	}
	else{
		int newID = this -> getNextAvailableBlockchainID();
		this->createNewBlockchain();
		Koin *tempKoin = (this->MinerBlocks)[blockchainID]->getHead();
		while(tempKoin->getNext() != NULL)
			tempKoin = tempKoin->getNext();
		Koin *addKoin= new Koin(tempKoin->getValue());
		(this->MinerBlocks)[newID] -> setHead(addKoin);
	}
}

std::ostream& operator<<(std::ostream& os, const Miner& miner){

	if ((miner.MinerBlocks).size() == 0){
		os 
		<< "-- BEGIN MINER --\n"
		<< "Miner name: " << miner.name << "\n"
		<< "Blockchain count: " << miner.getBlockchainCount() << "\n"
		<< "Total value: " << std::fixed << std::setprecision(Utilizer::koinPrintPrecision())  << miner.getTotalValue() << "\n"
		<< "\n"
		<< "Block 0: Empty."
		<< "\n \n"
		<< "-- END MINER --";

	}
	else{
		os 
		<< "-- BEGIN MINER --\n"
		<< "Miner name: " << miner.name << "\n"
		<< "Blockchain count: " << miner.getBlockchainCount() << "\n"
		<< "Total value: " << std::fixed << std::setprecision(Utilizer::koinPrintPrecision())  << miner.getTotalValue() << "\n"
		<< "\n";

		for (int i = 0; i < (miner.MinerBlocks).size(); ++i)
		{
			const Blockchain *yusufBlock = (miner.MinerBlocks)[i];
			if (yusufBlock->getHead() == NULL)
			{
				os << "Block "<< yusufBlock->getID() << ": Empty.";
			}
			else{
				Koin *yusufKoin = yusufBlock->getHead();
				os << "Block " << yusufBlock->getID() << ": ";
				while(yusufKoin != NULL){
					os << std::fixed << std::setprecision(Utilizer::koinPrintPrecision())  <<  yusufKoin->getValue() << "--";
					yusufKoin = yusufKoin->getNext();
				}
				os << "|(" << std::fixed << std::setprecision(Utilizer::koinPrintPrecision())  << yusufBlock->getTotalValue() << ")"; 
			}
			os << "\n";
		}
		os << "\n";
		os << "-- END MINER --\n";
		return os;	
	}
}

#include "helper.h"
#include <pthread.h>
#include <semaphore.h>


sem_t *sleepSem;
sem_t semList[GRIDSIZE][GRIDSIZE];
int Qflag = 0;
sem_t *drawSem;
typedef struct ant{
	int posX;
	int posY;
	int state;
	int pid;
	sem_t sem;


}ant;
bool isInside(int x,int y){
	if(x < GRIDSIZE && y<GRIDSIZE && x >=0 && y >=0) return true;
	else return false;
}

bool checkNeighbors(int x, int y){
	if(isInside(x-1,y-1)){
		if(lookCharAt(x-1,y-1) == '-'){
			return true;
		}
	}
	if(isInside(x,y-1)){
		if(lookCharAt(x,y-1) == '-'){
			return true;
		}
	}
	if(isInside(x+1,y-1)){
		if(lookCharAt(x+1,y-1) == '-'){
			return true;
		}
	}
	if(isInside(x+1,y)){
		if(lookCharAt(x+1,y) == '-'){
			return true;
		}
	}
	if(isInside(x+1,y+1)){
		if(lookCharAt(x+1,y+1) == '-'){
			return true;
		}
	}
	if(isInside(x,y+1)){
		if(lookCharAt(x,y+1) == '-'){

			return true;
		}
	}
	if(isInside(x-1,y+1)){
		if(lookCharAt(x-1,y+1) == '-'){
			return true;
		}
	}
	if(isInside(x-1,y)){
		if(lookCharAt(x-1,y) == '-'){
			return true;
		}
	}
	return false;
}

int checkFoodCarry(int x, int y){
	if(isInside(x-1,y-1)){
		if(lookCharAt(x-1,y-1) == 'o'){
			return 1;
		}
	}
	if(isInside(x,y-1)){
		if(lookCharAt(x,y-1) == 'o'){
			return 2;
		}
	}
	if(isInside(x+1,y-1)){
		if(lookCharAt(x+1,y-1) == 'o'){
			return 3;
		}
	}
	if(isInside(x+1,y)){
		if(lookCharAt(x+1,y) == 'o'){
			return 4;
		}
	}
	if(isInside(x+1,y+1)){
		if(lookCharAt(x+1,y+1) == 'o'){

			return 5;
		}
	}
	if(isInside(x,y+1)){
		if(lookCharAt(x,y+1) == 'o'){

			return 6;
		}
	}
	if(isInside(x-1,y+1)){
		if(lookCharAt(x-1,y+1) == 'o'){
			return 7;
		}
	}
	if(isInside(x-1,y)){
		if(lookCharAt(x-1,y) == 'o'){
			return 8;
		}
	}
	return 0;
}



int checkFood(int x, int y){
	if(isInside(x-1,y-1)){
		sem_wait(&semList[x-1][y-1]);
		if(lookCharAt(x-1,y-1) == 'o'){
			return 1;
		}
		sem_post(&semList[x-1][y-1]);
	}
	if(isInside(x,y-1)){
		sem_wait(&semList[x][y-1]);
		if(lookCharAt(x,y-1) == 'o'){
			return 2;
		}
		sem_post(&semList[x][y-1]);
	}
	if(isInside(x+1,y-1)){
		sem_wait(&semList[x+1][y-1]);
		if(lookCharAt(x+1,y-1) == 'o'){
			return 3;
		}
		sem_post(&semList[x+1][y-1]);
	}
	if(isInside(x+1,y)){
		sem_wait(&semList[x+1][y]);
		if(lookCharAt(x+1,y) == 'o'){
			return 4;
		}
		sem_post(&semList[x+1][y]);
	}
	if(isInside(x+1,y+1)){
		sem_wait(&semList[x+1][y+1]);
		if(lookCharAt(x+1,y+1) == 'o'){

			return 5;
		}
		sem_post(&semList[x+1][y+1]);
	}
	if(isInside(x,y+1)){
		sem_wait(&semList[x][y+1]);
		if(lookCharAt(x,y+1) == 'o'){

			return 6;
		}
		sem_post(&semList[x][y+1]);
	}
	if(isInside(x-1,y+1)){
		sem_wait(&semList[x-1][y+1]);
		if(lookCharAt(x-1,y+1) == 'o'){
			return 7;
		}
		sem_post(&semList[x-1][y+1]);
	}
	if(isInside(x-1,y)){
		sem_wait(&semList[x-1][y]);
		if(lookCharAt(x-1,y) == 'o'){
			return 8;
		}
		sem_post(&semList[x-1][y]);
	}
	return 0;
}
bool checkPoint(int x, int y, int target){
	if (target == 0){
		if(isInside(x-1,y-1)){
			sem_wait(&semList[x-1][y-1]);
			if(lookCharAt(x-1,y-1) == '-'){
				return true;
			}
			sem_post(&semList[x-1][y-1]);
		}
	}
	else if (target == 1){
		if(isInside(x,y-1)){
			sem_wait(&semList[x][y-1]);
			if(lookCharAt(x,y-1) == '-'){
				return true;
			}
			sem_post(&semList[x][y-1]);
		}
	}
	else if (target == 2){
		if(isInside(x+1,y-1)){
			sem_wait(&semList[x+1][y-1]);
			if(lookCharAt(x+1,y-1) == '-'){
				return true;
			}
			sem_post(&semList[x+1][y-1]);
		}
	}
	else if (target == 3){
		if(isInside(x+1,y)){
			sem_wait(&semList[x+1][y]);
			if(lookCharAt(x+1,y) == '-'){
				return true;
			}
			sem_post(&semList[x+1][y]);
		}
	}
	else if (target == 4){
		if(isInside(x+1,y+1)){
			sem_wait(&semList[x+1][y+1]);
			if(lookCharAt(x+1,y+1) == '-'){
				return true;
			}
			sem_post(&semList[x+1][y+1]);
		}
	}
	else if (target == 5){
		if(isInside(x,y+1)){
			sem_wait(&semList[x][y+1]);
			if(lookCharAt(x,y+1) == '-'){
				return true;
			}
			sem_post(&semList[x][y+1]);
		}
	}
	else if (target == 6){
		if(isInside(x-1,y+1)){
			sem_wait(&semList[x-1][y+1]);
			if(lookCharAt(x-1,y+1) == '-'){
				return true;
			}
			sem_post(&semList[x-1][y+1]);
		}
	}
	else if (target == 7){
		if(isInside(x-1,y)){
			sem_wait(&semList[x-1][y]);
			if(lookCharAt(x-1,y) == '-'){
				return true;
			}
			sem_post(&semList[x-1][y]);
		}
	}

	return false;
}

void *tretFunc(void* karTemp){
	ant* yusuf;
	yusuf = karTemp;
	int a,b;
	int flag = 0;
	int fdch;
	int lastState;
	int p;
	while(1){
		usleep(getDelay() * 1000 + (rand() % 5000));
		if (Qflag)
		{
			return 0;
		}
		sem_wait(&drawSem[yusuf->pid]);

		if(yusuf->pid < getSleeperN()) {
			if(yusuf->state == 1){
				sem_wait(&semList[yusuf->posX][yusuf->posY]);
				putCharTo(yusuf->posX,yusuf->posY,'$');
				sem_post(&semList[yusuf->posX][yusuf->posY]);
			}
			else{
				sem_wait(&semList[yusuf->posX][yusuf->posY]);
				putCharTo(yusuf->posX,yusuf->posY,'S');
				sem_post(&semList[yusuf->posX][yusuf->posY]);
			}
			sem_post(&drawSem[yusuf->pid]);			
			sem_wait(&(yusuf->sem));
			
			if(yusuf->state == 1){
				sem_wait(&semList[yusuf->posX][yusuf->posY]);
				putCharTo(yusuf->posX,yusuf->posY,'P');
				sem_post(&semList[yusuf->posX][yusuf->posY]);
			}
			else{
				sem_post(&semList[yusuf->posX][yusuf->posY]);
				putCharTo(yusuf->posX,yusuf->posY,'1');
				sem_post(&semList[yusuf->posX][yusuf->posY]);
			}
			sem_post(&(yusuf->sem));
			sem_wait(&drawSem[yusuf->pid]);
		}
			
			

		if (yusuf->state == 0){ //ARA

			fdch = checkFood(yusuf->posX, yusuf->posY);
			if(fdch){
				yusuf->state = 1;
				if (fdch == 1){
					sem_wait(&semList[yusuf->posX][yusuf->posY]);
					putCharTo(yusuf->posX,yusuf->posY,'-');
					sem_post(&semList[yusuf->posX][yusuf->posY]);
					yusuf->posX = yusuf->posX-1;
					yusuf->posY = yusuf->posY-1;
					putCharTo(yusuf->posX,yusuf->posY,'P');
					sem_post(&(semList[yusuf->posX][yusuf->posY]));
				}
				else if (fdch == 2){
					sem_wait(&semList[yusuf->posX][yusuf->posY]);
					putCharTo(yusuf->posX,yusuf->posY,'-');
					sem_post(&semList[yusuf->posX][yusuf->posY]);
					yusuf->posY = yusuf->posY-1;
					putCharTo(yusuf->posX,yusuf->posY,'P');
					sem_post(&(semList[yusuf->posX][yusuf->posY]));
				}
				else if (fdch == 3){
					sem_wait(&semList[yusuf->posX][yusuf->posY]);
					putCharTo(yusuf->posX,yusuf->posY,'-');
					sem_post(&semList[yusuf->posX][yusuf->posY]);
					yusuf->posX = yusuf->posX+1;
					yusuf->posY = yusuf->posY-1;
					putCharTo(yusuf->posX,yusuf->posY,'P');
					sem_post(&(semList[yusuf->posX][yusuf->posY]));
				}
				else if (fdch == 4){
					sem_wait(&semList[yusuf->posX][yusuf->posY]);
					putCharTo(yusuf->posX,yusuf->posY,'-');
					sem_post(&semList[yusuf->posX][yusuf->posY]);
					yusuf->posX = yusuf->posX+1;
					putCharTo(yusuf->posX,yusuf->posY,'P');
					sem_post(&(semList[yusuf->posX][yusuf->posY]));
				}
				else if (fdch == 5){
					sem_wait(&semList[yusuf->posX][yusuf->posY]);
					putCharTo(yusuf->posX,yusuf->posY,'-');
					sem_post(&semList[yusuf->posX][yusuf->posY]);
					yusuf->posX = yusuf->posX+1;
					yusuf->posY = yusuf->posY+1;
					putCharTo(yusuf->posX,yusuf->posY,'P');
					sem_post(&(semList[yusuf->posX][yusuf->posY]));
				}
				else if (fdch == 6){
					sem_wait(&semList[yusuf->posX][yusuf->posY]);
					putCharTo(yusuf->posX,yusuf->posY,'-');
					sem_post(&semList[yusuf->posX][yusuf->posY]);
					yusuf->posY = yusuf->posY+1;
					putCharTo(yusuf->posX,yusuf->posY,'P');
					sem_post(&(semList[yusuf->posX][yusuf->posY]));
				}
				else if (fdch == 7){
					sem_wait(&semList[yusuf->posX][yusuf->posY]);
					putCharTo(yusuf->posX,yusuf->posY,'-');
					sem_post(&semList[yusuf->posX][yusuf->posY]);
					yusuf->posX = yusuf->posX-1;
					yusuf->posY = yusuf->posY+1;
					putCharTo(yusuf->posX,yusuf->posY,'P');
					sem_post(&(semList[yusuf->posX][yusuf->posY]));
				}
				else{
					sem_wait(&semList[yusuf->posX][yusuf->posY]);
					putCharTo(yusuf->posX,yusuf->posY,'-');
					sem_post(&semList[yusuf->posX][yusuf->posY]);
					yusuf->posX = yusuf->posX-1;
					putCharTo(yusuf->posX,yusuf->posY,'P');
					sem_post(&(semList[yusuf->posX][yusuf->posY]));
				}
			}
			else{
				for(p = 0; p < 100; p++ ){
					if (Qflag)
					{
						return 0;
					}
					a = rand() % 8;
					if(checkPoint(yusuf->posX, yusuf->posY, a))
						break;
				}
				if(p == 100){
					sem_post(&drawSem[yusuf->pid]);
					continue;
				}
				else{
					if(a == 0){
						sem_wait(&semList[yusuf->posX][yusuf->posY]);
						putCharTo(yusuf->posX,yusuf->posY,'-');
						sem_post(&semList[yusuf->posX][yusuf->posY]);
						yusuf->posX = yusuf->posX-1;
						yusuf->posY = yusuf->posY-1;
						putCharTo(yusuf->posX,yusuf->posY,'1');
						sem_post(&(semList[yusuf->posX][yusuf->posY]));
					}
					else if(a == 1){
						sem_wait(&semList[yusuf->posX][yusuf->posY]);
						putCharTo(yusuf->posX,yusuf->posY,'-');
						sem_post(&semList[yusuf->posX][yusuf->posY]);
						yusuf->posY = yusuf->posY-1;
						putCharTo(yusuf->posX,yusuf->posY,'1');
						sem_post(&(semList[yusuf->posX][yusuf->posY]));
					}
					else if(a == 2){
						sem_wait(&semList[yusuf->posX][yusuf->posY]);
						putCharTo(yusuf->posX,yusuf->posY,'-');
						sem_post(&semList[yusuf->posX][yusuf->posY]);
						yusuf->posX = yusuf->posX+1;
						yusuf->posY = yusuf->posY-1;
						putCharTo(yusuf->posX,yusuf->posY,'1');
						sem_post(&(semList[yusuf->posX][yusuf->posY]));
					}
					else if(a == 3){
						sem_wait(&semList[yusuf->posX][yusuf->posY]);
						putCharTo(yusuf->posX,yusuf->posY,'-');
						sem_post(&semList[yusuf->posX][yusuf->posY]);
						yusuf->posX = yusuf->posX+1;
						yusuf->posY = yusuf->posY;
						putCharTo(yusuf->posX,yusuf->posY,'1');
						sem_post(&(semList[yusuf->posX][yusuf->posY]));
					}
					else if(a == 4){
						sem_wait(&semList[yusuf->posX][yusuf->posY]);
						putCharTo(yusuf->posX,yusuf->posY,'-');
						sem_post(&semList[yusuf->posX][yusuf->posY]);
						yusuf->posX = yusuf->posX+1;
						yusuf->posY = yusuf->posY+1;
						putCharTo(yusuf->posX,yusuf->posY,'1');
						sem_post(&(semList[yusuf->posX][yusuf->posY]));
					}
					else if(a == 5){
						sem_wait(&semList[yusuf->posX][yusuf->posY]);
						putCharTo(yusuf->posX,yusuf->posY,'-');
						sem_post(&semList[yusuf->posX][yusuf->posY]);
						yusuf->posY = yusuf->posY+1;
						putCharTo(yusuf->posX,yusuf->posY,'1');
						sem_post(&(semList[yusuf->posX][yusuf->posY]));
					}
					else if(a == 6){
						sem_wait(&semList[yusuf->posX][yusuf->posY]);
						putCharTo(yusuf->posX,yusuf->posY,'-');
						sem_post(&semList[yusuf->posX][yusuf->posY]);
						yusuf->posX = yusuf->posX-1;
						yusuf->posY = yusuf->posY+1;
						putCharTo(yusuf->posX,yusuf->posY,'1');
						sem_post(&(semList[yusuf->posX][yusuf->posY]));
					}
					else{
						sem_wait(&semList[yusuf->posX][yusuf->posY]);
						putCharTo(yusuf->posX,yusuf->posY,'-');
						sem_post(&semList[yusuf->posX][yusuf->posY]);
						yusuf->posX = yusuf->posX-1;
						putCharTo(yusuf->posX,yusuf->posY,'1');
						sem_post(&(semList[yusuf->posX][yusuf->posY]));
					}
				}
			}
		}
		else if (yusuf->state == 1){ //TASİ
			fdch = checkFoodCarry(yusuf->posX, yusuf->posY);
			if(fdch){
				

				for(p = 0; p < 100; p++ ){
					if (Qflag)
					{
						return 0;
					}
					a = rand() % 8;
					if(checkPoint(yusuf->posX, yusuf->posY, a))
						break;
				}
				if(p == 100){
					sem_post(&drawSem[yusuf->pid]);
					continue;
				}
				else{
					yusuf->state = 2;
					if(a == 0){
						sem_wait(&semList[yusuf->posX][yusuf->posY]);
						putCharTo(yusuf->posX,yusuf->posY,'o');
						sem_post(&semList[yusuf->posX][yusuf->posY]);
						yusuf->posX = yusuf->posX-1;
						yusuf->posY = yusuf->posY-1;
						putCharTo(yusuf->posX,yusuf->posY,'1');
						sem_post(&(semList[yusuf->posX][yusuf->posY]));
					}
					else if(a == 1){
						sem_wait(&semList[yusuf->posX][yusuf->posY]);
						putCharTo(yusuf->posX,yusuf->posY,'o');
						sem_post(&semList[yusuf->posX][yusuf->posY]);
						yusuf->posY = yusuf->posY-1;
						putCharTo(yusuf->posX,yusuf->posY,'1');
						sem_post(&(semList[yusuf->posX][yusuf->posY]));
					}
					else if(a == 2){
						sem_wait(&semList[yusuf->posX][yusuf->posY]);
						putCharTo(yusuf->posX,yusuf->posY,'o');
						sem_post(&semList[yusuf->posX][yusuf->posY]);
						yusuf->posX = yusuf->posX+1;
						yusuf->posY = yusuf->posY-1;
						putCharTo(yusuf->posX,yusuf->posY,'1');
						sem_post(&(semList[yusuf->posX][yusuf->posY]));
					}
					else if(a == 3){
						sem_wait(&semList[yusuf->posX][yusuf->posY]);
						putCharTo(yusuf->posX,yusuf->posY,'o');
						sem_post(&semList[yusuf->posX][yusuf->posY]);
						yusuf->posX = yusuf->posX+1;
						putCharTo(yusuf->posX,yusuf->posY,'1');
						sem_post(&(semList[yusuf->posX][yusuf->posY]));
					}
					else if(a == 4){
						sem_wait(&semList[yusuf->posX][yusuf->posY]);
						putCharTo(yusuf->posX,yusuf->posY,'o');
						sem_post(&semList[yusuf->posX][yusuf->posY]);
						yusuf->posX = yusuf->posX+1;
						yusuf->posY = yusuf->posY+1;
						putCharTo(yusuf->posX,yusuf->posY,'1');
						sem_post(&(semList[yusuf->posX][yusuf->posY]));
					}
					else if(a == 5){
						sem_wait(&semList[yusuf->posX][yusuf->posY]);
						putCharTo(yusuf->posX,yusuf->posY,'o');
						sem_post(&semList[yusuf->posX][yusuf->posY]);
						yusuf->posY = yusuf->posY+1;
						putCharTo(yusuf->posX,yusuf->posY,'1');
						sem_post(&(semList[yusuf->posX][yusuf->posY]));
					}
					else if(a == 6){
						sem_wait(&semList[yusuf->posX][yusuf->posY]);
						putCharTo(yusuf->posX,yusuf->posY,'o');
						sem_post(&semList[yusuf->posX][yusuf->posY]);
						yusuf->posX = yusuf->posX-1;
						yusuf->posY = yusuf->posY+1;
						putCharTo(yusuf->posX,yusuf->posY,'1');
						sem_post(&(semList[yusuf->posX][yusuf->posY]));
					}
					else{
						sem_wait(&semList[yusuf->posX][yusuf->posY]);
						putCharTo(yusuf->posX,yusuf->posY,'o');
						sem_post(&semList[yusuf->posX][yusuf->posY]);
						yusuf->posX = yusuf->posX-1;
						putCharTo(yusuf->posX,yusuf->posY,'1');
						sem_post(&(semList[yusuf->posX][yusuf->posY]));
					}
				}
			}
			else{
				for(p = 0; p < 100; p++ ){
					if (Qflag)
					{
						return 0;
					}
					a = rand() % 8;
					if(checkPoint(yusuf->posX, yusuf->posY, a))
						break;
				}
				if(p == 100){
					sem_post(&drawSem[yusuf->pid]);
					continue;
				}
				else{
					if(a == 0){
						sem_wait(&semList[yusuf->posX][yusuf->posY]);
						putCharTo(yusuf->posX,yusuf->posY,'-');
						sem_post(&semList[yusuf->posX][yusuf->posY]);
						yusuf->posX = yusuf->posX-1;
						yusuf->posY = yusuf->posY-1;
						putCharTo(yusuf->posX,yusuf->posY,'P');
						sem_post(&(semList[yusuf->posX][yusuf->posY]));
					}
					else if(a == 1){
						sem_wait(&semList[yusuf->posX][yusuf->posY]);
						putCharTo(yusuf->posX,yusuf->posY,'-');
						sem_post(&semList[yusuf->posX][yusuf->posY]);
						yusuf->posY = yusuf->posY-1;
						putCharTo(yusuf->posX,yusuf->posY,'P');
						sem_post(&(semList[yusuf->posX][yusuf->posY]));
					}
					else if(a == 2){
						sem_wait(&semList[yusuf->posX][yusuf->posY]);
						putCharTo(yusuf->posX,yusuf->posY,'-');
						sem_post(&semList[yusuf->posX][yusuf->posY]);
						yusuf->posX = yusuf->posX+1;
						yusuf->posY = yusuf->posY-1;
						putCharTo(yusuf->posX,yusuf->posY,'P');
						sem_post(&(semList[yusuf->posX][yusuf->posY]));
					}
					else if(a == 3){
						sem_wait(&semList[yusuf->posX][yusuf->posY]);
						putCharTo(yusuf->posX,yusuf->posY,'-');
						sem_post(&semList[yusuf->posX][yusuf->posY]);
						yusuf->posX = yusuf->posX+1;
						putCharTo(yusuf->posX,yusuf->posY,'P');
						sem_post(&(semList[yusuf->posX][yusuf->posY]));
					}
					else if(a == 4){
						sem_wait(&semList[yusuf->posX][yusuf->posY]);
						putCharTo(yusuf->posX,yusuf->posY,'-');
						sem_post(&semList[yusuf->posX][yusuf->posY]);
						yusuf->posX = yusuf->posX+1;
						yusuf->posY = yusuf->posY+1;
						putCharTo(yusuf->posX,yusuf->posY,'P');
						sem_post(&(semList[yusuf->posX][yusuf->posY]));
					}
					else if(a == 5){
						sem_wait(&semList[yusuf->posX][yusuf->posY]);
						putCharTo(yusuf->posX,yusuf->posY,'-');
						sem_post(&semList[yusuf->posX][yusuf->posY]);
						yusuf->posY = yusuf->posY+1;
						putCharTo(yusuf->posX,yusuf->posY,'P');
						sem_post(&(semList[yusuf->posX][yusuf->posY]));
					}
					else if(a == 6){
						sem_wait(&semList[yusuf->posX][yusuf->posY]);
						putCharTo(yusuf->posX,yusuf->posY,'-');
						sem_post(&semList[yusuf->posX][yusuf->posY]);
						yusuf->posX = yusuf->posX-1;
						yusuf->posY = yusuf->posY+1;
						putCharTo(yusuf->posX,yusuf->posY,'P');
						sem_post(&(semList[yusuf->posX][yusuf->posY]));
					}
					else{
						sem_wait(&semList[yusuf->posX][yusuf->posY]);
						putCharTo(yusuf->posX,yusuf->posY,'-');
						sem_post(&semList[yusuf->posX][yusuf->posY]);
						yusuf->posX = yusuf->posX-1;
						putCharTo(yusuf->posX,yusuf->posY,'P');
						sem_post(&(semList[yusuf->posX][yusuf->posY]));
					}
				}
			}
		}
		else if (yusuf->state == 2){ // YORUL
			yusuf->state = 0;
			for(p = 0; p < 100; p++ ){
				if (Qflag)
				{
					return 0;
				}
				a = rand() % 8;
				if(checkPoint(yusuf->posX, yusuf->posY, a))
					break;
			}
			if(p == 100){
				sem_post(&drawSem[yusuf->pid]);
				continue;
			}
			else{
				if(a == 0){
					sem_wait(&semList[yusuf->posX][yusuf->posY]);
					putCharTo(yusuf->posX,yusuf	->posY,'-');
					sem_post(&semList[yusuf->posX][yusuf->posY]);
					yusuf->posX = yusuf->posX-1;
					yusuf->posY = yusuf->posY-1;
					putCharTo(yusuf->posX,yusuf->posY,'1');
					sem_post(&(semList[yusuf->posX][yusuf->posY]));
				}
				else if(a == 1){
					sem_wait(&semList[yusuf->posX][yusuf->posY]);
					putCharTo(yusuf->posX,yusuf	->posY,'-');
					sem_post(&semList[yusuf->posX][yusuf->posY]);
					yusuf->posY = yusuf->posY-1;
					putCharTo(yusuf->posX,yusuf->posY,'1');
					sem_post(&(semList[yusuf->posX][yusuf->posY]));
				}
				else if(a == 2){
					sem_wait(&semList[yusuf->posX][yusuf->posY]);
					putCharTo(yusuf->posX,yusuf	->posY,'-');
					sem_post(&semList[yusuf->posX][yusuf->posY]);
					yusuf->posX = yusuf->posX+1;
					yusuf->posY = yusuf->posY-1;
					putCharTo(yusuf->posX,yusuf->posY,'1');
					sem_post(&(semList[yusuf->posX][yusuf->posY]));
				}
				else if(a == 3){
					sem_wait(&semList[yusuf->posX][yusuf->posY]);
					putCharTo(yusuf->posX,yusuf	->posY,'-');
					sem_post(&semList[yusuf->posX][yusuf->posY]);
					yusuf->posX = yusuf->posX+1;
					putCharTo(yusuf->posX,yusuf->posY,'1');
					sem_post(&(semList[yusuf->posX][yusuf->posY]));
				}
				else if(a == 4){
					sem_wait(&semList[yusuf->posX][yusuf->posY]);
					putCharTo(yusuf->posX,yusuf	->posY,'-');
					sem_post(&semList[yusuf->posX][yusuf->posY]);
					yusuf->posX = yusuf->posX+1;
					yusuf->posY = yusuf->posY+1;
					putCharTo(yusuf->posX,yusuf->posY,'1');
					sem_post(&(semList[yusuf->posX][yusuf->posY]));
				}
				else if(a == 5){
					sem_wait(&semList[yusuf->posX][yusuf->posY]);
					putCharTo(yusuf->posX,yusuf	->posY,'-');
					sem_post(&semList[yusuf->posX][yusuf->posY]);
					yusuf->posY = yusuf->posY+1;
					putCharTo(yusuf->posX,yusuf->posY,'1');
					sem_post(&(semList[yusuf->posX][yusuf->posY]));
				}
				else if(a == 6){
					sem_wait(&semList[yusuf->posX][yusuf->posY]);
					putCharTo(yusuf->posX,yusuf	->posY,'-');
					sem_post(&semList[yusuf->posX][yusuf->posY]);
					yusuf->posX = yusuf->posX-1;
					yusuf->posY = yusuf->posY+1;
					putCharTo(yusuf->posX,yusuf->posY,'1');
					sem_post(&(semList[yusuf->posX][yusuf->posY]));
				}
				else{
					sem_wait(&semList[yusuf->posX][yusuf->posY]);
					putCharTo(yusuf->posX,yusuf	->posY,'-');
					sem_post(&semList[yusuf->posX][yusuf->posY]);
					yusuf->posX = yusuf->posX-1;
					putCharTo(yusuf->posX,yusuf->posY,'1');
					sem_post(&(semList[yusuf->posX][yusuf->posY]));
				}
			}
		}
		sem_post(&drawSem[yusuf->pid]);
	}
	return 0;
}


int main(int argc, char *argv[]) {
    srand(time(NULL));

    //////////////////////////////
    // Fills the grid randomly to have somthing to draw on screen.
    // Empty spaces have to be -.
    // You should get the number of ants and foods from the arguments 
    // and make sure that a food and an ant does not placed at the same cell.
    // You must use putCharTo() and lookCharAt() to access/change the grid.
    // You should be delegating ants to separate threads
    int i,j,antNumber,feedNumber,max_time;
    antNumber = atoi(argv[1]);
    feedNumber = atoi(argv[2]);
    max_time = atoi(argv[3]);
    
    for (i = 0; i < GRIDSIZE; i++) {
        for (j = 0; j < GRIDSIZE; j++) {
            putCharTo(i, j, '-');
        }
    }
    int a,b;

    //ant *karArr = malloc(sizeof(antNumber))

    drawSem = malloc(antNumber*sizeof(sem_t));
    for (int i = 0; i <antNumber; ++i)
    {
    	sem_init(&drawSem[i],0,1);
    }

    for (int i = 0; i < GRIDSIZE; ++i)
    {
    	for (int j = 0; j < GRIDSIZE; ++j)
    	{
    		sem_init(&semList[i][j],0,1);
    	}
    }

    for (i = 0; i < feedNumber; i++) {
        do {
            a = rand() % GRIDSIZE;
            b = rand() % GRIDSIZE;
        }while (lookCharAt(a,b) != '-');
        putCharTo(a, b, 'o');
    }
    pthread_t plist[antNumber];
    sem_init(&sleepSem,0,1);
    ant *antList = malloc(antNumber*sizeof(ant));
    for (i = 0; i < antNumber; i++) {
        do {
            a = rand() % GRIDSIZE;
            b = rand() % GRIDSIZE;
        }while (lookCharAt(a,b) != '-');
        putCharTo(a, b, '1');
    	antList[i].pid = i;
	    antList[i].posX = a;
	    antList[i].posY = b;
	    antList[i].state = 0;
    	sem_init(&(antList[i].sem),0,1);
    	pthread_create(&plist[i], NULL, tretFunc, (void*) &antList[i]);
    }

    //////////////////////////////
    

    // you have to have following command to initialize ncurses.
    
    // You can use following loop in your program. But pay attention to 
    // the function calls, they do not have any access control, you 
    // have to ensure that.

    startCurses();
    char c;
    time_t start = time(NULL);
    time_t finish;
    finish = start + max_time;
    while (start < finish) {
	//while (1) {
    	start= time(NULL);

    	for (int i = getSleeperN(); i < antNumber; ++i)
    	{
    		sem_wait(&drawSem[i]);
    	}
        drawWindow();
        for (int i = getSleeperN(); i < antNumber; ++i)
        {
        	sem_post(&drawSem[i]);
        }
        c = 0;
        c = getch();

        if (c == 'q' || c == ESC){
        	Qflag = 1;
        	break;
        }
        if (c == '+') {
            setDelay(getDelay()+10);
        }
        if (c == '-') {
            setDelay(getDelay()-10);
        }
        if (c == '*') {
            setSleeperN(getSleeperN()+1);
            if (getSleeperN() <= antNumber ){
        		sem_wait(&(antList[getSleeperN()-1].sem));
           	}
        }
        if (c == '/') {
            setSleeperN(getSleeperN()-1);
            if (getSleeperN() <=antNumber){
            	sem_post(&(antList[getSleeperN()].sem));
            }
        }
        usleep(DRAWDELAY);
        //each ant thread have to sleep with code similar to this
        //usleep(getDelay() * 10000 + (rand() % 5000));
    }
    
    // do not forget freeing the resources you get
    endCurses();

	Qflag = 1;
	

    for (int i = 0; i < antNumber; ++i)
    {
    	sem_post(&(antList[i].sem));
    }


    for (int i = 0; i < antNumber; ++i){
    	pthread_join(plist[i],NULL);
    }
    
	free(antList);
	free(drawSem);
    return 0;
}

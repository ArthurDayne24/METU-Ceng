#include <sys/select.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <stdbool.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <errno.h>
#include <stdio.h>
#include <signal.h>
#include <limits.h>
#define PIPE(fd) socketpair(AF_UNIX, SOCK_STREAM, PF_UNIX, fd)
#define Data1 "In Xanadu, did Kublai Khan..."
char* itoa(int val, int base){
	static char buf[32] = {0};
	int i = 30;
	for(; val && i ; --i, val /= base)
		buf[i] = "0123456789abcdef"[val % base];
	return &buf[i+1];	
}
void tarla_bas(char **tarla,int x_tarla, int y_tarla){
	int i,j;
	printf("%c",'+');
	for (i = 0; i < y_tarla; i++)
		printf("%c",'-');
	printf("%c\n", '+' );
	for (i = 0; i < x_tarla; i++)
	{
		printf("%c", '|' );
		for (j= 0; j < y_tarla; j++)
			printf("%c", tarla[i][j] );
		printf("%c\n", '|' );
	}
	printf("%c",'+');
	for (i = 0; i < y_tarla; i++)
		printf("%c",'-');
	printf("%c\n", '+' );
}
typedef struct coordinate {
	int x;
	int y;
} coordinate;
typedef struct server_message {
	coordinate pos;
	coordinate adv_pos;
	int object_count;
	coordinate object_pos[4];
} server_message;
typedef struct ph_message {
	coordinate move_request;
} ph_message;
bool is_open(int *array, int number){
    for (int i = 0; i < number; i++)
    {
        if(array[i] == 1)
            return true;
    }
    return false;
}
bool is_validH(ph_message file_responseH, char **tarla){
	if (tarla[file_responseH.move_request.x][file_responseH.move_request.y] == 'H')
		return false;
	return true;
}
bool is_validP(ph_message file_responseP, char **tarla){
	if (tarla[file_responseP.move_request.x][file_responseP.move_request.y] == 'P')
		return false;
	return true;
}
int main(){
	int yusuf,i, j, P_no, H_no, X_no, x_tarla,y_tarla,count;
	scanf("%d %d", &x_tarla, &y_tarla);
    char *tarla[x_tarla];
    for (i=0; i<x_tarla; i++)
        tarla[i] = (char *)malloc(y_tarla * sizeof(char));
    count = 0;
    for (i = 0; i <  x_tarla; i++)
      	for (j = 0; j < y_tarla; j++)
         tarla[i][j] = ' ';
	scanf("%d", &X_no);
	int *Obstacles[X_no];
	for (i=0; i<X_no; i++)
        Obstacles[i] = (int *)malloc(2 * sizeof(int));
	
    for (i = 0; i < X_no; i++)
	{
		scanf("%d %d", &Obstacles[i][0], &Obstacles[i][1]);
		tarla[Obstacles[i][0]][Obstacles[i][1]] = 'X';
	}
	scanf("%d", &H_no);
	int *Hunters[H_no];
	for (i=0; i<H_no; i++)
        Hunters[i] = (int *)malloc(4 * sizeof(int));
    for (i = 0; i < H_no; i++)
	{
		int s;
		scanf("%d %d %d", &Hunters[i][0], &Hunters[i][1], &Hunters[i][2]);
		Hunters[i][3] = 1;
		tarla[Hunters[i][0]][Hunters[i][1]] = 'H';
	}
	scanf("%d", &P_no);
	int *Preys[P_no];
	for (i=0; i<P_no; i++)
        Preys[i] = (int *)malloc(4 * sizeof(int));
    for (i = 0; i < P_no; i++)
	{
		scanf(" %d %d %d", &Preys[i][0], &Preys[i][1], &Preys[i][2]);
		Preys[i][3] = 1;
		tarla[Preys[i][0]][Preys[i][1]] = 'P';
	}
 	tarla_bas(tarla, x_tarla, y_tarla);
 	fflush(stderr);
    fflush(stdin);
    fflush(stdout);
	int H_Pd[H_no][2];
	pid_t proc_idsH[H_no];
	for (int i = 0; i < H_no; i++)
	{
		pid_t temp_pid;
		PIPE(H_Pd[i]);
		if((temp_pid = fork()) == 0){
			close(H_Pd[i][0]);
			dup2(H_Pd[i][1],1);
			dup2(H_Pd[i][1],0);
			close(H_Pd[i][1]);
			execl("./hunter", "./hunter",itoa(y_tarla,10), itoa(x_tarla,10), (char*)0);
		}
		else{
			proc_idsH[i] = temp_pid;
		}
	}
	int P_Pd[P_no][2];
	pid_t proc_idsP[P_no];
    for (int i = 0; i < P_no; i++)
	{
		pid_t temp_pid;
		PIPE(P_Pd[i]);
		if((temp_pid = fork()) == 0){
			close(P_Pd[i][0]);
			dup2(P_Pd[i][1],1);
			dup2(P_Pd[i][1],0);
			close(P_Pd[i][1]);
			execl("./prey", "./prey",itoa(y_tarla,10), itoa(x_tarla,10), (char *)0);
			
		}else{
			proc_idsP[i] = temp_pid;
		}
	}
	server_message send_to_prey;
	server_message send_to_hunter;
	int w,r;
	for (int i = 0; i < H_no; i++)
	{
		send_to_hunter.pos.x = Hunters[i][0];
		send_to_hunter.pos.y = Hunters[i][1];
		int minx, miny;
		int min = INT_MAX;
		for (int j = 0; j < P_no ; j++)
		{
			if (Preys[j][3] && abs(Hunters[i][0]-Preys[j][0]) + abs(Hunters[i][1]- Preys[j][1]) < min)
			{
				min = abs(Hunters[i][0]-Preys[j][0]) + abs(Hunters[i][1]- Preys[j][1]);
				minx = Preys[j][0];
				miny = Preys[j][1];
			}
		}
		send_to_hunter.adv_pos.x = minx;
		send_to_hunter.adv_pos.y = miny;
		send_to_hunter.object_count = 0;
		int k = 0;
		if (Hunters[i][0]-1 >= 0)
		{
			if (tarla[Hunters[i][0]-1][Hunters[i][1]] == 'X' || tarla[Hunters[i][0]-1][Hunters[i][1]] == 'H' )
			{
				send_to_hunter.object_pos[k].x = Hunters[i][0]-1;
				send_to_hunter.object_pos[k].y = Hunters[i][1];
				send_to_hunter.object_count++;
				k++;
			}
		}
		if (Hunters[i][0]+1 <= x_tarla-1)
		{
			if (tarla[Hunters[i][0]+1][Hunters[i][1]] == 'X' || tarla[Hunters[i][0]+1][Hunters[i][1]] == 'H' )
			{
				send_to_hunter.object_pos[k].x = Hunters[i][0]+1;
				send_to_hunter.object_pos[k].y = Hunters[i][1];
				send_to_hunter.object_count++;
				k++;
			}
		}
		if (Hunters[i][1]-1 >= 0)
		{
			if (tarla[Hunters[i][0]][Hunters[i][1]-1] == 'X' || tarla[Hunters[i][0]][Hunters[i][1]-1] == 'H' )
			{
				send_to_hunter.object_pos[k].x = Hunters[i][0];
				send_to_hunter.object_pos[k].y = Hunters[i][1]-1;
				k++;
				send_to_hunter.object_count++;
			}
		}
		if (Hunters[i][1]+1 <= y_tarla-1)
		{
			if (tarla[Hunters[i][0]][Hunters[i][1]+1] == 'X' || tarla[Hunters[i][0]][Hunters[i][1]+1] == 'H' )
			{
				send_to_hunter.object_pos[k].x = Hunters[i][0];
				send_to_hunter.object_pos[k].y = Hunters[i][1]+1;
				k++;
				send_to_hunter.object_count++;
			}
		}
		w = write(H_Pd[i][0],&send_to_hunter, sizeof(send_to_hunter));
		FILE *file = fdopen(P_Pd[i][0],"w");
		fflush(file);
 	}
 	for (int i = 0; i < P_no; i++)
 	{
    	send_to_prey.pos.x = Preys[i][0];
    	send_to_prey.pos.y = Preys[i][1];
    	int minx, miny;
		int min = INT_MAX;
		for (int j = 0; j < H_no ; j++)
		{
			if (Hunters[j][3] && abs(Preys[i][0]-Hunters[j][0]) + abs(Preys[i][1]- Hunters[j][1]) < min)
			{
				min = abs(Preys[i][0]-Hunters[j][0]) + abs(Preys[i][1]- Hunters[j][1]);
				minx = Hunters[j][0];
				miny = Hunters[j][1];
			}
		}
		send_to_prey.adv_pos.x = minx;
		send_to_prey.adv_pos.y = miny;	
		send_to_prey.object_count = 0;
		int k = 0;
		if (Preys[i][0]-1 >=0)
		{
			if (tarla[Preys[i][0]-1][Preys[i][1]] == 'X' || tarla[Preys[i][0]-1][Preys[i][1]] == 'P')
			{
				send_to_prey.object_pos[k].x = Preys[i][0]-1;
				send_to_prey.object_pos[k].y = Preys[i][1];
				k++;
				send_to_prey.object_count++;
			}
		}
		if (Preys[i][0]+1 <= x_tarla-1)
		{
			if (tarla[Preys[i][0]+1][Preys[i][1]] == 'X' || tarla[Preys[i][0]+1][Preys[i][1]] == 'P')
			{
				send_to_prey.object_pos[k].x = Preys[i][0]+1;
				send_to_prey.object_pos[k].y = Preys[i][1];
				k++;
				send_to_prey.object_count++;
			}
		}
		if (Preys[i][1]-1 >= 0)
		{
			if (tarla[Preys[i][0]][Preys[i][1]-1] == 'X' || tarla[Preys[i][0]][Preys[i][1]-1] == 'P')
			{
				send_to_prey.object_pos[k].x = Preys[i][0];
				send_to_prey.object_pos[k].y = Preys[i][1]-1;
				k++;
				send_to_prey.object_count++;
			}
		}
		if (Preys[i][1]+1 <= y_tarla-1)
		{
			if (tarla[Preys[i][0]][Preys[i][1]+1] == 'X' || tarla[Preys[i][0]][Preys[i][1]+1] == 'P')
			{
				send_to_prey.object_pos[k].x = Preys[i][0];
				send_to_prey.object_pos[k].y = Preys[i][1]+1;
				k++;
				send_to_prey.object_count++;
			}
		}
		w = write(P_Pd[i][0],&send_to_prey, sizeof(send_to_prey));
		FILE *file = fdopen(P_Pd[i][0],"w");
		fflush(file);
 	}
	ph_message file_responseP;
	ph_message file_responseH;
 	char mess[40];
    int maximum_P = 0;
    int maximum_H = 0;
    int maximum;
    int openH[H_no];
    int openP[P_no];
    for (int i = 0; i < H_no; i++)
        openH[i] = 1;
    for (int i = 0; i < P_no; i++)
        openP[i] = 1;
    for(int i=0;i<P_no;i++)
    {
        if(maximum_P< P_Pd[i][0])
            maximum_P=P_Pd[i][0];
    }
    for(int i=0;i<H_no;i++)
    {
        if(maximum_H< H_Pd[i][0])
            maximum_H=H_Pd[i][0];
    }
    if (maximum_H > maximum_P)
    	maximum = maximum_H;
    else
    	maximum = maximum_P;
    maximum++;
    while(is_open(openP,P_no) && is_open(openH,H_no)){
    	fd_set readset ;
        FD_ZERO(&readset);
        for (int i = 0; i < P_no; i++)
        {
            if (openP[i])
            {
                FD_SET(P_Pd[i][0],&readset);
            }
        }
        for (int i = 0; i < H_no; i++)
        {
            if (openH[i])
            {
                FD_SET(H_Pd[i][0],&readset);
            }
        }
        select(maximum, &readset, NULL, NULL, NULL);
        for (int i = 0; i < H_no; i++)
        {
            if (Hunters[i][3] && FD_ISSET(H_Pd[i][0], &readset))
            {
                r = read(H_Pd[i][0], &file_responseH, sizeof(file_responseH));
                FILE *file = fdopen(H_Pd[i][0],"w");
				fflush(file);
          		if (is_validH(file_responseH, tarla))
          		{
          			if (tarla[file_responseH.move_request.x][file_responseH.move_request.y] != 'P')
	                {
	                	if (!(file_responseH.move_request.x == Hunters[i][0] && file_responseH.move_request.y == Hunters[i][1] ))
	                	{
		                	if (Hunters[i][2] > 1)
		                	{
		                		tarla[Hunters[i][0]][Hunters[i][1]] = ' ';
				                Hunters[i][0] = file_responseH.move_request.x;
				                Hunters[i][1] = file_responseH.move_request.y;
				                tarla[Hunters[i][0]][Hunters[i][1]] = 'H';
				                Hunters[i][2]--;
				                tarla_bas(tarla, x_tarla, y_tarla);
				                FILE *file = fdopen(H_Pd[i][0],"w");
				                fflush(file);
		                	}
		                	else{
		                		tarla[Hunters[i][0]][Hunters[i][1]] = ' ';
		    					tarla_bas(tarla, x_tarla, y_tarla);
		                	    FILE *file = fdopen(H_Pd[i][0],"w");
				                fflush(file);
		                		openH[i] = 0;
		                		close(H_Pd[i][0]);
		                		Hunters[i][3] = 0;
		                		kill(proc_idsH[i],SIGTERM);
		                		waitpid(proc_idsH[i],&yusuf,WNOHANG);
				            }
	                	}
	                }
	                else{
	                	tarla[Hunters[i][0]][Hunters[i][1]] = ' ';
		                Hunters[i][0] = file_responseH.move_request.x;
		                Hunters[i][1] = file_responseH.move_request.y;
		                tarla[Hunters[i][0]][Hunters[i][1]] = 'H';
		                tarla_bas(tarla, x_tarla, y_tarla);
			            FILE *file = fdopen(P_Pd[i][0],"w");
					    fflush(file);
		                for (int j = 0; j < P_no; j++)
		                {
		                	if (Preys[j][0]== file_responseH.move_request.x && Preys[j][1] == file_responseH.move_request.y)
		                	{
		                		Hunters[i][2] += Preys[j][2];
	    				   		openP[j] = 0;
		                		Preys[j][3] = 0;
		                		close(P_Pd[j][0]);
		                		kill(proc_idsP[j],SIGTERM);
		                		waitpid(proc_idsP[i],&yusuf,WNOHANG);
		                		break;
		                	}
		                }
			        }
          		}
				send_to_hunter.pos.x = Hunters[i][0];
            	send_to_hunter.pos.y = Hunters[i][1];
            	int minx, miny;
				int min = INT_MAX;
				for (int j = 0; j < P_no ; j++)
				{
					if (Preys[j][3] && (abs(Hunters[i][0]-Preys[j][0]) + abs(Hunters[i][1]- Preys[j][1]) < min))
					{
						min = abs(Hunters[i][0]-Preys[j][0]) + abs(Hunters[i][1]- Preys[j][1]);
						minx = Preys[j][0];
						miny = Preys[j][1];
					}
				}
				send_to_hunter.adv_pos.x = minx;
				send_to_hunter.adv_pos.y = miny;
				send_to_hunter.object_count = 0;
				int k = 0;
				if (Hunters[i][0]-1 >= 0)
				{
					if (tarla[Hunters[i][0]-1][Hunters[i][1]] == 'X' || tarla[Hunters[i][0]-1][Hunters[i][1]] == 'H' )
					{
						send_to_hunter.object_pos[k].x = Hunters[i][0]-1;
						send_to_hunter.object_pos[k].y = Hunters[i][1];
						send_to_hunter.object_count++;
						k++;
					}
				}
				if (Hunters[i][0]+1 <= x_tarla-1)
				{
					if (tarla[Hunters[i][0]+1][Hunters[i][1]] == 'X' || tarla[Hunters[i][0]+1][Hunters[i][1]] == 'H' )
					{
						send_to_hunter.object_pos[k].x = Hunters[i][0]+1;
						send_to_hunter.object_pos[k].y = Hunters[i][1];
						send_to_hunter.object_count++;
						k++;
					}
				}
				if (Hunters[i][1]-1 >= 0)
				{
					if (tarla[Hunters[i][0]][Hunters[i][1]-1] == 'X' || tarla[Hunters[i][0]][Hunters[i][1]-1] == 'H' )
					{
						send_to_hunter.object_pos[k].x = Hunters[i][0];
						send_to_hunter.object_pos[k].y = Hunters[i][1]-1;
						k++;
						send_to_hunter.object_count++;
					}
				}
				if (Hunters[i][1]+1 <= y_tarla-1)
				{
					if (tarla[Hunters[i][0]][Hunters[i][1]+1] == 'X' || tarla[Hunters[i][0]][Hunters[i][1]+1] == 'H' )
					{
						send_to_hunter.object_pos[k].x = Hunters[i][0];
						send_to_hunter.object_pos[k].y = Hunters[i][1]+1;
						k++;
						send_to_hunter.object_count++;
					}
				}
				w = write(H_Pd[i][0],&send_to_hunter, sizeof(send_to_hunter));
				FILE *file2 = fdopen(H_Pd[i][0],"w");
			    fflush(file2); 
            }
        }
        if (!is_open(openH, H_no))
        	break;
        for (int i = 0; i < P_no; i++)
        {   
        	if (Preys[i][3] &&  FD_ISSET(P_Pd[i][0], &readset))
            {
                r = read(P_Pd[i][0], &file_responseP,sizeof(file_responseP));
                FILE *file = fdopen(P_Pd[i][0],"w");
				fflush(file);
                if (is_validP(file_responseP , tarla))
                {
	                	/* code */
                	if (!(file_responseP.move_request.x == Preys[i][0] && file_responseP.move_request.y == Preys[i][1]))
                	{
	                		/* code */
		                int fofo = 0;
		                int lucky_hunter; 
		                for (int j = 0; j < H_no; j++)
		                {
		                	if(Hunters[j][3] && file_responseP.move_request.x == Hunters[j][0] && file_responseP.move_request.y == Hunters[j][1]){
		                		fofo = 1;
		                		lucky_hunter = j; 
		                		break;
		                	}
		                }
		                if (fofo == 0)
		                {
			                tarla[Preys[i][0]][Preys[i][1]] = ' ';
			                Preys[i][0] = file_responseP.move_request.x;
			                Preys[i][1] = file_responseP.move_request.y;
			                tarla[Preys[i][0]][Preys[i][1]] = 'P';
			                tarla_bas(tarla, x_tarla,y_tarla);
			                FILE *file = fdopen(P_Pd[i][0],"w");
			                fflush(file);
		                }
		                else{
		                	Hunters[lucky_hunter][2] += Preys[i][2];
		                	tarla[Preys[i][0]][Preys[i][1]] = ' ';
		                	tarla_bas(tarla, x_tarla, y_tarla);
		    				openP[i] = 0;
		                	Preys[i][3] = 0;
		                	close(P_Pd[i][0]);
		                	kill(proc_idsP[i],SIGTERM);
		                	waitpid(proc_idsP[i],&yusuf,WNOHANG);
		                }
	                }
            	}
            	send_to_prey.pos.x = Preys[i][0];
            	send_to_prey.pos.y = Preys[i][1];
            	int minx, miny;
				int min = INT_MAX;
				for (int j = 0; j < H_no ; j++)
				{
					if (Hunters[j][3] && (abs(Preys[i][0]-Hunters[j][0]) + abs(Preys[i][1]- Hunters[j][1]) < min))
					{
						min = abs(Preys[i][0]-Hunters[j][0]) + abs(Preys[i][1]- Hunters[j][1]);
						minx = Hunters[j][0];
						miny = Hunters[j][1];
					}
				}
				send_to_prey.adv_pos.x = minx;
				send_to_prey.adv_pos.y = miny;
				send_to_prey.object_count = 0;
				int k = 0;
				if (Preys[i][0]-1 >=0)
				{
					if (tarla[Preys[i][0]-1][Preys[i][1]] == 'X' || tarla[Preys[i][0]-1][Preys[i][1]] == 'P')
					{
						send_to_prey.object_pos[k].x = Preys[i][0]-1;
						send_to_prey.object_pos[k].y = Preys[i][1];
						k++;
						send_to_prey.object_count++;
					}
				}
				if (Preys[i][0]+1 <= x_tarla-1)
				{
					if (tarla[Preys[i][0]+1][Preys[i][1]] == 'X' || tarla[Preys[i][0]+1][Preys[i][1]] == 'P')
					{
						send_to_prey.object_pos[k].x = Preys[i][0]+1;
						send_to_prey.object_pos[k].y = Preys[i][1];
						k++;
						send_to_prey.object_count++;
					}
				}
				if (Preys[i][1]-1 >= 0)
				{
					if (tarla[Preys[i][0]][Preys[i][1]-1] == 'X' || tarla[Preys[i][0]][Preys[i][1]-1] == 'P')
					{
						send_to_prey.object_pos[k].x = Preys[i][0];
						send_to_prey.object_pos[k].y = Preys[i][1]-1;
						k++;
						send_to_prey.object_count++;
					}
				}
				if (Preys[i][1]+1 <= y_tarla-1)
				{
					if (tarla[Preys[i][0]][Preys[i][1]+1] == 'X' || tarla[Preys[i][0]][Preys[i][1]+1] == 'P')
					{
						send_to_prey.object_pos[k].x = Preys[i][0];
						send_to_prey.object_pos[k].y = Preys[i][1]+1;
						k++;
						send_to_prey.object_count++;
					}
				}
				w = write(P_Pd[i][0],&send_to_prey, sizeof(send_to_prey));
				FILE *file2 = fdopen(P_Pd[i][0],"w");
			    fflush(file2);
            }
        }
    }
    for (int i = 0; i < P_no; i++)
    {
    	if(openP[i] == 1){
    		close(P_Pd[i][0]);
			kill(proc_idsP[i],SIGTERM);
			waitpid(proc_idsP[i],&yusuf,WNOHANG);
    	}
    }
    for (int i = 0; i < H_no; i++)
    {
    	if(openH[i] == 1){
    		close(H_Pd[i][0]);
			kill(proc_idsH[i],SIGTERM);
			waitpid(proc_idsH[i],&yusuf,WNOHANG);
    	}
    }
   return 0;
}
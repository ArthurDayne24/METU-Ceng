#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct slices
{
	int stpslc;
	char dir;
	char* data;
	struct slices *left;
	struct slices *right;
}slice;

slice* create_slice(char* xdata,char xdir, int xstpslc)
{
	slice *newone;
	newone = (slice*)malloc(sizeof(slice));
	newone->data = xdata;
	newone->dir = xdir;
	newone->stpslc = xstpslc;
	newone->right = NULL;
	newone->left = NULL;
	return newone;
}


int main()
{
	int i = 1;
	int buldum = 0;
	slice *firstslice = NULL;
	char currentdirection = 'R';
	slice *currentslice = NULL ;
	currentslice = (slice*)malloc(sizeof(slice));  
	currentslice -> right = currentslice;
	currentslice -> left = currentslice;
	while(1)
	{
		char *operation,*data,dir;
		int dtsize,stpslc;
		operation = malloc(sizeof(char)*7);
		scanf(" %s",operation);
		if(*operation == 'A')
		{
			slice *newone = NULL;
			scanf(" %d",&dtsize);
			data = malloc(sizeof(char)*dtsize);
			scanf(" %s",data);
			if(data[0] == 'D' && data[1] == 'R' && data[2] == 'I' && data[3] == 'L' && data[4] == 'L'  && data[5] == '\0' && i == 1)
			{
				newone  = (slice*)malloc(sizeof(slice));
				newone -> data = "DRILL";
				newone -> stpslc = -1;
				newone -> dir = 'N';
				newone -> right =  newone;
				newone -> left = newone; 
				currentslice = newone;
				i+=1;
				printf("%c %s %s %s\n",'A',currentslice -> left -> data, currentslice -> data, currentslice -> right -> data );
			}
			else if(data[0] == 'D' && data[1] == 'R' && data[2] == 'I' && data[3] == 'L' && data[4] == 'L'  && data[5] == '\0')
			{
				if(currentdirection == 'R')
				{
					newone  = (slice*)malloc(sizeof(slice));
					newone -> data = "DRILL";
					newone -> stpslc = -1;
					newone -> dir = 'N';
					currentslice -> right ->left = newone;
					newone -> right =  currentslice -> right;
					newone -> left = currentslice;
					currentslice -> right = newone; 
					currentslice = newone;
					printf("%c %s %s %s\n",'A',currentslice -> left -> data, currentslice -> data, currentslice -> right -> data );
				}
				else
				{
					newone  = (slice*)malloc(sizeof(slice));
					newone -> data = "DRILL";
					newone -> stpslc = -1;
					newone -> dir = 'N';
					currentslice -> left ->right = newone;
					newone -> left = currentslice -> left;
					newone -> right = currentslice;
					currentslice -> left = newone;
					currentslice = newone;
					printf("%c %s %s %s\n",'A',currentslice -> left -> data, currentslice -> data, currentslice -> right -> data );
				}
			}
			else if(i == 1)
			{				
				scanf(" %c %d",&dir,&stpslc);
				newone = create_slice(data,dir,stpslc);
				newone -> right = newone;
				newone -> left = newone;
				currentslice = newone;
				firstslice = currentslice;
				i+=1;
				printf("%c %s %s %s\n",'A',currentslice -> left -> data, currentslice -> data, currentslice -> right -> data );
			}
			else if(currentdirection == 'R')
			{				
				scanf(" %c %d",&dir,&stpslc);
				newone = create_slice(data,dir,stpslc);
				currentslice -> right ->left = newone;
				newone -> right =  currentslice -> right;
				newone -> left = currentslice;
				currentslice -> right = newone; 
				currentslice = newone;
				printf("%c %s %s %s\n",'A',currentslice -> left -> data, currentslice -> data, currentslice -> right -> data );
			}
			else if(currentdirection == 'L')
			{			
				scanf(" %c %d",&dir,&stpslc);
				newone = create_slice(data,dir,stpslc);
				currentslice -> left ->right = newone;
				newone -> left = currentslice -> left;
				newone -> right = currentslice;
				currentslice -> left = newone;
				currentslice = newone;
				printf("%c %s %s %s\n",'A',currentslice -> left -> data, currentslice -> data, currentslice -> right -> data );
			}
		}
		else if(*operation == 'R')
		{
			int border;
			int k;
			currentdirection = currentslice -> dir;
			border = currentslice -> stpslc;
			if(currentslice -> data[0] == 'D' && currentslice -> data[1] == 'R' && currentslice -> data[2] == 'I' && currentslice -> data[3] == 'L' && currentslice -> data[4] == 'L' )
			{
				printf("%c %s\n", 'R', "DRILL" );
				break;
			}
			if(currentslice ->dir == 'R')
			{
				printf("%c ",'R' );
				for( k=0; k < border;k++)
				{
					currentslice = currentslice -> right;
					printf("%s ",currentslice -> data);
				}
				printf("\n");
			}
			else if(currentslice ->dir == 'L')
			{
				printf("%c ",'R' );
				for( k=0; k < border;k++)
				{
					currentslice = currentslice -> left;
					printf("%s ",currentslice -> data);
				}
				printf("\n");
			}

		}
		else if(*operation == 'D') 
		{
			if(currentdirection == 'R') 
			{
				printf("%c %s %s %s\n",'D', currentslice -> left-> data, currentslice -> data, currentslice -> right -> data );
				currentslice -> left -> right = currentslice -> right;
				currentslice -> right -> left = currentslice -> left;
				currentslice = currentslice -> left;
			}
			if(currentdirection == 'L')
			{
				printf("%c %s %s %s\n",'D', currentslice -> left-> data, currentslice -> data, currentslice -> right -> data );
				currentslice -> left -> right = currentslice -> right;
				currentslice -> right -> left = currentslice -> left;
				currentslice = currentslice -> right;
			}
		}
		else if(*operation == 'C')
		{
			slice *controlslice; 
			controlslice = firstslice;
			printf("%c ",'C' );
			while(controlslice -> right  != firstslice )
			{
				printf("%s ", controlslice -> data);
				controlslice = controlslice -> right;
			}
			printf("%s ",controlslice -> data );
			controlslice = controlslice -> left;
			while(controlslice != firstslice)
			{
				printf("%s ", controlslice -> data);
				controlslice = controlslice -> left;
			}
			printf("%s\n",firstslice->data);
		}
		else if(*operation == 'T')
		{
			int tstnumb,j;
			
			scanf(" %d", &tstnumb );
			printf("%c %s ",'T',firstslice -> data );
			currentslice = firstslice;
			for(j=0;j < tstnumb;j++)
			{
				int border;
				int k;
				border = currentslice -> stpslc;
				if(currentdirection == 'R')
				{
					for( k=0; k < border;k++)
					{
						currentslice = currentslice -> right;
						if(currentslice -> data[0] == 'D' && currentslice -> data[1] == 'R' && currentslice -> data[2] == 'I' && currentslice -> data[3] == 'L' && currentslice -> data[4] == 'L')
						{
							buldum = 1;
							printf("%s\n","DRILL " );
							break;
						}
						if (buldum == 0)
						{
							printf("%s ",currentslice -> data);
						}
					}
					currentdirection  = currentslice -> dir;

				}
				else if(currentdirection == 'L')
				{
					for( k=0; k < border;k++)
					{
						currentslice = currentslice -> left;
						if(currentslice -> data[0] == 'D' && currentslice -> data[1] == 'R' && currentslice -> data[2] == 'I' && currentslice -> data[3] == 'L' && currentslice -> data[4] == 'L')
						{
							buldum = 1;
							printf("%s\n","DRILL " );
							break;
						}
						if (buldum == 0)
						{
							printf("%s ",currentslice -> data);
						}
						
					}
					if (buldum == 1)
					{
						break;					
					}
					currentdirection  = currentslice -> dir;
				}

			}
			if (buldum == 0)
			{
				printf("%s\n","DRILL_NOT_FOUND " );
				break;
			}
		}
		if (buldum == 1)
		{
			break;
		}
	}
	return 0;
}

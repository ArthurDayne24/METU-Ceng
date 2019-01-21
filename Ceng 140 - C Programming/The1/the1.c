#include <stdio.h>

int check(int f,char field[f+1][f+1])
{
	char new[f+1][f+1],numspid;
	int i,j;
	numspid=0;

	/*   Spider sayı sayma  */
	for(i=0;i<f;i++)
	{
		for(j=0;j<f-i;j++)
		{
			if(field[i][j]=='s')
			{
				numspid+=1;
			}
		}
	}
	/*   Spider sayı sayma  */
	if(numspid == 1)
	{
		for (i = 0; i < f; ++i) {
			for (j = 0; j < i; ++j) {
				printf(" ");
			}
			for (j = 0; j < (f - i); ++j) {
				printf("%c ", field[i][j]);
			}
			printf("\n");
		}
		printf("\n");
		return 1;
	}
	for(i=0;i<f;i++)
	{
		for(j=0;j<f;j++)
		{
			new[i][j] = field[i][j];
		}
	}
	for(i=0;i<f;i++)
	{
		for(j=0;j<f-i;j++)
		{
			if(new[i][j] == 's')
			{
				if(j>=2 && new[i][j-1] == 's')
				{
					if(new[i][j-2] == 'e')
					{
						new[i][j] = 'e';
						new[i][j-1] = 'e';
						new[i][j-2] = 's';
						if(check(f,new))
						{
							for (i = 0; i < f; ++i) {
								for (j = 0; j < i; ++j) {
									printf(" ");
								}
								for (j = 0; j < (f - i); ++j) {
									printf("%c ", field[i][j]);
								}
								printf("\n");
							}
							printf("\n");
							return 1;
						}
						new[i][j] = 's';
						new[i][j-1] = 's';
						new[i][j-2] = 'e';
					}
				}
				if(j<(f-i-2) &&  new[i][j+1]  == 's')
				{
					if(new[i][j+2] == 'e')
					{
						new[i][j] = 'e';
						new[i][j+1] = 'e';
						new[i][j+2] = 's';
						if(check(f,new))
						{
							for (i = 0; i < f; ++i) {
								for (j = 0; j < i; ++j) {
									printf(" ");
								}
								for (j = 0; j < (f - i); ++j) {
									printf("%c ", field[i][j]);
								}
								printf("\n");
							}
							printf("\n");
							return 1;
						}
						new[i][j] = 's';
						new[i][j+1] = 's';
						new[i][j+2] = 'e';
					}
				}
				if(i>=2 && new[i-1][j+1]  == 's')
				{
					if(new[i-2][j+2] == 'e')
					{
						new[i][j] = 'e';
						new[i-1][j+1] = 'e';
						new[i-2][j+2] = 's';
						if(check(f,new))
						{
							for (i = 0; i < f; ++i) {
								for (j = 0; j < i; ++j) {
									printf(" ");
								}
								for (j = 0; j < (f - i); ++j) {
									printf("%c ", field[i][j]);
								}
								printf("\n");
							}
							printf("\n");
							return 1;
						}
						new[i][j] = 's';
						new[i-1][j+1] = 's';
						new[i-2][j+2] = 'e';
					}
				}
				if(i>=2 && new[i-1][j]  == 's')
				{
					if(new[i-2][j] == 'e')
					{
						new[i][j] = 'e';
						new[i-1][j] = 'e';
						new[i-2][j] = 's';
						if(check(f,new))
						{
							for (i = 0; i < f; ++i) {
								for (j = 0; j < i; ++j) {
									printf(" ");
								}
								for (j = 0; j < (f - i); ++j) {
									printf("%c ", field[i][j]);
								}
								printf("\n");
							}
							printf("\n");
							return 1;
						}
						new[i][j] = 's';
						new[i-1][j] = 's';
						new[i-2][j] = 'e';
					}
				}
				if(j<(f-i-2) && i< (f-2) && new[i+1][j]  == 's')
				{
					if(new[i+2][j] == 'e')
					{
						new[i][j] = 'e';
						new[i+1][j] = 'e';
						new[i+2][j] = 's';
						if(check(f,new))
						{
							for (i = 0; i < f; ++i) {
								for (j = 0; j < i; ++j) {
									printf(" ");
								}
								for (j = 0; j < (f - i); ++j) {
									printf("%c ", field[i][j]);
								}
								printf("\n");
							}
							printf("\n");
							return 1;
						}
						new[i][j] = 's';
						new[i+1][j] = 's';
						new[i+2][j] = 'e';
					}
				}
				if(j>=2 && new[i+1][j-1]  == 's')
				{
					if(new[i+2][j-2] == 'e')
					{
						new[i][j] = 'e';
						new[i+1][j-1] = 'e';
						new[i+2][j-2] = 's';
						if(check(f,new))
						{
							for (i = 0; i < f; ++i) {
								for (j = 0; j < i; ++j) {
									printf(" ");
								}
								for (j = 0; j < (f - i); ++j) {
									printf("%c ", field[i][j]);
								}
								printf("\n");
							}
							printf("\n");
							return 1;
						}
						new[i][j] = 's';
						new[i+1][j-1] = 's';
						new[i+2][j-2] = 'e';
					}
				}
			}
		}
	}

	return 0;
}



int main()
{
	int i,f;
	scanf("%d",&f);
	char field[f+1][f+1];
	/* Item yerlestirme */
	for(i=0;i<f;i++)
	{
		scanf("%s",field[i]);
	}

	
/*  Son hamle
	if(check(field))
	{
		for(i=0;i<f;i++)
		{
			printf("%s\n",field[i]);
		}
	}
*/
	if(check(f,field) == 0)
	{
		printf("There is no ideal field.\n");
	}
	return 0;
}



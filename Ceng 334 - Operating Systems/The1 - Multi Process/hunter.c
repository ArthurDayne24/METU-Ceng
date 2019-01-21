#include <stdio.h>
#include <stdlib.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <unistd.h>

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


void main(int argc, char *argv[]) {
    int yukseklik = atoi(argv[2]);
    int genislik = atoi(argv[1]);
    printf("y = %d, g = %d\n", yukseklik, genislik);

    while(1){
        int flag = 0;
        ph_message ph_mes;
        server_message ser_mes;
        read(0, &ser_mes, sizeof(ser_mes));
        int prey_neighmi = 0;
        for (int i = 0; i < ser_mes.object_count; i++)
        {
            if(ser_mes.object_pos[i].x == ser_mes.adv_pos.x && ser_mes.object_pos[i].y == ser_mes.adv_pos.y){
                ph_mes.move_request.x = ser_mes.object_pos[i].x;
                ph_mes.move_request .y = ser_mes.object_pos[i].y;
                usleep((1+rand()%9)*10000);
                if (write(1, &ph_mes, sizeof(ph_mes)) < 0)
                    perror("writing stream message");
                FILE *file = fdopen(1,"w");
                fflush(file);
                prey_neighmi = 1;
                break;
            }
        }
        if(prey_neighmi == 0){
            if (ser_mes.pos.x - ser_mes.adv_pos.x > 0 && ser_mes.pos.y - ser_mes.adv_pos.y == 0)
            {
                int flag = 0;
                for (int i = 0; i < ser_mes.object_count; i++)
                {
                    if(ser_mes.object_pos[i].x == ser_mes.pos.x-1 && ser_mes.object_pos[i].y == ser_mes.pos.y)
                    {
                        flag = 1;
                    }
                }
                if (flag == 1)
                {
                    ph_mes.move_request.x = ser_mes.pos.x;
                    ph_mes.move_request.y = ser_mes.pos.y;
                    usleep((1+rand()%9)*10000);
                    if (write(1, &ph_mes, sizeof(ph_mes)) < 0)
                        perror("writing stream message");
                        FILE *file = fdopen(1,"w");
                        fflush(file);   
                }
                else{
                    ph_mes.move_request.x = ser_mes.pos.x-1;
                    ph_mes.move_request.y = ser_mes.pos.y;
                    usleep((1+rand()%9)*10000);
                    if (write(1, &ph_mes, sizeof(ph_mes)) < 0)
                        perror("writing stream message");
                    FILE *file = fdopen(1,"w");
                    fflush(file);
                }
            }
            else if (ser_mes.pos.x - ser_mes.adv_pos.x < 0 && ser_mes.pos.y - ser_mes.adv_pos.y == 0)
            {
                int flag = 0;
                for (int i = 0; i < ser_mes.object_count; i++)
                {
                    if(ser_mes.object_pos[i].x == ser_mes.pos.x+1 && ser_mes.object_pos[i].y == ser_mes.pos.y)
                    {
                        flag = 1;
                    }
                }
                if (flag == 1)
                {
                    ph_mes.move_request.x = ser_mes.pos.x;
                    ph_mes.move_request.y = ser_mes.pos.y;
                    usleep((1+rand()%9)*10000);
                    if (write(1, &ph_mes, sizeof(ph_mes)) < 0)
                        perror("writing stream message");
                    FILE *file = fdopen(1,"w");
                    fflush(file);
                }
                else{
                    ph_mes.move_request.x = ser_mes.pos.x+1;
                    ph_mes.move_request.y = ser_mes.pos.y;
                    usleep((1+rand()%9)*10000);
                    if (write(1, &ph_mes, sizeof(ph_mes)) < 0)
                        perror("writing stream message");
                    FILE *file = fdopen(1,"w");
                    fflush(file);
                }
            }
            else if (ser_mes.pos.x - ser_mes.adv_pos.x == 0 && ser_mes.pos.y - ser_mes.adv_pos.y > 0)
            {
                int flag = 0;
                for (int i = 0; i < ser_mes.object_count; i++)
                {
                    if(ser_mes.object_pos[i].x == ser_mes.pos.x && ser_mes.object_pos[i].y == ser_mes.pos.y-1)
                    {
                        flag = 1;
                    }
                }
                if (flag == 1)
                {
                    ph_mes.move_request.x = ser_mes.pos.x;
                    ph_mes.move_request.y = ser_mes.pos.y;
                    usleep((1+rand()%9)*10000);
                    if (write(1, &ph_mes, sizeof(ph_mes)) < 0)
                        perror("writing stream message");
                    FILE *file = fdopen(1,"w");
                    fflush(file);
                }
                else{
                    ph_mes.move_request.x = ser_mes.pos.x;
                    ph_mes.move_request.y = ser_mes.pos.y-1;
                    usleep((1+rand()%9)*10000);
                    if (write(1, &ph_mes, sizeof(ph_mes)) < 0)
                        perror("writing stream message");
                    FILE *file = fdopen(1,"w");
                    fflush(file);
                }
            }
            else if (ser_mes.pos.x - ser_mes.adv_pos.x == 0 && ser_mes.pos.y - ser_mes.adv_pos.y < 0)
            {
                int flag = 0;
                for (int i = 0; i < ser_mes.object_count; i++)
                {
                    if(ser_mes.object_pos[i].x == ser_mes.pos.x && ser_mes.object_pos[i].y == ser_mes.pos.y+1)
                    {
                        flag = 1;
                    }
                }
                if (flag == 1)
                {
                    ph_mes.move_request.x = ser_mes.pos.x;
                    ph_mes.move_request.y = ser_mes.pos.y;
                    usleep((1+rand()%9)*10000);
                    if (write(1, &ph_mes, sizeof(ph_mes)) < 0)
                        perror("writing stream message");
                    FILE *file = fdopen(1,"w");
                    fflush(file);
                }
                else{
                    ph_mes.move_request.x = ser_mes.pos.x;
                    ph_mes.move_request.y = ser_mes.pos.y+1;
                    usleep((1+rand()%9)*10000);
                    if (write(1, &ph_mes, sizeof(ph_mes)) < 0)
                        perror("writing stream message");
                    FILE *file = fdopen(1,"w");
                    fflush(file);
                }
            }
            else if (ser_mes.pos.x - ser_mes.adv_pos.x > 0 && ser_mes.pos.y - ser_mes.adv_pos.y > 0)
            {
                int flag = 0;
                for (int i = 0; i < ser_mes.object_count; i++)
                {
                    if (ser_mes.object_pos[i].x == ser_mes.pos.x-1 && ser_mes.object_pos[i].y == ser_mes.pos.y)
                       {
                            flag = 1;
                       }   
                }
                if (flag !=1)
                {
                    ph_mes.move_request.x = ser_mes.pos.x-1;
                    ph_mes.move_request.y = ser_mes.pos.y;
                    usleep((1+rand()%9)*10000);
                    if (write(1, &ph_mes, sizeof(ph_mes)) < 0)
                        perror("writing stream message");
                    FILE *file = fdopen(1,"w");
                    fflush(file);
                }
                else{
                    for (int i = 0; i < ser_mes.object_count; i++)
                    {
                        if (ser_mes.object_pos[i].x == ser_mes.pos.x && ser_mes.object_pos[i].y == ser_mes.pos.y-1)
                           {
                                flag = 2;
                           }
                    }
                    if (flag != 2)
                    {
                        ph_mes.move_request.x = ser_mes.pos.x;
                        ph_mes.move_request.y = ser_mes.pos.y-1;
                        usleep((1+rand()%9)*10000);
                        if (write(1, &ph_mes, sizeof(ph_mes)) < 0)
                            perror("writing stream message");
                        FILE *file = fdopen(1,"w");
                        fflush(file);
                    }
                    else{
                        ph_mes.move_request.x = ser_mes.pos.x;
                        ph_mes.move_request.y = ser_mes.pos.y;
                        usleep((1+rand()%9)*10000);
                        if (write(1, &ph_mes, sizeof(ph_mes)) < 0)
                            perror("writing stream message");
                        FILE *file = fdopen(1,"w");
                        fflush(file);
                    }
                }
            }
            else if (ser_mes.pos.x - ser_mes.adv_pos.x > 0 && ser_mes.pos.y - ser_mes.adv_pos.y < 0)
            {
                int flag = 0;
                for (int i = 0; i < ser_mes.object_count; i++)
                {
                    if (ser_mes.object_pos[i].x == ser_mes.pos.x-1 && ser_mes.object_pos[i].y == ser_mes.pos.y)
                       {
                            flag = 1;
                       }   
                }
                if (flag !=1)
                {
                    ph_mes.move_request.x = ser_mes.pos.x-1;
                    ph_mes.move_request.y = ser_mes.pos.y;
                    usleep((1+rand()%9)*10000);
                    if (write(1, &ph_mes, sizeof(ph_mes)) < 0)
                        perror("writing stream message");
                    FILE *file = fdopen(1,"w");
                    fflush(file);
                }
                else{
                    for (int i = 0; i < ser_mes.object_count; i++)
                    {
                        if (ser_mes.object_pos[i].x == ser_mes.pos.x && ser_mes.object_pos[i].y == ser_mes.pos.y+1)
                           {
                                flag = 2;
                           }
                    }
                    if (flag != 2)
                    {
                        ph_mes.move_request.x = ser_mes.pos.x;
                        ph_mes.move_request.y = ser_mes.pos.y+1;
                        usleep((1+rand()%9)*10000);
                        if (write(1, &ph_mes, sizeof(ph_mes)) < 0)
                            perror("writing stream message");
                        FILE *file = fdopen(1,"w");
                        fflush(file);
                    }
                    else{
                        ph_mes.move_request.x = ser_mes.pos.x;
                        ph_mes.move_request.y = ser_mes.pos.y;
                        usleep((1+rand()%9)*10000);
                        if (write(1, &ph_mes, sizeof(ph_mes)) < 0)
                            perror("writing stream message");
                        FILE *file = fdopen(1,"w");
                        fflush(file);
                    }
                }
            }
            else if (ser_mes.pos.x - ser_mes.adv_pos.x < 0 && ser_mes.pos.y - ser_mes.adv_pos.y < 0)
            {
                int flag = 0;
                for (int i = 0; i < ser_mes.object_count; i++)
                {
                    if (ser_mes.object_pos[i].x == ser_mes.pos.x+1 && ser_mes.object_pos[i].y == ser_mes.pos.y)
                       {
                            flag = 1;
                       }   
                }
                if (flag !=1)
                {
                    ph_mes.move_request.x = ser_mes.pos.x+1;
                    ph_mes.move_request.y = ser_mes.pos.y;
                    usleep((1+rand()%9)*10000);
                    if (write(1, &ph_mes, sizeof(ph_mes)) < 0)
                        perror("writing stream message");
                        FILE *file = fdopen(1,"w");
                        fflush(file);  
                }
                else{
                    for (int i = 0; i < ser_mes.object_count; i++)
                    {
                        if (ser_mes.object_pos[i].x == ser_mes.pos.x && ser_mes.object_pos[i].y == ser_mes.pos.y+1)
                           {
                                flag = 2;
                           }
                    }
                    if (flag != 2)
                    {
                        ph_mes.move_request.x = ser_mes.pos.x;
                        ph_mes.move_request.y = ser_mes.pos.y+1;
                        usleep((1+rand()%9)*10000);
                        if (write(1, &ph_mes, sizeof(ph_mes)) < 0)
                            perror("writing stream message");
                        FILE *file = fdopen(1,"w");
                        fflush(file);
                    }
                    else{
                        ph_mes.move_request.x = ser_mes.pos.x;
                        ph_mes.move_request.y = ser_mes.pos.y;
                        usleep((1+rand()%9)*10000);
                        if (write(1, &ph_mes, sizeof(ph_mes)) < 0)
                            perror("writing stream message");
                        FILE *file = fdopen(1,"w");
                        fflush(file);
                    }
                }
            }
            else if (ser_mes.pos.x - ser_mes.adv_pos.x < 0 && ser_mes.pos.y - ser_mes.adv_pos.y > 0)
            {
                int flag = 0;
                for (int i = 0; i < ser_mes.object_count; i++)
                {
                    if (ser_mes.object_pos[i].x == ser_mes.pos.x+1 && ser_mes.object_pos[i].y == ser_mes.pos.y)
                       {
                            flag = 1;
                       }   
                }
                if (flag !=1)
                {
                    ph_mes.move_request.x = ser_mes.pos.x+1;
                    ph_mes.move_request.y = ser_mes.pos.y;
                    usleep((1+rand()%9)*10000);
                    if (write(1, &ph_mes, sizeof(ph_mes)) < 0)
                        perror("writing stream message");
                    FILE *file = fdopen(1,"w");
                    fflush(file);

                }
                else{
                    for (int i = 0; i < ser_mes.object_count; i++)
                    {
                        if (ser_mes.object_pos[i].x == ser_mes.pos.x && ser_mes.object_pos[i].y == ser_mes.pos.y-1)
                           {
                                flag = 2;
                           }
                    }
                    if (flag != 2)
                    {
                        ph_mes.move_request.x = ser_mes.pos.x;
                        ph_mes.move_request.y = ser_mes.pos.y-1;
                        usleep((1+rand()%9)*10000);
                        if (write(1, &ph_mes, sizeof(ph_mes)) < 0)
                            perror("writing stream message");
                        FILE *file = fdopen(1,"w");
                        fflush(file);
                    }
                    else{
                        ph_mes.move_request.x = ser_mes.pos.x;
                        ph_mes.move_request.y = ser_mes.pos.y;
                        usleep((1+rand()%9)*10000);
                        if (write(1, &ph_mes, sizeof(ph_mes)) < 0)
                            perror("writing stream message");
                        FILE *file = fdopen(1,"w");
                        fflush(file);
                    }
                }
            }
        }
    }
}
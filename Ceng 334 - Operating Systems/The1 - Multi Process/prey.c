#include <stdio.h>
#include <stdlib.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <unistd.h>
#include <math.h>

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
    int hareket_etme = 1;
    int t = 10;
    
    while(1){   
        hareket_etme = 1;
        ph_message ph_mes;
        server_message ser_mes;
        read(0, &ser_mes, sizeof(ser_mes)); 
        int initial_dist = abs(ser_mes.pos.x - ser_mes.adv_pos.x) + abs(ser_mes.pos.y - ser_mes.adv_pos.y);
        
        if(ser_mes.pos.x+1 <= yukseklik-1){
            if (abs(ser_mes.pos.x+1 - ser_mes.adv_pos.x) + abs(ser_mes.pos.y - ser_mes.adv_pos.y)> initial_dist)
            {
                int flag = 0;
                for (int i = 0; i < ser_mes.object_count; i++)
                {
                    if (ser_mes.pos.x+1 == ser_mes.object_pos[i].x && ser_mes.pos.y == ser_mes.object_pos[i].y)
                    {
                        flag = 1;
                        break;
                    }
                }
                if(flag != 1 && hareket_etme == 1){
                    hareket_etme = 0;
                    ph_mes.move_request.x = ser_mes.pos.x+1;
                    ph_mes.move_request.y = ser_mes.pos.y;
                    usleep((1+rand()%9)*10000);
                    //fprintf(stderr, "alt\n");//ser_mes.pos.x, ser_mes.pos.y , ser_mes.adv_pos.x, ser_mes.adv_pos.y );
                    if (write(1, &ph_mes, sizeof(ph_mes)) < 0)
                        perror("writing stream message");
                    FILE *file = fdopen(1,"w");
                    fflush(file);
                }
            }
        }
        if (ser_mes.pos.x-1 >= 0)
        {
            //fprintf(stderr, "%d\n", abs(ser_mes.pos.x-1 - ser_mes.adv_pos.x) + abs(ser_mes.pos.y - ser_mes.adv_pos.y));
            if (abs(ser_mes.pos.x-1 - ser_mes.adv_pos.x) + abs(ser_mes.pos.y - ser_mes.adv_pos.y)> initial_dist)
            {
                int flag = 0;
                for (int i = 0; i < ser_mes.object_count; i++)
                {
                    if (ser_mes.pos.x-1 == ser_mes.object_pos[i].x && ser_mes.pos.y == ser_mes.object_pos[i].y)
                    {
                        flag = 1;
                        break;
                    }
                }
                if(flag != 1 && hareket_etme == 1){
                    hareket_etme = 0;
                    ph_mes.move_request.x = ser_mes.pos.x-1;
                    ph_mes.move_request.y = ser_mes.pos.y;
                    usleep((1+rand()%9)*10000);
                    //fprintf(stderr, "ust\n");
                    if (write(1, &ph_mes, sizeof(ph_mes)) < 0)
                        perror("writing stream message");
                    FILE *file = fdopen(1,"w");
                    fflush(file);
                }
            }
        }
        if (ser_mes.pos.y+1 <= genislik-1)
        {
            //fprintf(stderr, "%d %d \n", abs(ser_mes.pos.x - ser_mes.adv_pos.x) + abs(ser_mes.pos.y+1 - ser_mes.adv_pos.y),initial_dist);
            if (abs(ser_mes.pos.x - ser_mes.adv_pos.x) + abs(ser_mes.pos.y+1 - ser_mes.adv_pos.y)> initial_dist)
            {
                
                int flag = 0;
                for (int i = 0; i < ser_mes.object_count; i++)
                {
                    if (ser_mes.pos.x == ser_mes.object_pos[i].x && ser_mes.pos.y+1 == ser_mes.object_pos[i].y)
                    {
                        flag = 1;
                        break;
                    }
                }
                if(flag != 1 && hareket_etme == 1){
                    //fprintf(stderr, "HELLO\n" );
                    hareket_etme = 0;
                    ph_mes.move_request.x = ser_mes.pos.x;
                    ph_mes.move_request.y = ser_mes.pos.y+1;
                    usleep((1+rand()%9)*10000);
                    //fprintf(stderr, "sag\n");
                    if (write(1, &ph_mes, sizeof(ph_mes)) < 0)
                        perror("writing stream message");
                    FILE *file = fdopen(1,"w");
                    fflush(file);
                }
            }
        }
        if (ser_mes.pos.y-1 >= 0)
        {
            if (abs(ser_mes.pos.x - ser_mes.adv_pos.x) + abs(ser_mes.pos.y-1 - ser_mes.adv_pos.y)> initial_dist)
            {
                int flag = 0;
                for (int i = 0; i < ser_mes.object_count; i++)
                {
                    if (ser_mes.pos.x == ser_mes.object_pos[i].x && ser_mes.pos.y-1 == ser_mes.object_pos[i].y)
                    {
                        flag = 1;
                        break;
                    }
                }
                if(flag != 1 && hareket_etme == 1){
                    hareket_etme = 0;
                    ph_mes.move_request.x = ser_mes.pos.x;
                    ph_mes.move_request.y = ser_mes.pos.y-1;
                    usleep((1+rand()%9)*10000);
                    //fprintf(stderr, "sol\n");
                    if (write(1, &ph_mes, sizeof(ph_mes)) < 0)
                        perror("writing stream message");
                    FILE *file = fdopen(1,"w");
                    fflush(file);
                }
            }
        }
        if (hareket_etme == 1){
            ph_mes.move_request.x = ser_mes.pos.x;
            ph_mes.move_request.y = ser_mes.pos.y;
            usleep((1+rand()%9)*10000);
            //fprintf(stderr, "kal\n");
            if (write(1, &ph_mes, sizeof(ph_mes)) < 0)
                perror("writing stream message");
            FILE *file = fdopen(1,"w");
            fflush(file);
        }

    }
}
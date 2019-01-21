#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
#include <sys/socket.h>
#define PIPE(fd) socketpair(AF_UNIX, SOCK_STREAM, PF_UNIX, fd)
#define Data1 "In Xanadu, did Kublai Khan..."



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
                                                        //"İYİ BAYRAMLAR GENŞLER, İYİ BAYRAMLAR, OHHHHHH, AL KODU AL"

void main(){
    int H_no;
    scanf("%d", &H_no);
    int *Hunters[H_no];
    for (int i=0; i<H_no; i++)
        Hunters[i] = (int *)malloc(3 * sizeof(int));


    for (int i = 0; i < H_no; i++)
    {
        scanf(" %d %d %d", &Hunters[i][0], &Hunters[i][1], &Hunters[i][2]);
    }
    int sockets[H_no][2];
    
    //printf(" PREY 1 0----- > %d\n", Preys[1][0]);
    for (int i = 0; i < H_no; i++)
    {
        server_message ser_mes;
        ser_mes.pos.x = 2;
        ser_mes.pos.y = 2;

        ser_mes.adv_pos.x = 3;
        ser_mes.adv_pos.y = 2;

        ser_mes.object_count = 0;

//        ser_mes.object_pos[0].x = 1;
//      ser_mes.object_pos[0].y = 1;




        ph_message ph_mes;
        ser_mes.pos.x =Hunters[i][0];
        ser_mes.pos.y =Hunters[i][1];
        PIPE(sockets[i]);
        if(fork() == 0){
            close(sockets[i][0]);
            dup2(sockets[i][1],1);
            dup2(sockets[i][1],0);
            execl("./prey", "./prey", "10", "10" , NULL);
            close(sockets[i][1]);
        }else{
            sleep(2);
            close(sockets[i][1]);
            write(sockets[i][0], &ser_mes, sizeof(ser_mes));
            read(sockets[i][0], &ph_mes, sizeof(ph_mes));

            printf("request x is %d\n", ph_mes.move_request.x);
            printf("request y is %d\n", ph_mes.move_request.y);
            close(sockets[i][0]);
            printf("\n");
        }
    }
}
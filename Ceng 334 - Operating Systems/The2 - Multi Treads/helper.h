#define _POSIX_C_SOURCE 201809L
#ifndef do_not_submit
#define do_not_submit
#include <stdio.h>
#include <stdlib.h>
#include <curses.h>
#include <signal.h>
#include <time.h>
#include <pthread.h>
#include <semaphore.h>

//////////////////////////////////////////
// things you can access
#define GRIDSIZE 30
#define DRAWDELAY 50000
void setDelay(int d);
int getDelay();
void setSleeperN(int d);
int getSleeperN();
void putCharTo(int i, int j, char c);
char lookCharAt(int i, int j);
void startCurses();
void endCurses();
void drawWindow();
//////////////////////////////////////////

//////////////////////////////////////////
// things you must not access
char __grid[GRIDSIZE][GRIDSIZE];
int __delay_n = 50;
int __sleeper_n = 0;
long __actions[GRIDSIZE][GRIDSIZE];
long __prev_actions = 0;
struct timespec __time_pre;
WINDOW *__gridworld = NULL;
#define ESC 27
int offsetx, offsety;

double __aperms = 0;
int __maxants = 0;
int __maxfoods = 0;
int __maxsleeper = 0;
int __change = 0;
char __thr[5];
double __alltime = 0;

//#define GUI

void setDelay(int d) {
  __aperms = 0;
  if (d >= 0) __delay_n = d;
}

int getDelay() {
    return __delay_n;
}

void setSleeperN(int d) {
    if (d >= 0) __sleeper_n = d;
}

int getSleeperN() {
    return __sleeper_n;
}

int __aant = 0;
int __afood = 0;
bool __f = FALSE;
int __value = 1;
pthread_mutex_t __mutex;
pthread_cond_t __cond;
void putCharTo(int i, int j, char c) {
  pthread_mutex_lock(&__mutex);
  while(__value == 0)
  {
    pthread_cond_wait(&__cond, &__mutex);
  }
  pthread_mutex_unlock(&__mutex);
  
  if (__f){
      if (c != __grid[i][j]){
        __actions[i][j]++;
      }
      
      if ((__grid[i][j] == '1' || __grid[i][j] == 'P'  || __grid[i][j] == 'S'  || __grid[i][j] == '$' ) 
            && (c != '1' && c != 'P'  && c != 'S'  && c != '$' )) __aant++;
      if ((__grid[i][j] != '1' && __grid[i][j] != 'P'  && __grid[i][j] != 'S'  && __grid[i][j] != '$' ) 
            && (c == '1' || c == 'P'  || c == 'S'  || c == '$' )) __aant--;
      
      if ((__grid[i][j] == 'o' || __grid[i][j] == 'P' || __grid[i][j] == '$')
            && (c != 'o' && c != 'P' && c != '$')) __afood++;
      if ((__grid[i][j] != 'o' && __grid[i][j] != 'P' && __grid[i][j] != '$')
            && (c == 'o' || c == 'P' || c == '$')) __afood--;

      __grid[i][j] = c;
      usleep(20000 + (rand() % 500));
  }
  else
  {
      __grid[i][j] = c;
  }
}

char lookCharAt(int i, int j) {
  //actions[i][j]++;
  return __grid[i][j];
}

void getDimensions() {
    offsetx = (COLS - 2*GRIDSIZE+1) / 2;
    offsety = (LINES - GRIDSIZE) / 2;
}

void initCurses(){
    initscr();
    cbreak();
    noecho();
    curs_set(0);
    keypad(stdscr, TRUE);
    nodelay(stdscr, TRUE);
    refresh();
}

void startCurses() {
#ifdef GUI
    initCurses();
    
    getDimensions();
#endif
    int i,j;
    for (i = 0; i < GRIDSIZE; i++)
        for (j = 0; j < GRIDSIZE; j++){
            __actions[i][j] = 0;
        }
    
    __f = TRUE;
    pthread_cond_init(&__cond, NULL);
    pthread_mutex_init(&__mutex, NULL);
}

void endCurses() {
#ifdef GUI    
    erase();
    refresh();
    if (__gridworld != NULL) delwin(__gridworld);
    __gridworld = NULL;
    
    endwin();
#endif
#ifndef GUI
    printf("actions:%f ants:%d foods:%d change:%d sleeper:%d threads:%s\n", __aperms, __maxants, __maxfoods, __change-2, __maxsleeper, __thr);
#endif
}



void drawWindow() {
    pthread_mutex_lock(&__mutex);
    __value = 0;
    pthread_mutex_unlock(&__mutex);
    
#ifdef GUI
    if (COLS > 90 && LINES > 40)
#endif
    {
#ifdef GUI
        getDimensions();
        erase();
        werase(__gridworld);
        if (__gridworld != NULL) delwin(__gridworld);
        __gridworld = newwin(GRIDSIZE+2, 2*GRIDSIZE+1, offsety, offsetx);
        
        wborder(__gridworld, 0, 0, 0, 0, 0, 0, 0, 0);
#endif
        
        struct timespec time_now;
        clock_gettime(CLOCK_MONOTONIC, &time_now);
        double elapsed = (time_now.tv_sec - __time_pre.tv_sec) * 1e3 + (time_now.tv_nsec - __time_pre.tv_nsec) / 1.0e6;
        __time_pre = time_now;
        __alltime += 1;
        if ( __alltime > 50)
        {
            __sleeper_n = 20;
        }
        
        int total_actions = 0;
        int i,j;
        for (i = 0; i < GRIDSIZE; i++)
            for (j = 0; j < GRIDSIZE; j++){
                total_actions += __actions[i][j];
            }
        int n_actions = total_actions - __prev_actions;
        __prev_actions = total_actions;


        FILE* stats = fopen("/proc/self/stat", "r");
        fscanf(stats,"%*s %*s %*s %*s %*s %*s %*s %*s %*s %*s %*s %*s %*s %*s %*s %*s %*s %*s %*s %s", __thr);
        fclose(stats);

        int nants = 0;
        int nfoods = 0;
        int nsants = 0;
        for (i = 0; i < GRIDSIZE; i++) {
            for (j = 0; j < GRIDSIZE; j++) {
#ifdef GUI
                mvwaddch(__gridworld, i+1, 2*j+1, __grid[i][j]);
#endif
                switch (__grid[i][j]) {
                    case 'P':
                        nants++;
                        nfoods++;
                        break;
                    case '$':
                        nants++;
                        nfoods++;
                        nsants++;
                        break;
                    case '1':
                        nants++;
                        break;
                    case 'S':
                        nants++;
                        nsants++;
                        break;
                    case 'o':
                        nfoods++;
                        break;
                    default:
                        break;
                  }
            }
        }
        
        double apercall = elapsed != 0 ? n_actions / elapsed : 0;
        if (__aperms < apercall)
        {
          __aperms = apercall;
        }
        int tmpants = nants+__aant;
        if (__maxants < tmpants)
        {
            __maxants = tmpants;
            __change++;
        }
        int tmpfoods = nfoods+__afood;
        if (__maxfoods < tmpfoods)
        {
            __maxfoods = tmpfoods;
            __change++;
        }
        if (__maxsleeper < nsants)
        {
            __maxsleeper = nsants;
        }
        
        
        
        
#ifdef GUI
        mvprintw(0, 0, "Elapsed time since last call to drawWindow(): %5.5f               ", elapsed);
        mvprintw(1, 0, "Total number of actions per ms: %f            max:%f", apercall, __aperms);
        mvprintw(2, 0, "# Ants(sleep/total): (%3d/%3d) |# Foods: %3d |# Threads: %s", nsants, tmpants, tmpfoods, __thr);
        mvprintw(3, 0, "Expected number of sleepers: %3d, Delay amount: %3d", __sleeper_n, __delay_n);
        mvprintw(LINES-2, 0, "'q' for exit, '+' and '-' for delay, '*' and '/' for sleepers.");

        refresh();
        wrefresh(__gridworld);
#endif
    }
#ifdef GUI
    else{
        erase();
        mvprintw(0, 0, "You need a bigger terminal window, you can resize");
        refresh();
    }
#endif
    pthread_mutex_lock(&__mutex);
    __value = 1;
    pthread_cond_signal(&__cond);
    pthread_mutex_unlock(&__mutex);
    
}

#endif


/*
Muhammed Yusuf Temizer  2099356
İrfan Can Kaleli	2035996

*/

#include <p18cxxx.h>
#include <p18f8722.h>
#pragma config OSC = HSPLL, FCMEN = OFF, IESO = OFF, PWRT = OFF, BOREN = OFF, WDT = OFF, MCLRE = ON, LPT1OSC = OFF, LVP = OFF, XINST = OFF, DEBUG = OFF

#define _XTAL_FREQ   40000000



#include "Includes.h"
#include "LCD.h"
#include <stdio.h>



int gameFinish = 0;
int re1Flag = 0;
int iter = 0;
int value = 0;
char valueString[50];
unsigned long initialAdres;
int time20sec;
int time20secShadow;
int time20 = 20;
int flag20Up = 0;
int wrongPin = 0;


int attempts = 2;
int bombTime = 120;
int bombSecInit;
int bombSec;
int setFinish = 0;
int rb7Ready = 0;
int pinSet = 0;
int entranceFlag = 0;
int pin[4];
int enteredPin[4];

unsigned int timer0CounterInit;
unsigned int timer1CounterInit;
unsigned int tmr0Init;
unsigned long int tmr1Init;
int tmr0secCounterInit = 0;
int tmr1secCounterInit = 20;

unsigned int timer0counter;
unsigned int timer1counter;
int tmr0secCounter = 0;
int tmr1secCounter = 20;



unsigned char c1;
int tmr0Flag = 0;
unsigned long switchVal;
unsigned int avoidMismatch;
unsigned int time = 0;
int winkFlag = 0;

int tmr0secFlag = 0;
int cursorPos = 0;
int startClock = 0;





void redLightAdjuster(int d0, int d1, int d2, int d3);
void initText();
void waitRE1();
void initConf();
int switchToVal();
void winking();


void main(void)
{

    InitLCD();					// Initialize LCD in 4bit mode
    initConf();                 // Initializing Timers and Laths
    initText();                 // Initial Text
    waitRE1();                  // Wait for User to Press RE1 and Release


    ADON = 1;                       // enable A/D conversion module
    ADIF = 0;                       // clear A/D interrupt flag
    ADIE = 1;                       // enable A/D interrupts
    INTCONbits.GIE_GIEH = 1;        // enable global interrupts
    INTCONbits.PEIE_GIEL = 1;       // enable peripheral interrupts

    // start timer0 and timer1 here
    TMR0ON = 1;
    TMR1ON = 1;

    switchVal = ADRES;				//get ADC values
    initialAdres = switchToVal();	//convert to integer


    WriteCommandToLCD(0x80);                    // Goto to the beginning of the first line of the LED
    WriteStringToLCD(" Set a pin:#### ");		// Write initial pin getting screen



    while(1) {
        if(startClock == 0) {
            redLightAdjuster(10,10,10,10);  // lighten 7-segment display as [-][-][-][-]
        }
        if(startClock == 1)
        {
            redLightAdjuster(0,bombTime/100,(bombTime/10)%10,bombTime%10);  // lighten 7-segment display and show BombTime always
        }
        if(bombTime == 0)
            break;					// if bombTime finishes, finish the program and start all over again

    }
}


void initText() {
    ClearLCDScreen();                           // Clear LCD screen
    WriteCommandToLCD(0x80);                    // Goto to the beginning of the first line
    WriteStringToLCD(" $>Very Safe<$ ");	// Write Very Safe to the second line
    WriteCommandToLCD(0xC0);                    // Goto to the beginning of the second line
    WriteStringToLCD(" $$$$$$$$$$$$$ ");	// Write $$$$$ to the second line
    return;
}
void waitRE1() {
	/*
		This function is used for waiting RE1 button to be pushed and released, so that program can start.
		Waits 3 exactly 3 sec to finish
	*/
    while(1) {
        if(PORTEbits.RE1 == 0) {
            while(1) {
                if(PORTEbits.RE1 == 1) {
                    re1Flag = 1;
                    break;
                }
            }
        }
        if(re1Flag == 1)
            break;
    }

    while(iter < 300) {
        __delay_ms(10);
        iter++;
    }
    ClearLCDScreen();
    return;
}
void initConf() {

	/*
	All initial values of Timers and Latches is initialized here
	Enabling ports and interrupts and timers to start
	*/
    TRISE = 0x02;                   //Make RE1 input

    TRISH4 = 1;                     // A/D port input setting
    ADCON0 = 0b00110000;            // set chanel 1100 => chanel12
    ADCON1 = 0b00000000;            // set voltage limits and set analog all.
    ADCON2 = 0b10001111;            // right justified
    PIE1bits.ADIE = 1;              // A/D interrupt enable

    INTCONbits.TMR0IE = 1;          // enable TMR0 interrupts
    INTCONbits.TMR0IF = 0;          // clear timer0 interrupt flag

    TRISB6 = 1;                     // set RB6 as input to use PORTB interrupt
    TRISB7 = 1;                     // set RB7 as input to use PORTB interrupt
    PORTB = 0;                      // clear PORTB in order to avoid mismatch
    LATB = 0;                       // clear LATB in order to avoid mismatch
    INTCONbits.RBIE = 1;            // enable PORTB change interrupts
    INTCONbits.RBIF = 0;            // clear PORTB interrupt flag
    INTCON2bits.RBPU = 0;           // PORTB pull-ups are enabled by individual port latch values

    T0CON = 0b01000111;             // set pre-scaler 1:256, use timer0 as 8-bit
    timer0CounterInit = 20;       // counter for timer0 100ms (1000000 instruction => 256 * 20 *(256-60) )
    timer0counter = timer0CounterInit;     // setTimer0Counter
    tmr0Init = 60;                // timer0 initial value configuration for 100ms
    TMR0 = tmr0Init;              // set timer0's initial value
    time20secShadow = 200;		  // time20sec initial value for 1 sec
    time20sec = time20secShadow;	// set to initial in order to wait 1 sec again

    TRISE1 = 1;                     // set RE1 as input pin



    TMR1IE = 1;                     // enable timer1 interrupts
    T1CON = 0b10110000;             // use 16-bit mode, set pre-scaler 1:8
    TMR1 = tmr1Init;              // set timer1's initial value
    TRISJ = 0;                      // Seven segment display configures for output
    LATJ = 0;                       // clear LATJ in order to avoid unexpected situations
    LATH = 0;                       // clear LATH in order to avoid unexpected situations
    TRISH = TRISH & 0b11110000;     // set PORTH<3:0> as output

    tmr0secCounterInit = 50;     // set timer0 initial value configuration for 1 sec
    tmr0secCounter = tmr0secCounterInit;  // set timer0 counter for 1 sec
    tmr0Flag = 0;                   // clear flag for initialization
    bombSecInit = 20;			//set it to get 1 sec
    bombSec = bombSecInit;		//set bombSec to initial value

}

void interrupt ISR(void)
{
    if(TMR0IE && TMR0IF){               // timer0 interrupt comes
        TMR0 = tmr0Init;              // set timer0's initial value
        if(--timer0counter == 0){       //timer0 has arrived set its initial values and restart again
            switchVal = ADRES;
            timer0counter = timer0CounterInit; //reset timer0counter to it is initial value
            tmr0Flag = 1;               // set tmr0flag to 1
            switchVal= ADRES;			// get ADC value
            value = switchToVal();		//convert it to integer
            ADCON0bits.GO_DONE=1;       // start an A/D conversion
        }
        if(--tmr0secCounter == 0){      // check tmr0secCounter for to find out a sec passed
            tmr0secCounter = tmr0secCounterInit; // set tmr0secCounter to its initial value
            tmr0secFlag = 1;            // set tmr0secFlagto 1 in order to approve 1 sec passed
            winkFlag = !winkFlag;		// wink or not
            if(initialAdres != value){	// look if we need to wink
                entranceFlag = 1;
            }
            if(!entranceFlag)	// look if wink is enabled
                winking();
        }

            if(flag20Up) {			//look if we need to wait 20 sec
                if(time20 != 0){

                    time20sec--;
                    if(time20sec == 0) {
                        time20sec = time20secShadow;
                        time20--;
                    }
                }
                else{
                    time20 = 20;
                    flag20Up = 0;
                    ADIE = 1;			//Enable ADC interrupt after wrong pin
                    RBIE = 1;			// Enable RB interrupt after wrong pin
                    entranceFlag = 0;	// wink flag clear
                    cursorPos = 0;		// set cursor to where to wink
                    attempts = 2;
                    wrongPin = 0;		//wrong pin flag
                    WriteCommandToLCD(0x80);
                    switchVal = ADRES;
                    initialAdres = switchToVal();
                    ClearLCDScreen();
                    WriteStringToLCD(" Enter pin:#### ");
                    WriteCommandToLCD(0xC0);
                    WriteStringToLCD("  Attempts:2 ");


                }
		}
        TMR0IF = 0;                     // clear interrupt flag
        return;

    }

    else if(ADIE && ADIF)
    {
        if(entranceFlag)		// Enter if ADc value is changed
        {
            if(!pinSet)			// Enter if pin is not set
            {
				/*
					Look cursor which shows the position of the LED and handle the value which will be written to the LCD
				*/
                if(cursorPos == 0){
                sprintf(valueString,"%d",value);
                WriteCommandToLCD(0x8B);                    // Goto to the first digit of the pin on LCD
                WriteStringToLCD(valueString);
                }
                else if(cursorPos == 1){
                    sprintf(valueString,"%d",value);
                    WriteCommandToLCD(0x8C);                    // Goto to the second digit of the pin on LCD
                    WriteStringToLCD(valueString);
                }
                else if(cursorPos == 2){
                    sprintf(valueString,"%d",value);
                    WriteCommandToLCD(0x8D);                    // Goto to the third digit of the pin on LCD
                    WriteStringToLCD(valueString);
                }
                else if(cursorPos == 3){
                    sprintf(valueString,"%d",value);
                    WriteCommandToLCD(0x8E);                    // Goto to the fourth digit of the pin on LCD
                    WriteStringToLCD(valueString);
                }
            }
            else {
                if(cursorPos == 0){
                sprintf(valueString,"%d",value);
                WriteCommandToLCD(0x8B);                   // Goto to the first digit of the pin on LCD
                WriteStringToLCD(valueString);
                }
                else if(cursorPos == 1){
                    sprintf(valueString,"%d",value);
                    WriteCommandToLCD(0x8C);                    // Goto to the second digit of the pin on LCD
                    WriteStringToLCD(valueString);
                }
                else if(cursorPos == 2){
                    sprintf(valueString,"%d",value);
                    WriteCommandToLCD(0x8D);                    // Goto to the third digit of the pin on LCD
                    WriteStringToLCD(valueString);
                }
                else if(cursorPos == 3){
                    sprintf(valueString,"%d",value);
                    WriteCommandToLCD(0x8E);                  // Goto to the fourth digit of the pin on LCD
                    WriteStringToLCD(valueString);
                }

            }


        }
        ADIF = 0;                       // clear interrupt flag

        return;
    }
    else if(RBIE && RBIF) // RB port change interrupt comes
    {
        avoidMismatch = PORTB;                    // read PORTB in order to avoid mismatch condition
        RBIF = 0;                       // clear interrupt flag

        if(startClock == 0)				// Look if our state is Setting Pin
        {
            if(entranceFlag)			// If the value of the ADC integer is changed
            {
                if(PORTBbits.RB6 == 0)	// Look if Portb is pushed
                {

                    if(cursorPos == 0) {   // Look whether cursor is at position 0
                        pin[0] = value;
                        cursorPos = 1;
                        entranceFlag = 0;  // disable winking
                    }
                    else if(cursorPos == 1) { // Look whether cursor is at position 1
                        pin[1] = value;
                        cursorPos = 2;
                        entranceFlag = 0; // disable winking
                    }
                    else if(cursorPos == 2) { // Look whether cursor is at position 2
                        pin[2] = value;
                        cursorPos = 3;
                        entranceFlag = 0; // disable winking
                    }
                    else if(cursorPos == 3){ // Look whether cursor is at position 3
                        pin[3] = value;
                        entranceFlag = 1;  // disable winking
                        rb7Ready = 1;      // make RB7 pressable
                        ADIE = 0;         // disable ADCON interrupt
                    }

                    switchVal = ADRES;     //  UPDATE switchVal
                    initialAdres = switchToVal();  // update initialAdres to start winking
                }
            }

            if(PORTBbits.RB7 == 0) {   // check whether RB7 is pressed
                if(rb7Ready) {		// check if RB7 flag permission was given

                    pinSet = 1;      // if user can press RB7 pin is set
                    rb7Ready = 0;     //  user can no longer press RB7

                    RBIE = 0;       // RB interrupts are disabled
                    for(int m = 0; m < 3; m++) {      // Wink 3 times the new pin
                        ClearLCDScreen();
                        redLightAdjuster(10,10,10,10);		// show dashes in 7 segment display
                        iter = 0;
                        while(iter < 50)					//	Wait for 500 MS
                        {
							redLightAdjuster(10,10,10,10);  // show dashes in 7 segment display
                            __delay_ms(10);
                            iter++;
                        }
                        WriteCommandToLCD(0x80);                    // Goto to the beginning of the first line
                        WriteStringToLCD(" The new pin is ");
                        WriteCommandToLCD(0xC0);
						redLightAdjuster(10,10,10,10);				// show dashes in 7 segment display
                        sprintf(valueString,"   ---%d%d%d%d---   ",pin[0],pin[1],pin[2],pin[3]);     //	  Print Pin values on LCD
                        WriteStringToLCD(valueString);
						redLightAdjuster(10,10,10,10);		// show dashes in 7 segment display

                        iter = 0;
                        while(iter < 50) { 				//	Wait for 500 MS
							redLightAdjuster(10,10,10,10);  // show dashes in 7 segment display
							__delay_ms(10);
                            iter++;
                        }
						redLightAdjuster(10,10,10,10);    // show dashes in 7 segment display
                    }
                    RBIE = 1;    // enables RB interrupts
                    setFinish = 1;   // finish flag of pin setting operations
                    switchVal = ADRES;	//   update the switchVal to set initialAdres
                    initialAdres = switchToVal();   // set initialAdres to enable winking
                    entranceFlag = 0;      //enable winking
                    cursorPos = 0;
                    ADIE = 1;			// enable ADCON interrupts
                }



                if(setFinish == 1){				// If Setting finishes
                    startClock = 1;				//  enable count down
                    ClearLCDScreen();
                    WriteCommandToLCD(0x80);                    // Goto to the beginning of the first line
                    WriteStringToLCD(" Enter pin:#### ");
                    sprintf(valueString,"  Attempts:%d    ",attempts);
                    WriteCommandToLCD(0xC0);
                    WriteStringToLCD(valueString);
                    switchVal = ADRES;			//   update the switchVal to set initialAdres
                    initialAdres = switchToVal();	// set initialAdres to enable winking
                }
            }




        }

        else if(startClock == 1)			// if countdown started
        {

            if(entranceFlag)			// if user changed the potansiometer value
            {
                if(PORTBbits.RB6 == 0)     // if RB6 is pressed
                {
                    if(cursorPos == 0)			// Cursor is at 0 position of Pin
                    {
                        enteredPin[0] = value;		// take user's input
                        entranceFlag = 0;			// enable winking
                        cursorPos = 1;
                    }
                    else if(cursorPos == 1) {    // Cursor is at 1 position of Pin
                        enteredPin[1] = value;
                        entranceFlag = 0;
                        cursorPos = 2;
                    }
                    else if(cursorPos == 2) {   // Cursor is at 2 position of Pin
                        enteredPin[2] = value;
                        cursorPos = 3;
                        entranceFlag = 0;

                    }
                    else if(cursorPos == 3){    // Cursor is at 3 position of Pin
                        rb7Ready = 1;
                        enteredPin[3] = value;
                        entranceFlag = 1;
                        ADIE = 0;				// disable ADCON interrupts
                    }
                    switchVal = ADRES;
                    initialAdres = switchToVal();
                }
            }
                if(rb7Ready) {				// If user have permission to press RB7
                    if(PORTBbits.RB7 == 0)	// If RB7 is pressed
                    {
                       redLightAdjuster(0,bombTime/100,(bombTime/10)%10,bombTime%10);    // Show remaining time on 7 segment display
                       rb7Ready = 0;										// user can no longer press RB7
                       for(int h = 0; h < 4; h++) {					// Check whether Pin is correct
                           redLightAdjuster(0,bombTime/100,(bombTime/10)%10,bombTime%10);
                           if(enteredPin[h] != pin[h])
                               wrongPin = 1;
                       }
                       if(wrongPin) {    // If entered Pin is incorrect
                           attempts--;		// User has 1 less attempt left
                           if(attempts == 0) {		// If user has no more attempts
                               RBIE = 0;
                               ADIE = 0;
                               flag20Up = 1;			// 20 seconds countdown starts
                               entranceFlag = 1;		// winking is disabled
                               ClearLCDScreen();
                               WriteCommandToLCD(0x80);                    // Goto to the beginning of the first line
                               WriteStringToLCD(" Enter pin:XXXX ");
                               WriteCommandToLCD(0xC0);
                               WriteStringToLCD("Try after 20 sec.");

                           }
                           else {		// If user has more than 0 attempt
                               ClearLCDScreen();
                               cursorPos = 0;			// user starts from 0th pin
                           	   wrongPin = 0;
                           	   entranceFlag = 0;			//  winking is enabled
                               WriteCommandToLCD(0x80);                    // Goto to the beginning of the first line
                               WriteStringToLCD(" Enter pin:#### ");
                               WriteCommandToLCD(0xC0);
                               WriteStringToLCD("  Attempts:1    ");
                               switchVal = ADRES;        //   update the switchVal to set initialAdres
		                       initialAdres = switchToVal();  // set initialAdres to enable winking
                               ADIE = 1;
                           }
                       }
                       else {
                       	   gameFinish = 1;				// User pin is correct and game finishes, countdown stops
                           ClearLCDScreen();
                           RBIE = 0;					// Interrupts are disabled
                           ADIE = 0;					// Interrupts are disabled
                           WriteCommandToLCD(0x80);
                           WriteStringToLCD("Safe is opening!");
                           WriteCommandToLCD(0xC0);
                           WriteStringToLCD("$$$$$$$$$$$$$$$$");
                       }
                    }
                }

        }

        return;

    }


    if(TMR1IE && TMR1IF)				// If timer1 interrupt comes
    {
        TMR1 = tmr1Init;                          // set timer1's initial value

        if(--bombSec == 0)				// decrease timer if its not equal to zero
        {
            bombSec = bombSecInit;		// if timer is zero set initial value again
            if(startClock){				// if clockStart is enabled for countDown
                if(bombTime>0 && gameFinish == 0)	// If game didnt finished and time is not negative
                    --bombTime;						// decrease time
            }
        }
        TMR1IF = 0;                                 // clear interrupt flag
        return;
    }


    return;                                         // this code should never be executed!!!
}

int switchToVal(){    // gets the value of adres and converts into 1 digit
    /*
	This function takes the switchVal which is always set to ADRES before calling this function.
	Then converts the value to 1 digit so that user can enter 1 digit pin by potentiometer
	*/
    if(switchVal < 100) {
        return 0;
    }
	else if(switchVal < 200){
        return 1;
    }
	else if(switchVal < 300){
        return 2;
    }
	else if(switchVal < 400){
        return 3;
    }
	else if(switchVal < 500){
        return 4;
    }
	else if(switchVal < 600){
        return 5;
    }
	else if(switchVal < 700){
        return 6;
    }
	else if(switchVal < 800){
        return 7;
    }
	else if(switchVal < 900){
        return 8;
    }
	else {
        return 9;
    }
}

void winking(){ // Square or Blank character is shown on the LCD
	/**
	This function recursively changes the cursorPositionth position character
	on the LCD from " " to "#" to enable winking
	*/

    if(cursorPos == 0) {
        WriteCommandToLCD(0x8B);
    }
    if(cursorPos == 1) {
        WriteCommandToLCD(0x8C);
    }
    if(cursorPos == 2) {
        WriteCommandToLCD(0x8D);
    }
    if(cursorPos == 3) {
        WriteCommandToLCD(0x8E);
    }


    if(winkFlag){  // Wink Flag decides the character type
        WriteStringToLCD("#");
    }
    else{
        WriteStringToLCD(" ");
    }

}

void redLightAdjuster(int d0, int d1, int d2, int d3){

	/*
		This function get 4 inputs and sets the 7 segment display numbers accordingly.
	*/
    LATH = LATH & 0xF0;
    int numberArray[]={
        0b00111111,                     // 7-Segment = 0
        0b00000110,                     // 7-Segment = 1
        0b01011011,                     // 7-Segment = 2
        0b01001111,                     // 7-Segment = 3
        0b01100110,                     // 7-Segment = 4
        0b01101101,                     // 7-Segment = 5
        0b01111101,                     // 7-Segment = 6
        0b00000111,                     // 7-Segment = 7
        0b01111111,                     // 7-Segment = 8
        0b01100111,                     // 7-Segment = 9
        0b01000000,                     // 7-Segment = -
        0b00000000                      // 7-Segment = turn off
    };


    LATJ = numberArray[d3];             // Set LATJ to d3 parameter
    LATH3 = 1;                          // Turn on D3 of 7-segment display
    __delay_us(500);                    // wait for shortly
    LATH3 = 0;                          // Turn on D3 of 7-segment display
    LATJ = numberArray[d2];                     // Set LATJ to d2 parameter
    LATH2 = 1;                          // Turn on D2 of 7-segment display
    __delay_us(500);                    // wait for shortly
    LATH2 = 0;                          // Turn on D2 of 7-segment display
    LATJ = numberArray[d1];                     // Set LATJ to d1 parameter
    LATH1 = 1;                          // Turn on D1 of 7-segment display
    __delay_us(500);                    // wait for shortly
    LATH1 = 0;                          // Turn on D1 of 7-segment display
    LATJ = numberArray[d0];                     // Set LATJ to d0 parameter
    LATH0 = 1;                          // Turn on D0 of 7-segment display
    __delay_us(500);                    // wait for shortly
    LATH0 = 0;                          // Turn on D0 of 7-segment display
    return;
}


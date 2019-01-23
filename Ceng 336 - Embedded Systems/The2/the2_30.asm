; MUHAMMED YUSUF TEMIZER 2099356
; IRFAN CAN KALELI       2035996
; GROUP 30

;IN ORDER TO MOVE PADDLES, YOU NEED TO PRESS AND RELEASE

list P=18F8722

#include <p18f8722.inc>
config OSC = HSPLL, FCMEN = OFF, IESO = OFF, PWRT = OFF, BOREN = OFF, WDT = OFF, MCLRE = ON, LPT1OSC = OFF, LVP = OFF, XINST = OFF, DEBUG = OFF

state   udata 0x21
state

counter   udata 0x22
counter

w_temp  udata 0x23
w_temp

status_temp udata 0x24
status_temp

pclath_temp udata 0x25
pclath_temp

portb_var   udata 0x26
portb_var

t1   udata 0x27
t1
t2   udata 0x28
t2
t3   udata 0x29
t3
ball_direction udata 0x2A
ball_direction
ball_pos_x  udata   0x2B
ball_pos_x
ball_pos_y  udata   0x2E
ball_pos_y
rand_1  udata   0x2C
rand_1
rand_2  udata 0x2D
rand_2
random_number   udata   0x2F
random_number
score_1         udata   0x30
score_1
score_2         udata   0x31
score_2
pos_1         udata   0x32
pos_1
pos_2         udata   0x33
pos_2
temp1         udata   0x34
temp1
pushed0     udata   0x35
pushed0
pushed1     udata   0x36
pushed1
pushed2     udata   0x37
pushed2
pushed03     udata   0x38
pushed3
                  ;IN ORDER TO MOVE PADDLES, YOU NEED TO PRESS AND RELEASE

org     0x00
goto    init

org     0x08
goto    isr             ;go to interrupt service routine


TABLE
    MOVF    PCL, F  ; A simple read of PCL will update PCLATH, PCLATU
    RLNCF   WREG, W ; multiply index X2
    ADDWF   PCL, F  ; modify program counter
    RETLW b'00111111' ;0 representation in 7-seg. disp. portJ
    RETLW b'00000110' ;1 representation in 7-seg. disp. portJ
    RETLW b'01011011' ;2 representation in 7-seg. disp. portJ
    RETLW b'01001111' ;3 representation in 7-seg. disp. portJ
    RETLW b'01100110' ;4 representation in 7-seg. disp. portJ
    RETLW b'01101101' ;5 representation in 7-seg. disp. portJ
    RETLW b'01111101' ;6 representation in 7-seg. disp. portJ
    RETLW b'00000111' ;7 representation in 7-seg. disp. portJ
    RETLW b'01111111' ;8 representation in 7-seg. disp. portJ
    RETLW b'01100111' ;9 representation in 7-seg. disp. portJ

init:
    CLRF    ball_direction
    MOVLW   0x3F
    MOVWF   LATA
    MOVWF   LATB
    MOVWF   LATC
    MOVWF   LATD
    MOVWF   LATE
    MOVWF   LATF
    MOVLW   0xF
    CLRF    LATG
    MOVWF   TRISG
    CLRF    TRISA
    CLRF    TRISB
    CLRF    TRISC
    CLRF    TRISD
    CLRF    TRISE
    CLRF    TRISF
    CLRF    TRISH
    CLRF    TRISJ
    Call    Delay_2sec
    CLRF    LATB
    CLRF    LATC
    CLRF    LATD
    CLRF    LATE
    CLRF    LATH
    CLRF    LATJ
    MOVLW   0x1C
    MOVWF   LATA
    MOVWF   LATF
    MOVLW   0x8
    MOVWF   LATD
    CLRF    rand_1
    CLRF    rand_2
    CLRF    score_1
    CLRF    score_2
    CLRF    pushed3
    CLRF    pushed2
    CLRF    pushed1
    CLRF    pushed0
    MOVLW   d'3'
    MOVWF   ball_pos_x
    MOVWF   ball_pos_y
    MOVLW   d'2'
    MOVWF   pos_1
    MOVWF   pos_2
    ;Disable interrupts
    clrf    INTCON
    clrf    INTCON2
    ;Initialize Timer0
    movlw   b'01000111' ;Disable Timer0 by setting TMR0ON to 0 (for now)
                        ;Configure Timer0 as an 8-bit timer/counter by setting T08BIT to 1
                        ;Timer0 increment from internal clock with a prescaler of 1:256.
    movwf   T0CON ; T0CON = b'01000111'
    ;Enable interrupts
    movlw   b'11100000' ;Enable Global, peripheral, Timer0 and RB interrupts by setting GIE, PEIE, TMR0IE and RBIE bits to 1
    movwf   INTCON
    bsf     T0CON, 7    ;Enable Timer0 by setting TMR0ON to 1
main:


                  ;IN ORDER TO MOVE PADDLES, YOU NEED TO PRESS AND RELEASE
    MOVLW   0x5
    CPFSEQ  score_1
    goto    score_2_check
    goto    finish
    score_2_check:
    MOVLW   0x5
    CPFSEQ  score_2
    goto    mainLoop
    finish:
        MOVLW   b'00000000'
        MOVWF   INTCON
        MOVWF   T0CON
        CLRF    LATA
        CLRF    LATF
        CLRF    LATB
        CLRF    LATE
        MOVLW   0x1C
        MOVWF   LATA
        MOVWF   LATF
        MOVLW   0x8
        MOVWF   LATD
        MOVLW   d'3'
        MOVWF   ball_pos_x
        MOVWF   ball_pos_y
        MOVLW   d'2'
        MOVWF   pos_1
        MOVWF   pos_2
        infinite_loop:
            MOVF    score_1,0
            Call    TABLE
            MOVWF   LATJ
            BSF     LATH,3
            call    delay
            BCF     LATH,3
            MOVF    score_2,0
            Call    TABLE
            MOVWF   LATJ
            BSF     LATH,0

            call    delay
            BCF     LATH,0
            GOTO    infinite_loop
    mainLoop:

                  ;IN ORDER TO MOVE PADDLES, YOU NEED TO PRESS AND RELEASE

    call    Button_task_3
    call    Button_task_2
    call    Button_task_1
    call    Button_task_0
    MOVF    score_1,0
    Call    TABLE
    MOVWF   LATJ
    BSF     LATH,3
    call    delay
    BCF     LATH,3
    MOVF    score_2,0
    Call    TABLE
    MOVWF   LATJ
    BSF     LATH,0
    call    delay
    BCF     LATH,0
    INCF    rand_1
    INCF    rand_1
    INCF    rand_2
    INCF    rand_2
    INCF    rand_2
    MOVF    rand_2,0
    XORWF   rand_1,0
    MOVWF   random_number
    goto main
delay
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
return
Button_task_3:
    BTFSS PORTG,3
    GOTO state30
    GOTO state31
    state30:
        CLRF    WREG
        CPFSGT  pushed3
        return
        CLRF    pushed3
        check3_0:
            MOVLW   b'00111000'
            CPFSEQ  LATA
            GOTO    check3_1
            MOVLW   b'00011100'
            MOVWF   LATA
            MOVLW   d'2'
            MOVWF   pos_1
            return
        check3_1:
            MOVLW   b'00011100'
            CPFSEQ  LATA
            GOTO    check3_2
            MOVLW   b'00001110'
            MOVWF   LATA
            MOVLW   d'1'
            MOVWF   pos_1
            return
        check3_2:
            MOVLW   b'00001110'
            CPFSEQ  LATA
            return
            MOVLW   b'00000111'
            MOVWF   LATA
            MOVLW   d'0'
            MOVWF   pos_1
            return
    state31:
        MOVLW   0x1
        MOVWF   pushed3
        return
Button_task_2:
    BTFSS PORTG,2
    GOTO state20
    GOTO state21
    state20:
        CLRF    WREG
        CPFSGT  pushed2
        return
        CLRF    pushed2
    check2_0:
        MOVLW   b'00000111'
        CPFSEQ  LATA
        GOTO check2_1
        MOVLW   b'00001110'
        MOVWF   LATA
        MOVLW   d'1'
        MOVWF   pos_1
        return
    check2_1:
        MOVLW   b'00001110'
        CPFSEQ  LATA
        GOTO check2_2
        MOVLW   b'00011100'
        MOVWF   LATA
        MOVLW   d'2'
        MOVWF   pos_1
        return
    check2_2:
        MOVLW   b'00011100'
        CPFSEQ  LATA
        return
        MOVLW   b'00111000'
        MOVWF   LATA
        MOVLW   d'3'
        MOVWF   pos_1
        return
    state21:
    MOVLW   0x1
    MOVWF   pushed2
    return
Button_task_1:
    BTFSS PORTG,1     
    GOTO state10
    GOTO state11
    state10:
        CLRF    WREG
        CPFSGT  pushed1
        return
        CLRF    pushed1
    check1_0:
        MOVLW   b'00111000'
        CPFSEQ  LATF
        GOTO    check1_1
        MOVLW   b'00011100'
        MOVWF   LATF
        MOVLW   d'2'
        MOVWF   pos_2
        return
    check1_1:
        MOVLW   b'00011100'
        CPFSEQ  LATF
        GOTO    check1_2
        MOVLW   b'00001110'
        MOVWF   LATF
        MOVLW   d'1'
        MOVWF   pos_2
        return
    check1_2:
        MOVLW   b'00001110'
        CPFSEQ  LATF
        return
        MOVLW   b'00000111'
        MOVWF   LATF
        MOVLW   d'0'
        MOVWF   pos_2
        return
    state11:
    MOVLW   0x1
    MOVWF   pushed1
    return
Button_task_0:
    BTFSS PORTG,0
    GOTO state00
    GOTO state01
    state00:
        CLRF    WREG
        CPFSGT  pushed0
        return
        CLRF    pushed0
    check0_0:
        MOVLW   b'00000111'
        CPFSEQ  LATF
        GOTO    check0_1
        MOVLW   b'00001110'
        MOVWF   LATF
        MOVLW   d'1'
        MOVWF   pos_2
        return
    check0_1:
        MOVLW   b'00001110'
        CPFSEQ  LATF
        GOTO    check0_2
        MOVLW   b'00011100'
        MOVWF   LATF
        MOVLW   d'2'
        MOVWF   pos_2
        return
    check0_2:
        MOVLW   b'00011100'
        CPFSEQ  LATF
        return
        MOVLW   b'00111000'
        MOVWF   LATF
        MOVLW   d'3'
        MOVWF   pos_2
        return
    state01:
    MOVLW   0x1
    MOVWF   pushed0
    return
isr:
    call save_registers
    goto timer_interrupt
timer_interrupt:
    incf	counter, f              ;Timer interrupt handler part begins here by incrementing count variable
    movf	counter, w              ;Move count to Working register
    sublw	d'60'                    ;Decrement 5 from Working register
    btfss	STATUS, Z               ;Is the result Zero?
    goto	timer_interrupt_exit    ;No, then exit from interrupt service routine
    clrf	counter                 ;Yes, then clear count variable
    ;INCF    LATC            ;Complement our state variable which controls on/off state of LED0
    CLRF    WREG
    CPFSEQ  ball_direction
    goto    right
    goto    left
    left:
        check0Bit:
            BTFSS  random_number,0
            goto bit0Clear
            bit0Set:
                BTFSS   random_number,1
                goto bit1Clear1
                bit1Set1:
                    ; case 11
                    ballOnB11:
                        MOVLW   d'1'
                        CPFSEQ  ball_pos_x
                        GOTO    ballOnC11
                        MOVF    pos_1,0
                        CPFSLT  ball_pos_y
                        goto    check_bounce11
                        GOTO    goal_1
                        check_bounce11:
                            MOVF    pos_1,0
                            INCF    WREG
                            INCF    WREG
                            CPFSGT  ball_pos_y
                            goto    bounce
                            goto    goal_1
                        bounce:
                            INCF    ball_direction
                            goto    timer_interrupt_exit
                        goal_1:                            
                            INCF    score_1
                            CLRF    LATA
                            CLRF    LATF
                            CLRF    LATB
                            CLRF    LATE
                            MOVLW   0x1C
                            MOVWF   LATA
                            MOVWF   LATF
                            MOVLW   0x8
                            MOVWF   LATD
                            MOVLW   d'3'
                            MOVWF   ball_pos_x
                            MOVWF   ball_pos_y
                            MOVLW   d'2'
                            MOVWF   pos_1
                            MOVWF   pos_2
                            goto    timer_interrupt_exit
                    ballOnC11:
                        MOVLW d'2'
                        CPFSEQ ball_pos_x
                        GOTO ballOnD11
                        MOVFF LATC,LATB
                        CLRF LATC
                        DECF ball_pos_x
                        goto timer_interrupt_exit
                    ballOnD11:
                        MOVLW   d'3'
                        CPFSEQ  ball_pos_x
                        GOTO    ballOnE11
                        MOVFF   LATD,LATC
                        CLRF    LATD
                        DECF     ball_pos_x
                        goto    timer_interrupt_exit
                    ballOnE11:
                        MOVLW    d'4'
                        CPFSEQ   ball_pos_x
                        goto     timer_interrupt_exit
                        MOVFF    LATE,LATD
                        CLRF     LATE
                        DECF     ball_pos_x
                        goto     timer_interrupt_exit
                bit1Clear1:
                    ;; case 01
                    ballOnB01:
                        MOVLW   d'1'
                        CPFSEQ  ball_pos_x
                        goto    ballOnC01
                        CLRF    WREG
                        CPFSEQ  ball_pos_y
                        GOTO    y_set_B01
                        GOTO    ballOnB11
                        y_set_B01:
                            MOVF    ball_pos_y,0
                            DECF    WREG
                            CPFSGT  pos_1
                            GOTO check_bounce01
                            GOTO goal_1
                            check_bounce01:
                                MOVFF    ball_pos_y,temp1
                                DECF    temp1
                                MOVF    pos_1,0
                                INCF    WREG
                                INCF    WREG
                                CPFSGT  temp1
                                GOTO bounce
                                GOTO goal_1                            
                    ballOnC01:
                        MOVLW   d'2'
                        CPFSEQ  ball_pos_x
                        goto    ballOnD01
                        CLRF    WREG
                        CPFSEQ  ball_pos_y
                        GOTO    y_set_C01
                        MOVFF   LATC,LATB
                        CLRF    LATC
                        DECF    ball_pos_x
                        goto timer_interrupt_exit
                        y_set_C01:
                            MOVFF   LATC,LATB
                            RRNCF   LATB
                            CLRF    LATC
                            DECF    ball_pos_x
                            DECF    ball_pos_y
                            GOTO    timer_interrupt_exit
                    ballOnD01:
                        MOVLW   d'3'
                        CPFSEQ  ball_pos_x
                        GOTO    ballOnE01
                        CLRF    WREG
                        CPFSEQ  ball_pos_y
                        GOTO    y_set_D01
                        MOVFF   LATD,LATC
                        CLRF    LATD
                        DECF    ball_pos_x
                        GOTO    timer_interrupt_exit
                        y_set_D01:
                            MOVFF   LATD,LATC
                            RRNCF   LATC
                            CLRF    LATD
                            DECF    ball_pos_x
                            DECF    ball_pos_y
                            GOTO    timer_interrupt_exit

                    ballOnE01:
                        MOVLW   d'4'
                        CPFSEQ  ball_pos_x
                        GOTO    timer_interrupt_exit
                        CLRF    WREG
                        CPFSEQ  ball_pos_y
                        GOTO    y_set_E01
                        MOVFF   LATE,LATD
                        CLRF    LATE
                        DECF    ball_pos_x
                        GOTO    timer_interrupt_exit
                        y_set_E01:
                            MOVFF   LATE,LATD
                            RRNCF   LATD
                            CLRF    LATE
                            DECF    ball_pos_x
                            DECF    ball_pos_y
                            GOTO    timer_interrupt_exit                  
                                              


        bit0Clear:
                BTFSS   random_number,1
                goto bit1Clear2
                bit1Set2:
                ;; case 10
                    ballOnB10:
                        MOVLW   d'1'
                        CPFSEQ  ball_pos_x
                        goto    ballOnC10
                        MOVLW   d'5'
                        CPFSEQ  ball_pos_y
                        GOTO    y_set_B10
                        GOTO    ballOnB11
                        y_set_B10:                            
                            MOVF    ball_pos_y,0
                            INCF    WREG
                            CPFSGT  pos_1
                            GOTO check_bounce10
                            GOTO goal_1
                            check_bounce10:
                            MOVF    ball_pos_y,0
                            INCF    WREG
                            MOVFF   pos_1,temp1
                            INCF    temp1
                            INCF    temp1
                            CPFSLT  temp1
                            GOTO bounce
                            GOTO goal_1                            
                    ballOnC10:
                        MOVLW   d'2'
                        CPFSEQ  ball_pos_x
                        goto    ballOnD10
                        MOVLW   d'5'
                        CPFSEQ  ball_pos_y
                        GOTO    y_set_C10
                        GOTO    ballOnC11
                        y_set_C10:
                            MOVFF   LATC,LATB
                            RLNCF   LATB
                            CLRF    LATC
                            DECF    ball_pos_x
                            INCF    ball_pos_y
                            GOTO    timer_interrupt_exit                       
                    ballOnD10:
                        MOVLW   d'3'
                        CPFSEQ  ball_pos_x
                        goto    ballOnE10
                        MOVLW   d'5'
                        CPFSEQ  ball_pos_y
                        GOTO    y_set_D10
                        GOTO    ballOnD11
                        y_set_D10:
                            MOVFF   LATD,LATC
                            RLNCF   LATC
                            CLRF    LATD
                            DECF    ball_pos_x
                            INCF    ball_pos_y
                            GOTO    timer_interrupt_exit

                    ballOnE10:
                        MOVLW   d'4'
                        CPFSEQ  ball_pos_x
                        goto    timer_interrupt_exit
                        MOVLW   d'5'
                        CPFSEQ  ball_pos_y
                        GOTO    y_set_E10
                        GOTO    ballOnE11
                        y_set_E10:
                            MOVFF   LATE,LATD
                            RLNCF   LATD
                            CLRF    LATE
                            DECF    ball_pos_x
                            INCF    ball_pos_y
                            GOTO    timer_interrupt_exit
        bit1Clear2:
                    GOTO bit1Set1
                    
    right:
        check0BitR:
            BTFSS  random_number,0
            goto bit0ClearR
            bit0SetR:
                BTFSS   random_number,1
                goto bit1Clear1R
                bit1Set1R:
                    ; case 11
                    ballOnE11R:
                        MOVLW   d'4'
                        CPFSEQ  ball_pos_x
                        GOTO    ballOnD11R
                        MOVF    pos_2,0
                        CPFSLT  ball_pos_y
                        goto    check_bounce11R
                        GOTO    goal_2
                        check_bounce11R:
                            MOVF    pos_2,0
                            INCF    WREG
                            INCF    WREG
                            CPFSGT  ball_pos_y
                            goto    bounceR
                            goto    goal_2
                        bounceR:
                            DECF    ball_direction
                            goto    timer_interrupt_exit
                        goal_2:
                            INCF    score_2
                            CLRF    LATA
                            CLRF    LATF
                            CLRF    LATB
                            CLRF    LATE
                            MOVLW   0x1C
                            MOVWF   LATA
                            MOVWF   LATF
                            MOVLW   0x8
                            MOVWF   LATD
                            MOVLW   d'3'
                            MOVWF   ball_pos_x
                            MOVWF   ball_pos_y
                            MOVLW   d'2'
                            MOVWF   pos_1
                            MOVWF   pos_2
                            goto    timer_interrupt_exit
                    ballOnD11R:
                        MOVLW   d'3'
                        CPFSEQ  ball_pos_x
                        GOTO    ballOnC11R
                        MOVFF   LATD,LATE
                        CLRF    LATD
                        INCF    ball_pos_x
                        goto    timer_interrupt_exit
                    ballOnC11R:
                        MOVLW   d'2'
                        CPFSEQ  ball_pos_x
                        GOTO    ballOnB11R
                        MOVFF   LATC,LATD
                        CLRF    LATC
                        INCF    ball_pos_x
                        goto    timer_interrupt_exit
                    ballOnB11R:
                        MOVLW    d'1'
                        CPFSEQ   ball_pos_x
                        goto     timer_interrupt_exit
                        MOVFF    LATB,LATC
                        CLRF     LATB
                        INCF     ball_pos_x
                        goto     timer_interrupt_exit
                bit1Clear1R:
                    ;; case 01
                    ballOnE01R:
                        MOVLW   d'4'
                        CPFSEQ  ball_pos_x
                        goto    ballOnD01R
                        CLRF    WREG
                        CPFSEQ  ball_pos_y
                        GOTO    y_set_E01R
                        GOTO    ballOnE11R
                        y_set_E01R:
                            MOVF    ball_pos_y,0
                            DECF    WREG
                            CPFSGT  pos_2
                            GOTO    check_bounce01R
                            GOTO    goal_2
                            check_bounce01R:
                                MOVFF   ball_pos_y,temp1
                                DECF    temp1
                                MOVF    pos_2,0
                                INCF    WREG
                                INCF    WREG
                                CPFSGT  temp1
                                GOTO bounceR
                                GOTO goal_2
                    ballOnD01R:
                        MOVLW   d'3'
                        CPFSEQ  ball_pos_x
                        goto    ballOnC01R
                        CLRF    WREG
                        CPFSEQ  ball_pos_y
                        GOTO    y_set_D01R
                        MOVFF   LATD,LATE
                        CLRF    LATD
                        INCF    ball_pos_x
                        goto    timer_interrupt_exit
                        y_set_D01R:
                            MOVFF   LATD,LATE
                            RRNCF   LATE
                            CLRF    LATD
                            INCF    ball_pos_x
                            DECF    ball_pos_y
                            GOTO    timer_interrupt_exit
                    ballOnC01R:
                        MOVLW   d'2'
                        CPFSEQ  ball_pos_x
                        GOTO    ballOnB01R
                        CLRF    WREG
                        CPFSEQ  ball_pos_y
                        GOTO    y_set_C01R
                        MOVFF   LATC,LATD
                        CLRF    LATC
                        INCF    ball_pos_x
                        GOTO    timer_interrupt_exit
                        y_set_C01R:
                            MOVFF   LATC,LATD
                            RRNCF   LATD
                            CLRF    LATC
                            INCF    ball_pos_x
                            DECF    ball_pos_y
                            GOTO    timer_interrupt_exit
                    ballOnB01R:
                        MOVLW   d'1'
                        CPFSEQ  ball_pos_x
                        GOTO    timer_interrupt_exit
                        CLRF    WREG
                        CPFSEQ  ball_pos_y
                        GOTO    y_set_B01R
                        MOVFF   LATB,LATC
                        CLRF    LATB
                        INCF    ball_pos_x
                        GOTO    timer_interrupt_exit
                        y_set_B01R:
                            MOVFF   LATB,LATC
                            RRNCF   LATC
                            CLRF    LATB
                            INCF    ball_pos_x
                            DECF    ball_pos_y
                            GOTO    timer_interrupt_exit
        bit0ClearR:
                BTFSS   random_number,1
                goto bit1Clear2R
                bit1Set2R:
                ;; case 10
                    ballOnE10R:
                        MOVLW   d'4'
                        CPFSEQ  ball_pos_x
                        GOTO    ballOnD10R
                        MOVLW   d'5'
                        CPFSEQ  ball_pos_y
                        GOTO    y_set_E10R
                        GOTO    ballOnE11R
                        y_set_E10R:
                            MOVF    ball_pos_y,0
                            INCF    WREG
                            CPFSGT  pos_1
                            GOTO check_bounce10R
                            GOTO goal_2
                            check_bounce10R:
                            MOVF    ball_pos_y,0
                            INCF    WREG
                            MOVFF   pos_1,temp1
                            INCF    temp1
                            INCF    temp1
                            CPFSLT  temp1
                            GOTO bounceR
                            GOTO goal_2
                    ballOnD10R:
                        MOVLW   d'3'
                        CPFSEQ  ball_pos_x
                        goto    ballOnC10R
                        MOVLW   d'5'
                        CPFSEQ  ball_pos_y
                        GOTO    y_set_D10R
                        GOTO    ballOnD11R
                        y_set_D10R:
                            MOVFF   LATD,LATE
                            RLNCF   LATE
                            CLRF    LATD
                            INCF    ball_pos_x
                            INCF    ball_pos_y
                            GOTO    timer_interrupt_exit
                    ballOnC10R:
                        MOVLW   d'2'
                        CPFSEQ  ball_pos_x
                        goto    ballOnB10R
                        MOVLW   d'5'
                        CPFSEQ  ball_pos_y
                        GOTO    y_set_C10R
                        GOTO    ballOnC11R
                        y_set_C10R:
                            MOVFF   LATC,LATD
                            RLNCF   LATD
                            CLRF    LATC
                            INCF    ball_pos_x
                            INCF    ball_pos_y
                            GOTO    timer_interrupt_exit
                    
                    ballOnB10R:                                        
                        MOVLW   d'1'
                        CPFSEQ  ball_pos_x
                        goto    timer_interrupt_exit
                        MOVLW   d'5'
                        CPFSEQ  ball_pos_y
                        GOTO    y_set_B10R
                        GOTO    ballOnB11R
                        y_set_B10R:
                            MOVFF   LATB,LATC
                            RLNCF   LATC
                            CLRF    LATB
                            INCF    ball_pos_x
                            INCF    ball_pos_y
                            GOTO    timer_interrupt_exit

        bit1Clear2R:
                    GOTO bit1Set1R   


timer_interrupt_exit:
    bcf     INTCON, 2           ;Clear TMROIF
	movlw	d'61'               ;256-61=195; 195*256*5 = 249600 instruction cycle;
	movwf	TMR0
	call	restore_registers   ;Restore STATUS and PCLATH registers to their state before interrupt occurs
	retfie


save_registers:
    movwf 	w_temp          ;Copy W to TEMP register
    swapf 	STATUS, w       ;Swap status to be saved into W
    clrf 	STATUS          ;bank 0, regardless of current bank, Clears IRP,RP1,RP0
    movwf 	status_temp     ;Save status to bank zero STATUS_TEMP register
    movf 	PCLATH, w       ;Only required if using pages 1, 2 and/or 3
    movwf 	pclath_temp     ;Save PCLATH into W
    clrf 	PCLATH          ;Page zero, regardless of current page
    return

restore_registers:
    movf 	pclath_temp, w  ;Restore PCLATH
    movwf 	PCLATH          ;Move W into PCLATH
    swapf 	status_temp, w  ;Swap STATUS_TEMP register into W
    movwf 	STATUS          ;Move W into STATUS register
    swapf 	w_temp, f       ;Swap W_TEMP
    swapf 	w_temp, w       ;Swap W_TEMP into W
    return




DELAY_0_5sec	; Time Delay Routine with 3 nested loops
    MOVLW 7	; Copy desired value to W
    MOVWF t3	; Copy W into t3
    _loop3:
        MOVLW 0xFF  ; Copy desired value to W
        MOVWF t2    ; Copy W into t2
        _loop2:
                CLRF    LATH
                BSF     LATH,1
                MOVFF   score_1,LATJ
                call    delay
                CLRF    LATH
                BSF     LATH,3
                MOVFF   score_2,LATJ
                call    delay
            MOVLW 0x5FF	; Copy desired value to W
            MOVWF t1	; Copy W into t1
            _loop1:
                decfsz t1,F ; Decrement t1. If 0 Skip next instruction
                GOTO _loop1 ; ELSE Keep counting down
                decfsz t2,F ; Decrement t2. If 0 Skip next instruction
                GOTO _loop2 ; ELSE Keep counting down
                decfsz t3,F ; Decrement t3. If 0 Skip next instruction
                GOTO _loop3 ; ELSE Keep counting down
	return

DELAY_clockwise	; Time Delay Routine with 3 nested loops
    MOVLW 26	; Copy desired value to W
    MOVWF t3	; Copy W into t3
    _loop35:
	MOVLW 0xA4  ; Copy desired value to W
	MOVWF t2    ; Copy W into t2
	_loop25:
	    MOVLW 0x9F	; Copy desired value to W
	    MOVWF t1	; Copy W into t1
	    _loop15:
		decfsz t1,F ; Decrement t1. If 0 Skip next instruction
		GOTO _loop15 ; ELSE Keep counting down
		decfsz t2,F ; Decrement t2. If 0 Skip next instruction
		GOTO _loop25 ; ELSE Keep counting down
		decfsz t3,F ; Decrement t3. If 0 Skip next instruction
		GOTO _loop35 ; ELSE Keep counting down
		return

Delay_2sec	; Time Delay Routine with 3 nested loops
    MOVLW 300	; Copy desired value to W
    MOVWF t3	; Copy W into t3
    _loop351:
	MOVLW 0xA4  ; Copy desired value to W
	MOVWF t2    ; Copy W into t2
	_loop251:
	    MOVLW 0x9F	; Copy desired value to W
	    MOVWF t1	; Copy W into t1
	    _loop151:
		decfsz t1,F ; Decrement t1. If 0 Skip next instruction
		GOTO _loop151 ; ELSE Keep counting down
		decfsz t2,F ; Decrement t2. If 0 Skip next instruction
		GOTO _loop251 ; ELSE Keep counting down
		decfsz t3,F ; Decrement t3. If 0 Skip next instruction
		GOTO _loop351 ; ELSE Keep counting down
		return
end

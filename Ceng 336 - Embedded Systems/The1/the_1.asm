    #include "p18f8722.inc"
; CONFIG1H
  CONFIG  OSC = HSPLL, FCMEN = OFF, IESO = OFF
; CONFIG2L
  CONFIG  PWRT = OFF, BOREN = OFF, BORV = 3
; CONFIG2H
  CONFIG  WDT = OFF, WDTPS = 32768
; CONFIG3L
  CONFIG  MODE = MC, ADDRBW = ADDR20BIT, DATABW = DATA16BIT, WAIT = OFF
; CONFIG3H
  CONFIG  CCP2MX = PORTC, ECCPMX = PORTE, LPT1OSC = OFF, MCLRE = ON
; CONFIG4L
  CONFIG  STVREN = ON, LVP = OFF, BBSIZ = BB2K, XINST = OFF
; CONFIG5L
  CONFIG  CP0 = OFF, CP1 = OFF, CP2 = OFF, CP3 = OFF, CP4 = OFF, CP5 = OFF
  CONFIG  CP6 = OFF, CP7 = OFF
; CONFIG5H
  CONFIG  CPB = OFF, CPD = OFF
; CONFIG6L
  CONFIG  WRT0 = OFF, WRT1 = OFF, WRT2 = OFF, WRT3 = OFF, WRT4 = OFF
  CONFIG  WRT5 = OFF, WRT6 = OFF, WRT7 = OFF
; CONFIG6H
  CONFIG  WRTC = OFF, WRTB = OFF, WRTD = OFF
; CONFIG7L
  CONFIG  EBTR0 = OFF, EBTR1 = OFF, EBTR2 = OFF, EBTR3 = OFF, EBTR4 = OFF
  CONFIG  EBTR5 = OFF, EBTR6 = OFF, EBTR7 = OFF
; CONFIG7H
  CONFIG  EBTRB = OFF

;*******************************************************************************
; Variables & Constants
;*******************************************************************************
UDATA_ACS
  t1        res 1	; used in delay
  t2        res 1	; used in delay
  t3        res 1	; used in delay
  clk_state res 1
  state     res 1
  kose      res 2	; controlled by RB0 button
;*******************************************************************************
; Reset Vector
;*******************************************************************************

RES_VECT  CODE    0x0000            ; processor reset vector
    GOTO    START                   ; go to beginning of program

;*******************************************************************************
; MAIN PROGRAM
;*******************************************************************************

MAIN_PROG CODE	; let linker place main program


START
    call INIT	; initialize variables and ports
    call DELAY	; wait a second
    call DELAY
    CLRF LATA
    CLRF LATB
    CLRF LATC
    CLRF LATD

    MOVLW   0x1

    MOVWF   state
    MOVWF   clk_state
    MOVWF   kose

    MOVLW   0x1
    MOVWF   LATA

    MOVLW   0x1
    MOVWF   LATB



MAIN_LOOP
 

    _state_end:

    call DELAY	; wait a second

    call BUTTON_TASK_1; check RB0 button press (portB)
    GOTO MAIN_LOOP  ; loop forever


BUTTON_TASK_1 ; very primitive button task
    BTFSS PORTA,4
    return
    _debounce:
	BTFSC PORTA,4
	goto _debounce	; busy waiting. FIXME !!!
	COMF state, 1
	return



DELAY	; Time Delay Routine with 3 nested loops
    MOVLW 82	; Copy desired value to W
    MOVWF t3	; Copy W into t3
    _loop3:
	MOVLW 0xA0  ; Copy desired value to W
	MOVWF t2    ; Copy W into t2
	_loop2:
	    MOVLW 0x9F	; Copy desired value to W
	    MOVWF t1	; Copy W into t1
	    _loop1:
		decfsz t1,F ; Decrement t1. If 0 Skip next instruction
		GOTO _loop1 ; ELSE Keep counting down
		decfsz t2,F ; Decrement t2. If 0 Skip next instruction
		GOTO _loop2 ; ELSE Keep counting down
		decfsz t3,F ; Decrement t3. If 0 Skip next instruction
		GOTO _loop3 ; ELSE Keep counting down
		return


INIT
    CLRF    state
    MOVWF   ADCON1
    MOVLW   0Cfh
    MOVLW   0xF
    MOVWF   LATA
    MOVWF   LATB
    MOVWF   LATC
    MOVWF   LATD
    MOVLW   0x10
    MOVWF   TRISA
    MOVLW   0x20
    MOVWF   TRISB
    CLRF    TRISC
    CLRF    TRISD
    return








END
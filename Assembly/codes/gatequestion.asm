.include "/sdcard/FWC/assembly/m328Pdef.inc"
ldi r16,0b10000011
out DDRD,r16
ldi r17,0b11111111  ; activating pull ups
out PORTD,r17
ldi r16,0b00000001
out DDRB,r16            ;declaring 8th pin as output

loop:                   ;loop for reading the input from pins 2,3,4,5,6 continously

  in r17,PIND             ;reading the data from pins 2,3,4,5,6

;Taking T
  ldi r24,0b00000010
  mov r31,r17
  and r31,r24
  ldi r25,0b00000001
  loopt:
    lsr r31
    dec r25
    brne    loopt
  .DEF T = r31


;Taking S
  ldi r24,0b00000100
  mov r18,r17
  and r18,r24
  ldi r25,0b00000010
  loops:  
    lsr r18
    dec r25
    brne    loops
  .DEF S = r18

;Taking R
  ldi r24,0b00001000
  mov r19,r17
  and r19,r24
  ldi r25,0b00000011
  loopr:  
    lsr r19
    dec r25 
    brne    loopr
  .DEF R = r19

;Taking Q
  ldi r24,0b00010000
  mov r20,r17
  and r20,r24
  ldi r25,0b00000100
  loopq:  
    lsr r20
    dec r25
    brne    loopq
  .DEF Q = r20
  
;Taking P
  ldi r24,0b00100000
  mov r21,r17
  and r21,r24
  ldi r25,0b00000111
  loopp:  
    lsr r21
    dec r25
    brne    loopp
  .DEF P = r21

  ldi r22,0x00
  ldi r23,0x00
  ldi r24,0x00
  ldi r25,0x00
  ldi r28,0x00
  .DEF T1 = r22
  .DEF T2 = r23
  .DEF T3 = r24
  .DEF T4 = r25
  .DEF T5 = r28

  ;POS expression
  ;Y = T'PQ + TRS

  mov T1,P
  mov T2,Q
  mov T3,R
  mov T4,S
  mov T5,T
  com T5
  and T1,T5
  and T2,T1
  com T5
  and T3,T5
  and T4,T3
  or T2,T4
  out PORTB,T2
  
  rjmp loop

start:
  rjmp start

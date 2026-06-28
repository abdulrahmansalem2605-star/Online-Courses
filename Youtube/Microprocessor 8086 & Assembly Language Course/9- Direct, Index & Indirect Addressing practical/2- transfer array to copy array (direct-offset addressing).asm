
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt


org 100h


; 2- Write a program in Assembly language that transfer the
; elements of a word array VAR = 1010H, 2020H, 3030H into
; array Copy using direct-offset addressing

  
; Remember Define Word takes two memory locations

MOV AX , VAR[0]
MOV COPY[0] , AX

MOV AX , VAR[2]
MOV COPY[2] , AX

MOV AX , VAR[4]
MOV COPY[4] , AX


ret


VAR DW 1010H, 2020H, 3030H
COPY DW 3 DUP(?)
 

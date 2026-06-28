
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt


org 100h


; 1- Write a program in Assembly language that transfer the
; elements of a byte array VAR = 10H, 11H, 12H, 13H into
; AL, AH, BL and BH registers respectively
; using direct-offset addressing.

MOV AL , VAR[0]
MOV AH , VAR[1]
MOV BL , VAR[2]
MOV BH , VAR[3]

; MOV AL , [VAR]
; MOV AH , [VAR+1]
; MOV BL , [VAR+2]
; MOV BH , [VAR+3] 


ret


VAR DB 10H, 11H, 12H, 13H
 

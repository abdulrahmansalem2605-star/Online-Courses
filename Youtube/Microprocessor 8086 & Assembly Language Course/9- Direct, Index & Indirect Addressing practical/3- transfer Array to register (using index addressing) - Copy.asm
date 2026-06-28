
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h 


; 3- Write a program in Assembly language that transfer the
; elements of a byte array VAR = 10H, 11H, 12H, 13H into
; AL, AH, BL and BH registers respectively
; using index addressing. 


MOV SI , 0 

MOV AL , VAR[SI]
INC SI

MOV AH , VAR[SI]
INC SI

MOV BL , VAR[SI]
INC SI

MOV BH , VAR[SI] 


ret


VAR DB 10H, 11H, 12H ,13H
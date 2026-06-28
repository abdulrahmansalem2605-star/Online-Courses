
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt


org 100h


; 5. Write a program in that calculates the factorial of 5 (5!).
; Save the result int factorial5 variable

MOV AL, 5
MOV AH, 4
MOV BL, 3
MOV BH, 2

MUL AH
MUL BL
MUL BH

MOV factorial5, AL


ret



factorial5 DB  ?




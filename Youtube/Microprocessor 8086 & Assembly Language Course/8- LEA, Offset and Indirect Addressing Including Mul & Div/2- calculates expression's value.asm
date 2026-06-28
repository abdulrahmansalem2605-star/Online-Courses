
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt


org 100h

; 4- Write a program that claculates the value
;    of the following expression:
; RESULT = (-VAR1+VAR2)*VAR3
; Where VAR1, VAR2 and VAR3 are a byte variables, which has 15H, 20H
; and 10H values respectively

NEG NEG_VAR1

MOV AL , NEG_VAR1
ADD AL , VAR2

MOV RESULT , AL
MUL VAR3

MOV RESULT , AL 


ret


VAR1 DB 15H 
VAR2 DB 20H
VAR3 DB 1 0H

NEG_VAR1 DB 15H

RESULT DB ?
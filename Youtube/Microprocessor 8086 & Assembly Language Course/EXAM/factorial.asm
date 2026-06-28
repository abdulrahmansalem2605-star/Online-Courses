
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

count:

mov ah , 01H
int 21H

SUB al , '0'
mov ah , 0
mov CX , AX


Continue:
CMP CX , 1
JLE STOP
MOV BX , CX
DEC BX
MUL BX
DEC CX
JMP Continue



STOP:
mov F, AX
ret

F dw ?

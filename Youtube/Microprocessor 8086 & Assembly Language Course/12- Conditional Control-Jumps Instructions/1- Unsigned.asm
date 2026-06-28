
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt


; Exmaples:


org 100h

MOV AX, 25
CMP AX, 0 ; Result = 25, ZF = 0, CF = 0

MOV AX, 10
CMP AX, 15 ; Result = -5, CF = 1

MOV AX, 5
CMP AX, 5 ; Result = 25, ZF = 1    

ret


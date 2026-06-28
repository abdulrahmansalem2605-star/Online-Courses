
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h 


; 6- Write a program in Assembly language that transfer the intial 
; value of variable VAR = 1020H copy variable (uisng indirect addressing)


mov SI , offset VAR  ; lea SI , VAR
mov DI , offset Copy

mov AX , [SI]
mov [DI] , AX


ret


VAR DW 1020H
COPY DW ?
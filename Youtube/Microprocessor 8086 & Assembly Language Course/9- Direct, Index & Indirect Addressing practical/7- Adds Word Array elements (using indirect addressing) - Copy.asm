
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h 


; 7- Write a program in Assembly language that adds the elements of
; a word array VAR = 1010H, 2020H, 3030H and save the result in
; variable SUM indirectly (uisng indirect addressing)


LEA SI , VAR
LEA DI , SUM

MOV AX , [SI]
; ADD BX , 2
INC SI
INC SI

ADD AX , [SI]
INC SI
INC SI

ADD AX , [SI]

MOV [DI] , AX


ret


VAR DW 1010H, 2020H, 3030H

SUM DW ? 
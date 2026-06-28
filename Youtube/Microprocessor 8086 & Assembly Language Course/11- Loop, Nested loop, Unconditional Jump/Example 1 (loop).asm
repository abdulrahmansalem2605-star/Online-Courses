
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt


; Exmaple 1: Wrtie a program in Assembly language that save the 16-single
; hexadecimal elements of array DATA = 00H, 01H, 02H, 03H, 04H, 05H,
; 06H, 07H, 08H, 09H, 0AH, 0BH, 0DH, 0EH, 0FH using loop
; Calaculate the sum ad the average of the DATA elements and save
; in variables named SUM and AVG respectively.

org 100h


lea SI, DATA
MOV CX, 16
MOV DI, 0H


clacArray:
    MOV [SI] , DI   
    ADD AL , [SI]
    INC SI
    INC DI

loop clacArray

MOV SUM  , AL
MOV DL , 16
DIV DL
MOV AVG , AX       

ret

DATA DB 16 dup(?)  
SUM DB ?
AVG DW ?
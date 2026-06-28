
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt


org 100h


; 1- Write a program that calculates the sum of the first 6 natural
; numbers and save the result in a variable named SUM.

MOV BL , 7 ; Don't store it like (6+1)
; The problem isn't with the compiler itself,
; but with its ability to interpret the expression 6+1.
; Some compilers don't support calculations directly within
; instructions, so it's always best to use the value.

MOV AL , 6
MUL BL

MOV BL , 2
DIV BL

MOV SUM , AL


ret

SUM DB ?

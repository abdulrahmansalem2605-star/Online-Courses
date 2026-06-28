
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt


org 100h

                                                                       
; 2- In a Computer shop, a Laptop that sells for an
; original price 6000 LE is marked a sale rate "20% off".
; Write a program that calculates the price of the laptop
; after sale and save it in a variable named SPRICE.

MOV AX, OriginalPrice
MOV BX , 20
MUL BX

MOV BX , 100
div BX

MOV sale, AX


MOV CX , OriginalPrice
SUB CX , sale
MOV SPRICE , CX



ret

OriginalPrice EQU 6000
 
sale dw ?

SPRICE DW ?

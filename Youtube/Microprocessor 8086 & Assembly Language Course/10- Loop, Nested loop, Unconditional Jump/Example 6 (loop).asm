
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt


; The Cx register is automatically used as a counter for the repetition and is decremeneted
; each time the loop repeats.


; Exmaple 6: Write a program in Assembly language that calculate and
; and save the sum of the elements of a word array
; DATA = 10H, 11H, 12H, 13H, 14H, 15H, 16H, 17H, 18H, 19H.



org 100h

MOV CX, 10
MOV SI, 0


SumArray:
     MOV AX, DATA[SI]
     ADD SUM, AX 
     INC SI


loop SumArray       

ret

DATA DW 10H, 11H, 12H, 13H, 14H, 15H, 16H, 17H, 18H, 19H
SUM DW ?
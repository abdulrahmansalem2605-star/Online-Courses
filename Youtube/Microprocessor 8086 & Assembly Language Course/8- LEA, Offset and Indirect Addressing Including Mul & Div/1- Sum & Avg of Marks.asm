
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt


org 100h

; 4- Write a program that:

; a. Save the marks (60, 80 and 90), for a student in 3-courses at
; the 1st term of academic year 2017-2018, in an array called Marks.                                                                       

;Done in line 

 
; b. Calculate the summation and the average of student marks and save
; them in variables named SUM and AVG respectively.

MOV SI , 0

MOV AL , Marks[SI]
INC SI

ADD AL , Marks[SI]
INC SI

ADD AL , Marks[SI]

MOV SUM, AX


MOV BL , 3
DIV BL

MOV AVG , AX


; c. Transfer the marks. SUM, AVG, offset address of SUM and AVG on
; AX, BX, CX, DX, BP, SI and DI registers respectively.

MOV AX , SUM
MOV BX , AVG

;================================================================== 

;`offset` means the fixed offset of a variable within its segment, 
; calculated during compilation.

;It is used to obtain a variable's memory address and is stored
; in a register for later use in indirect addressing.

;`offset` is not translated into an executable instruction; instead,
; it is replaced by the value during compilation.

;`LEA`, on the other hand, is a runtime instruction used
; to calculate addresses without accessing memory.

;==================================================================
 
; They are considered the same thing by convention. 
MOV CX , offset SUM ; Relative address (of the variable)
LEA DX , AVG ; Load Effective Address




ret


Marks db 60, 80 ,90
SUM dw ?
AVG dw ? 

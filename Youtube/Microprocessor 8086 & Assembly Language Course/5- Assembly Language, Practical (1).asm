
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt


org 100h


; 1.

; a. Initialize the AX and BX registers by 100H and 200H respectively.

; Intialize AX & BX
MOV AX , 100H
MOV BX , 200H


; b. Add 50H to the contents of AX register
; then increase the result by one.
; Subtract 50H from the contents of BX register
; then decrease the restult by one.;
; Finally, swap the data in the previous registers.

; Addition & Subtraction
ADD AX , 50H
INC AX

SUB BX , 50H
DEC BX

; Swap AX & BX
MOV CX , AX
MOV AX , BX
MOV BX , CX


; c. Save a data of 300H and 400H into the data segment memory
; locations addressed by 600H and its consecutive addresses
; respectively. Add the contents of the previous memory locations,
; and save the result into the CX register.
 
; Memory locations intialized & added
MOV [600H] , 300H
MOV [600H+2] , 400H ; Same as 602H or 600H + 2H

XOR CX , CX ; clear the CX 
ADD CX , [600H]
ADD CX , [602H]
; OR
MOV CX , [600H]
ADD CX , [602H]



; d. Run the program and show the affected register, flags
; and memory locations.  



ret





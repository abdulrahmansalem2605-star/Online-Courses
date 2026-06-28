
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt


org 100h


; 2.

; a. Initialize the AX register by FF00H,
; set the rightmost 8 bits of AX, clear bits 8 and 9 of AX
; and Invert the lastmost 76 bits of AX with the result stored in Bx
; register.

MOV AX , 0FF00H ; should end it with (zero)

or AL , 11111111b ; AX = FFFF(H) after the or operation
; put 1 to activate the digits (because it's ADD operation)

and AH , 11111100b ; AX = FE7F(H) after the and operation
; put 0 to clear the digits (because it's MUL operation)

xor AH , 11111100b ; AX = 027F(H) after the xor operation
; put 1 to invert the digits
; (becuase XOR change the result When symmetry)


; b. Initialize the low order byte of the CX register by EFh as well
; as save its one's complement at the high order byte of the CX register.

MOV CL , 0EFH ; should end it with (zero) same as line 16

MOV CH , CL
NOT CH

 
; c. Initialize the low order byte of the DX register by EFh as well
; as save its two's complement at the high order byte of the DX register.

MOV DL , 0EFH ; should end it with (zero) same as line 16

MOV DH , DL
NEG DH


ret





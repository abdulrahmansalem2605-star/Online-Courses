
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt


; The Cx register is automatically used as a counter for the repetition and is decremeneted
; each time the loop repeats.


; Exmaple 2: How many times will the loop executes in the following Assembly program?

org 100h


MOV AX, 0
MOV CX, 0 ; The Loop counter 

L1:     ;start loop
INC AX
Loop L1 ;define loop

ret

; The loop will executed (65535)
; CX - 1 = 0 - 1 = -1 = 65535 in unsigned
; +1 = 0000 0000 0000 0001
; -1 in 2's complement:
; -1 = 1111 1111 1111 1111

; AX = 0000H
; CX = 0000H

; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt


; The Cx register is automatically used as a counter for the repetition and is decremeneted
; each time the loop repeats.


; Exmaple 2: what is the final values of AL and BL registers in the following Assembly program ?


; The execution of the loop instruction involves two steps:
; 1.Subtract 1 from CX.
; 2.Compare CX to zero.


org 100h


MOV AL, 4H
MOV BL, 8H
MOV CX, 3 ; The Loop counter

L1:     ;start loop
Add Al, 2H
INC BL
Loop L1 ;define loop

ret

; AX = 000AH
; BX = 000BH
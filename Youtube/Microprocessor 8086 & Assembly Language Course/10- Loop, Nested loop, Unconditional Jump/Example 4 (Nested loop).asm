
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt


; if it is required to coed a Loop within another Loop:
; . Each loop must have a counter CX.
; . The outer Loop counter CX must be saved.



; Exmaple 4: what is the final values of AL and BL registers
; in the following Assembly program ?

org 100h


MOV AX, 0
MOV BX, 0 ; The Loop counter 

MOV CX, COUNT ;set outer loop count

L1:           ;start loop
INC BL        ;BL += 1
MOV COUNT, CX ;save outer loop count
    
    MOV CX,2  ;set inner loop count
    L2:           ;start loop
    INC AL        ;AL += 1
    Loop L2 ;define the inner loop
            ;(must be inside first loop for looping)
    
; CX will be zero after inner loop
MOV CX, COUNT ;restore outer loop count value

Loop L1 ;define the outer loop
    

ret
COUNT DW 5


; AL = 0AH
; BL = 05H
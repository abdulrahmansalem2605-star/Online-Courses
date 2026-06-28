
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt


; Exmaple 1: find the final values of AX and BX registers in the
; following Assembly program?

org 100h


MOV AX, 5
MOV BX, 2

JMP S1 ; go to S1
Back: INC AX ;label name Back (go to JMP Back)

JMP S2
S1: SUB AX, BX ;label name S1 (go to S1)  

JMP BACK
S2: DEC BX ;label name S2 (go to S2) 

ret

; AX = 0004H
; BX = 0001H
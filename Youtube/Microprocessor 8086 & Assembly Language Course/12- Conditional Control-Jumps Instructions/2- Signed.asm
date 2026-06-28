
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt


; Exmaples:


org 100h

MOV AX, 40
CMP AX, 30 ; Result = 10, SF = 0, OF = 0, ZF = 0


MOV AX, 10
CMP AX, 15 ; Result = -5, SF = 1, OF = 0, ZF = 0

MOV AX, 5
CMP AX, 5 ; Result = -5, SF = 0, OF = 0, ZF = 1     

ret


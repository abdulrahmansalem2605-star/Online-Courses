
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt


; Exmaples:


org 100h

MOV AL , 12
CMP AL , 10 ;result=2, CF=0, ZF=0

MOV AL , 0
CMP AL , 2 ;result=-2, CF=1    

ret


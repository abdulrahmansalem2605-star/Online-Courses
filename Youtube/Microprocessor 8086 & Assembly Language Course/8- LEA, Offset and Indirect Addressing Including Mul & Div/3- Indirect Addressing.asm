
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h 


;====================
; mov si , 0
; mov al , marks[si]
; mov copy[si] , al
;====================


LEA SI , marks ; Load Effective Address of marks to Sorce Index
LEA DI , copy ; Destination Index (DI)

MOV al   , [SI] ; like a pointer [SI] == Marks 
MOV [di] , al

INC SI
INC DI
 
 
MOV al   , [SI] ; like a pointer [SI] == Marks 
MOV [di] , al

INC SI
INC DI


MOV al   , [SI] ; like a pointer [SI] == Marks 
MOV [di] , al


; We can use third register for index -> Base Address (BX)


ret


marks db 10, 20, 30
copy db 3 dup(?)
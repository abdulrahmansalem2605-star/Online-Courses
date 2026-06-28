
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt


; if it is required to coed a Loop within another Loop:
; . Each loop must have a counter CX.
; . The outer Loop counter CX must be saved.



; Exmaple 2: Write a program in Assembly language that copies array
; of string named SOURCE, which has the following 41-characters
; 'Assembly language is a low level language', into another array
; named Target.

org 100h


lea SI, Source
lea DI, Target
mov CX, 41

COPY:
    mov AL, [SI]
    mov [DI] , AL
    inc SI
    inc di
loop COPY    
    

ret

Source DB 'Assembly language is a low level language'
Target db 41 dup(?)
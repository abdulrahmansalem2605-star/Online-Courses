
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h 


; 4- Write a program in Assembly language that adds the
; elements of a byte array VAR = 10H, 11H, 12H, 13H and save the
; result in variable SUM uisng index addressing>


MOV SI  , 0

MOV AL  , VAR[SI]
INC SI  
        
ADD AL  , VAR[SI]
INC SI  
        
ADD AL  , VAR[SI]
INC SI    
        
ADD AL  , VAR[SI]

; Rememeber register isn't a memory address, so you can't write [AL]
MOV SUM , AL


ret


VAR DB 10H, 20H, 30H
SUM DB ?
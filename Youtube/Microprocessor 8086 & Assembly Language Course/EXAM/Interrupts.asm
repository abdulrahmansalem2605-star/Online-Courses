
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; read a character value
;mov ah, 01h
;int 21H

; print a character
;mov dl, 'l' ; must be dl register
;mov ah, 02h
;int 21H

; read and print a character 
;mov ah, 01H
;int 21H
;mov dl,al ; al store the input value
;mov ah,02H
;int 21H

; print String
;lea dx , msg
;mov ah , 09H
;int 21H
;msg db "Hello$" , 0

; read String
msg db 11,10 dup(0), '$' ; 11 max size
lea dx, msg
mov ah , 0AH
int 21H

ret





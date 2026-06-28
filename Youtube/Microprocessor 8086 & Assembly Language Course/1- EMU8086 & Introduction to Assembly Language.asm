
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h ;start from address 100h (first adress)     

mov al , 0FFH ;you need to start hexadecimal numbers with 0
              ; (max size of al is 8 bit)  
mov [300H] , 33H ;[] reference to memory location

; emulate screen:
; DS: Data Segment (always it's value 0700H)
; 0700:300H -> 0700*10H + 0300H = 7000H + 0300H = 7300H
; green color: Hexadecimal , gray: decimal, black: ascii code
; after single step you can re-check the adrees agian
; in this program we re-check 300H address and see it change to 33H               

ret ;return to operating system
     




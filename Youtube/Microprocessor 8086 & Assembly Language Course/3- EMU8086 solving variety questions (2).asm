
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
 
; 1.
; a. Copy hte string data 'NO' int AX register.
; Initialize the source index regiser (SI) with the initial value
; 0200H and the base pointer register (BP) with initial value 0100H
; then copy the contents of AX register int the stack segment
; memory locations addressed by SI+BP+20H.
mov AX , 'NO' ; String writes with single quote
mov SI , 200H
mov BP , 100H
mov SS:[SI+BP+20H] , AX 

; b. Initialize the destination index register (DI) with inital
; value 0300H then copy the string data 'HELLO' into the extra data
; segment memory locations addressed by D1+100H.
mov DI , 300H
mov ES:[DI+100H] , 'HE' ; Where ES stands of extra data segment
mov ES:[DI+102H] , 'LL' ; Can't write full string in single  
mov ES:[DI+104H] , 'O'  ; memory location so we sort two chars
; As we Now the stack sort form the last so the String (HELLO)
; will sort (EHLLO), if you want to sort in order, do the next 
mov ES:[DI+100H] , 'EH' ; and the next two lines will be the same
mov ES:[DI+102H] , 'LL'
mov ES:[DI+104H] , 'O'

 
; To select a complete line, use the shortcut Shift + End


; 2.
; a. Initialize the AL and SL registers with 33H and 0300H respectively.
mov AL , 33H
mov SI , 0300H

; b. Copy the data segment memory location addressed by SI wtih 55H.
; Then, swap between AL and the data at the data segment memory
mov [SI] , 55H 
mov BL , [SI]  ; We Can't swap directly between SI and AL
mov [SI] , AL  ; cuz AL size 8 bit , and SI 16 bit
mov AL , BL
 
 
; 3.
; a. Initialize the AL and DL registers with the immediate value
; 38H and 0E0H respectively. 
mov AL , 38H
mov DL , 0E0H

; b. Set the rightmost 5-bits of DL withot changing the remaining
; of DL.
; Set meaning (set bit to 1)
; Get meaning read the bit and check by AND Operator  
; (for Set use OR , for Get use And) [remember bitwise]
or dl , 00011111b ; b reference to binary

; c. Set the leftmost 3-bit of AI, clears bits 2,3 and 4 of AL and
; Inverts the rightmost 2-bits of AL.
or AL , 11100000b
and AL , 11100011b ; remember and is multiply in boolean math
; to clear bits (set it zero)  
xor AL , 00000011b ; remember and is xor Inverts numbers 
                   ;(use 1 value's digit)
                   ; 0 1 -> 1
                   ; 1 1 -> 0 
                   ; 1 0 -> 1
                   ; 0 0 -> 0         
; So in first two statues the value will Inverts
                                             

; 4.
; a. Initialize the AX, BX and DI registers with the Immediate
; values 1020H, 3040H and 0200H respectively.
MOV AX , 1020H
MOV BX , 3040H
MOV DI , 0200H

; b. One's complement the low byte of AX register.
; One's complement used for unsigned 
NOT AL 
 
; c. Two's complement the high byte of BX register.
; Two's complement used for signed
; Add one cuz if number equal 48 it will become -49
; and add one will make it -48
; signed char range form -128 -> 127
NEG BH ; NEG -> NOT + 1 | X = 0 - X (third way to achieve two's complement

; d. Save the high byte of AX and the low byte of BX
; at the data segement memory locations addressed by DI respectively
MOV [DI] , AH
MOV [DI+1] , BL ; To avoid resetting the value

ret






; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h 


; 8- Write a program in Assembly language that excahnge the values of
; VAR1 = 2000H and VAR2 = 300H using exchange instruction

;==================================================================

; Exchange values of two operands.
  
; Algorithm:
  
; operand1 < - > operand2
  
; Example:
; MOV AL, 5
; MOV AH, 2
; XCHG AL, AH   ; AL = 2, AH = 5
; XCHG AL, AH   ; AL = 5, AH = 2
; RET

;==================================================================

; can't move directly from Memory address to another Memory address
MOV AX , VAR1
XCHG AX , VAR2
MOV VAR1 , AX

ret


VAR1 DW 2000H

VAR2 DW 3000H 
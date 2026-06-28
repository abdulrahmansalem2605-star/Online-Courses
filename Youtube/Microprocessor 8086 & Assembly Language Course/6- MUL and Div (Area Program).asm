
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt


org 100h


; 4. Write a program that calculates a rectangle area,
; which has 7H and 3H dimension.
; Also calculates the half of rectangle area.
; Save the results into area and half_area variables.

MOV AL , 7H
MOV BL , 3H

; MUL operator by default take AL and multiply it with other register
; When multiplying using powder, use the full AX,
; or when multiplying using the byte used.

;==================================================================
; Unsigned multiply.

; Algorithm:
; 
; when operand is a byte:
; AX = AL * operand.
; when operand is a word:
; (DX AX) = AX * operand.

; Example:
; MOV AL, 200   ; AL = 0C8h
; MOV BL, 4
; MUL BL        ; AX = 0320h (800)
; RET
;==================================================================

MUL BL
MOV area , AL


; DIV operator by default take AX and diving it with other register
; When division, the quotient will be stored in AL
; and the remainder in DX.

;==================================================================
; Unsigned divide.
; 
; Algorithm:
; 
; when operand is a byte:
; AL = AX / operand
; AH = remainder (modulus)
; when operand is a word:
; AX = (DX AX) / operand
; DX = remainder (modulus)
; Example:
; MOV AX, 203   ; AX = 00CBh
; MOV BL, 4
; DIV BL        ; AL = 50 (32h), AH = 3
; RET
;==================================================================

MOV BL , 2
DIV BL
MOV half_area , AX


ret

; The assembler needs to know where to put the data in memory,
; what type of data it is, and what its value is.

area DB  ?
half_area DW  ? ; The DIV result should always store at DW 



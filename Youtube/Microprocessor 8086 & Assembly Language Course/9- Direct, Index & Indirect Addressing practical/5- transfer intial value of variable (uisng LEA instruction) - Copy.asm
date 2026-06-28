
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h 


; 5- Write a program in Assembly language that transfer intial value
; of variable VAR = 1020H to AX register (uisng LEA instruction)


; LEA (Load Effective Address) can load the computed address of
; a variable or memory expression
; into any 16-bit general-purpose register
; (AX, BX, CX, DX, SI, DI, BP, SP).
 
; However, registers like SI, DI, and BX are commonly used
; as addressing registers
; because they are implicitly supported in memory access
; instructions (e.g., MOV AL, [SI]).
 
; Therefore, using LEA with SI, DI, or BX is typical
; when the loaded address will be used
; for subsequent indirect memory access.

; mov bx , offset VAR 
LEA BX , VAR    ; Same as pointer
mov AX , [BX]   ; MOV the pointer value to AX


ret


VAR DW 1020H
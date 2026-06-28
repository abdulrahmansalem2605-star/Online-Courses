
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

;------------------------------------------------------------------

; ORG (orgin) directive
org 100h ; start from the offset address from 100H address

;------------------------------------------------------------------

; DB (Define Byte) directive | used 8-bit (1-bytes) memory locations 

VAR1 DB 00111111b
VAR2 DB 3FH
VAR3 DB 255 ; decimal

; for Octal (337q or 337o)
; q stands for "octal" from the Latin word "quattuor" (four),
; indicating that each octal number is represented
; by 3 bits (2³ = 8), which is an informal but common interpretation.

VAR4  DB 'A'
VAR5 DB 'Hello'

;------------------------------------------------------------------

;Define an Array (multiple data) on the statement line or more lines
; VAR6 DB 00111111b, 3FH, 255, 'A'
;      DB 0FFH, 0AAH, 00H, 11111111b

;------------------------------------------------------------------
     
; Not intialize Data ?
VAR7 DB ?
     
;------------------------------------------------------------------

; DW (Define Word) directive | used 16-bit (2-bytes) memory locations 

VAR8 DW 0011111111001110b
VAR9 DW 3FA0H
VAR10 DW 256
VAR11 DW 'Ab'
VAR12 DW ?

;------------------------------------------------------------------

;Define an Array (multiple data) on the statement line or more lines
; VAR13 0011111111001110b, 3FA0H, 256, 'Ab'

;------------------------------------------------------------------

; The numeric (binary & decimal) data is converted to hex and palced
; in memeory locations according to the little endian format
; (low byte to low address and high byte to high address)

; The ASCII data is converted to hex and palced
; in memeory locations according to the big endian format
; (low byte to high address and high byte to low address) 

; Endianness It is the method of arranging bytes
; within a word (such as 16-bit or 32-bit) when stored in memory.

;------------------------------------------------------------------

; DD (Define doubleword) & DQ (Define quadword) directives
; DD need 4-byte memory locations
; DQ need 8-byte memory locations

;------------------------------------------------------------------

; DUP (duplicate) directive 

; Variable name DB number of duplication DUP (data)
; Variable name DW number of duplication DUP (data)

; It is included within the DB, DW, DD or DQ statements

; It is used to assign memory locations for a given data
; (byte size, word size, ....)
; according to the disred repetition times.

; It is used to avoid a lot of typing as well as generate array.
VAR14 DB 8FH, 8FH, 8FH, 8FH, 8FH, 8FH
VAR15 DB 6 DUP(8FH)
VAR16 DB 6 DUP(?)

;-----------------------------------------------------------------

; EQU (equate) directive 
; EQU statement: name EQU data

; it assigns a label (name) to the constant data without assigning
; memory loactions to it, so that when the label appears in the
; program, its constant value will substitute it.

; It is usually used for the counter in the code segment.
COUNT EQU 25
MOV CX, COUNT ; mov 25 to CX

;-----------------------------------------------------------------

; Label (name)

; By choosing a meaning label anmes, the program can be much easier
; to read and maintain


; The names used for labels in Assembly language must be: 

; Unique.

; Up to 31 characters long.

; Consists of alphabetic letters (upper or lower case), digits 0-9,
; special characters (Question mark ?, period ., at @,
; uder line _, and dollat sign $) 
; such that the first character must be an alphabetic letter.

; Not a reserved words of the Assembly language.

; Uppercase and lowercase labels are the same.

;-----------------------------------------------------------------

 

ret





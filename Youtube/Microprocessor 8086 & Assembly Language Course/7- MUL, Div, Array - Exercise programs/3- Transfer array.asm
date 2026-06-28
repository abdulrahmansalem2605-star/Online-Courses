
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt


org 100h

                                                                       
; 3- Write a program that transfers the elements of the byte array
; DATA= 25h, 4fh, 85h, 1fh, 2Bh, 0C4h into the byte array COPY
; using index addressing method
 
 
;==================================================================
; can't copy form variable to variable directly
; becuase the variables are static not dynamic
; (from memory to memory)
; so we use a helper register
; but we can with constant varibale (EQU)

;So, is the slowness a cause?
; Yes, but not a consequence of the underlying cause.

;The underlying cause is that the MOV instruction doesn't support
; memory ? memory in its structure, and the slowness is one of
; the elements that the designers deliberately omitted.
;------------------------------------------------------------------
; - SI = Source Index
; - This is a 16-bit register often used as a pointer to
; the source in memory transfers.
; - It is used with indirect addressing,
; especially with instructions such as MOVSB, LODSB, and SCASB.
;==================================================================


MOV SI , 0
MOV AL , Data[SI]
MOV Copy[SI] , AL

INC SI
MOV AL , Data[SI]
MOV Copy[SI] , AL  
  
INC SI
MOV AL , Data[SI]
MOV Copy[SI] , AL

INC SI
MOV AL , Data[SI]
MOV Copy[SI] , AL
 
INC SI 
MOV AL , Data[SI]
MOV Copy[SI] , AL

INC SI
MOV AL , Data[SI]
MOV Copy[SI] , AL

INC SI
MOV AL , Data[SI]
MOV Copy[SI] , AL


ret


Data db 25h, 4fh, 85h, 1fh, 2Bh, 0C4h
Copy db 6 dup(?) 

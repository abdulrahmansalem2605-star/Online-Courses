
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt


; The Cx register is automatically used as a counter for the repetition and is decremeneted
; each time the loop repeats.


; Exmaple 5: Write a program in Assembly language that transfer
; the elements of the byte array DATA = 10H, 11H, 12H, 13H, 14H, 15H
; into array COPY.

; True: Loads the actual address of DATA into SI
; (SI becomes a pointer to DATA)
; Note: You can also use MOV SI, OFFSET DATA for the same purpose
; False: Do not use MOV SI, [DATA] here,
; as it loads the first value in DATA (10H), not its address
; False: MOV SI, DATA may not behave as expected in some assemblers,
; as it might be interpreted as MOV SI, [DATA]
; Therefore, it's always better to use LEA or OFFSET
; when you need the address


org 100h

MOV CX, 6
MOV SI, 0


CopyTo:
     MOV AL, DATA[SI]
     MOV COPY[SI], AL
     INC SI


loop CopyTo       

ret

DATA DB 10H, 11H, 12H, 13H, 14H, 15H
COPY DB 6 dup(?)
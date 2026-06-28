
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt


; The Cx register is automatically used as a counter for the repetition and is decremeneted
; each time the loop repeats.


; 2. Write a program in Assembly language that fill two arrays with
; the first one hundred unsigned decimal numbers, The first array
; named EDATA, has the first 50-unsigned even decimal numbers(0,2,..,98).
; The second array named ODATA, has the first 50-unsigned odd decimal
; numbers(1,3,...,99).
; Claculate the sum and the average for each array elements and save
; them in variables named SUME, SUMO, AVGEQ, AVGER, AVGOQ and AVGOR.
; Finally exchange the EDATA and ODATA array elements.
 

AVG_Arrays PROC
    
    MOV AX , SumE
    MOV BX , 50
    DIV BX
    MOV AvgEQ , AX
    MOV AvgER , DX
    
    MOV AX , SumO
    MOV BX , 50
    DIV BX
    MOV AvgOQ , AX
    MOV AvgOR , DX
    
RET
AVG_Arrays ENDP


Exchange_Arrays PROC

MOV CX , 50
MOV SI , 0    
    L2:
        MOV AX , EData[SI]
        XCHG AX , OData[SI]
        MOV  EData[SI] , AX
        INC SI
    loop L2           
    
RET
Exchange_Arrays ENDP



 
org 100h

        
    lea SI, EData
    lea DI, OData
    mov CX, 50
    mov bl, 00H
    mov bh, 01H
    mov AX, 0000H
    mov DX, 0000H 
   
L1:

    mov [si], bl
    mov [di], bh
    
    add bl, 2
    add bh, 2
    
    add ax, [si]
    add dx, [di]
    
    add si, 2
    add di, 2
    
loop L1

MOV SumE , AX
MOV SumO , DX
    ;CALL AVG_Arrays
    ;CALL Exchange_Arrays

ret


EData DW 50 dup(?)
OData DW 50 dup(?)

SumE DW 0
SumO DW 0
AvgEQ DW 0
AvgER DW 0
AvgOQ DW 0
AvgOR DW 0

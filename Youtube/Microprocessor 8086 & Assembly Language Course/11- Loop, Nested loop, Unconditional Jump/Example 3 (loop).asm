
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt


; The Cx register is automatically used as a counter for the repetition and is decremeneted
; each time the loop repeats.


; 2. Write a progream in Assembly language that fill two arrays with
; the first one hundred unsigned decimal numbers, The first array
; named EDATA, has the first 50-unsigned even decimal numbers(0,2,..,98).
; The second array named ODATA, has the first 50-unsigned odd decimal
; numbers(1,3,...,99).
; Claculate the sum and the average for each array elements and save
; them in variables named SUME, SUMO, AVGEQ, AVGER, AVGOQ and AVGOR.
; Finally exchange the EDATA and ODATA array elements.


Fill_SUM_Arrays PROC
    
    lea SI, EvenData
    lea DI, OddData
    mov CX, 100
    mov AX, 0 ; Array counter
    
    L1:
        MOV BL, AL
        AND BL, 1
        
        JZ FillEven
        JMP FillOdd
        
    
        FillOdd:
            MOV AH, 0
            MOV [DI], AL              
            JMP SumOddElement
            
        SumOddElement: 
            ADD SumOdd, AX
            INC DI    
            JMP IncrementArrayCounter
            
        FillEven:
            MOV AH, 0
            MOV [SI], AL              
            JMP SumEvenElement
            
        SumEvenElement:
            MOV AH, 0  
            ADD SumEven, AX
            INC SI    
            JMP IncrementArrayCounter
             
        IncrementArrayCounter:    
            INC AL
                     
    loop L1
RET
Fill_SUM_Arrays ENDP
 

AVG_Arrays PROC
    
    MOV AX , SumEven
    MOV BX , 50
    DIV BX
    MOV AvgEvenQuotient , AX
    MOV AvgEvenReminder , DX
    
    MOV AX , SumOdd
    MOV BX , 50
    DIV BX
    MOV AvgOddQuotient , AX
    MOV AvgOddReminder , DX
    
RET
AVG_Arrays ENDP


Exchange_Arrays PROC

MOV CX , 50
MOV SI , 0    
    L2:
        MOV AL , EvenData[SI]
        XCHG AL , OddData[SI]
        MOV  EvenData[SI] , AL
        INC SI
    loop L2           
    
RET
Exchange_Arrays ENDP



 
org 100h

        
    CALL Fill_SUM_Arrays
    CALL AVG_Arrays
    CALL Exchange_Arrays

ret


EvenData DB 50 dup(?)
OddData DB 50 dup(?)

SumEven DW 0
SumOdd DW 0
AvgEvenQuotient DW 0
AvgEvenReminder DW 0
AvgOddQuotient DW 0
AvgOddReminder DW 0

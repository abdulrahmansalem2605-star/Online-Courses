
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h


;; a. Initialize AX and SI registers with the immediate value 1520H
;; and 0300H respectively.
;mov AX , 1520H
;mov SI , 0300H
;
;; b. Save the immdiate value 3040H at the data segment memory location
;; addressed by SI.
;mov [SI] , 3040H ; Will sort as stack on top 40 and next 30
;
;; c. Add the word contents at the data segment memory location
;; addressed by SI and AX with the sum stored at the AX register.
;add AX , [SI] ; Will sort in AX after add
;
;
;
;; a. Initialize AX and DX registers with the immediate values 1234H
;; and 5678H respectively
;mov AX , 1234H
;mov DX , 5678H
;
;; b. Subtract the word content of AX register from the word content
;; of DX register with the differnece sorted in the DX register
;sub DX , AX ;Focus on the fact that storage is always for the first value. 


; a. Intialaize AL, BL, Cl and DL registers with the immediate data
; 10H, 20H, 30H and 40H respectively
mov AL , 10H
mov BL , 20H
mov CL , 30H
mov DL , 40H

; b. Copy the contents of AL, BL, CL and DL registers int BH, CH, DH
; and AH registers respectively
mov BH , AL ; Work like functions Implement form right to left
mov CH , BL ; diagonal value changing pattern
mov DH , CL
mov AH , DL

; c. SWAP betwwen the contents of AX and BX registers
mov CX , AX ; We can use DX too (we nood word register
mov AX , BX ; It's like SWAP in high level language using temp register
mov BX , CX ; we can use exchange too to implement SWAP registers

; d. Copy the content of AX register into the data segment memory
; location addressed by 0200H then Copy the contents of BX and CX
; registers at the consecutive offset address
mov [0200H] , AX ; Will take 2 memory locations (each equal 1 byte)
mov [0202H] , BX ; Will start after the 2 Byte (200 and 201)
mov [0204H] , CX ; here the same of the previuos statements

; e. Copy the content of DX register into the stack segment memory
; location addressed by 0100H then copy the immediate data 4433H
; and 2211H at the consecutive offset addresses
mov SS:[100H] , DX
; Write (:) to forward location, Because the default is DS  
mov SS:[102H] , 4433H ; Same as sorting DS (mentioned in previuos Q)
mov SS:[104H] , 2211H


ret





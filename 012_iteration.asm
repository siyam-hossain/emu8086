.MODEL SMALL
.STACK 100H
.DATA
    NUM DW 1234h  ; Sample data 0001 0010 0011 0100
    COUNT DB 0     
.CODE
MAIN PROC
    mov ax, @data
    mov ds, ax
    MOV CX, 16     ; 16 bits in word
    MOV AX, NUM  
    
    
LOOP_START:
    RCL AX, 1      
    JNC NO_INC     
    INC COUNT



NO_INC:
    LOOP LOOP_START
    MOV AH, 4CH
    INT 21H



MAIN ENDP
END MAIN

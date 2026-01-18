; Problem 6: Grade Classification 
; Question: Write a program that inputs a character grade (A,B,C,D,F) and displays the corresponding 
; message: "EXCELLENT" for A, "GOOD" for B, "AVERAGE" for C, "POOR" for D, and "FAIL" for F. 


.model small
.stack 100h
.data
    
    in_msg db 'Enter your grade: $'
    exe db 13,10, 'EXCELLENT$'
    gd db 13,10, 'GOOD$'
    avg db 13,10, 'AVERAGE$'
    pr db 13,10, 'POOR$'
    fl db 13,10, 'FAIL$'

.code
main proc
    mov ax, @data
    mov ds, ax
    
    ;---------prmt msg-------------
    mov ah, 09h
    lea dx, in_msg
    int 21h
    
    ;---------input---------
    mov ah, 01h
    int 21h
    
    ;---------grade checking---------
    cmp al, 'A'
    je exe_msg
    
    cmp al, 'B'
    je gd_msg
    
    cmp al, 'C'
    je avg_msg
    
    cmp al, 'D'
    je pr_msg
    
    cmp al, 'F'
    je fl_msg
    
    
    jmp stop
    
   
    ;-------------output msg---------
    exe_msg:
        mov ah, 09h
        lea dx, exe
        int 21h
        
        jmp stop
        
    gd_msg:
        mov ah, 09h
        lea dx, gd
        int 21h
        
        jmp stop
    
    avg_msg:
        mov ah, 09h
        lea dx, avg
        int 21h
        
        jmp stop
        
    pr_msg:
        mov ah, 09h
        lea dx, pr
        int 21h
        
        jmp stop
        
    fl_msg:
        mov ah, 09h
        lea dx, fl
        int 21h
        
    
    stop:
        mov ax, 4c00h
        int 21h
        
        
    main endp
end main
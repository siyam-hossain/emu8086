; Problem 6: Double and Compare 
; Question: Input a digit. Multiply it by 2 (using ADD or SHL). 
; If result is less than 10, display "FITS!", otherwise "TOO BIG!".

.model small
.stack 100h
.data

    in_msg db 'Enter a digit: $'
    
    fit_msg db 13,10,'Fits$'
    big_msg db 13,10,'Too Big$'
    
.code
main proc
    mov ax, @data
    mov ds, ax
    
    ;---------prmpt msg----------
    mov ah, 09h
    lea dx, in_msg
    int 21h
    
    ;-------------input----------
    mov ah, 01h
    int 21h
    
    ;convert
    sub al, 30h
    

    ;-----------checking---------------
    shl al, 1
    cmp al, 10
    
    jl fit
    jmp big
    
    ;----------output section----------
    fit:
        mov ah, 09h
        lea dx, fit_msg
        int 21h
        
        jmp stop
    
    
    big:
        mov ah, 09h
        lea dx, big_msg
        int 21h

    stop:
        mov ax, 4c00h
        int 21h
    
    main endp
end main
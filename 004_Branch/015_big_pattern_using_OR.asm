; Problem 5: Bit Pattern Check using OR 
; Question: Input a digit. OR it with 5. If result is greater than 7, display "HIGH BITS!", 
; otherwise "LOW BITS!".

.model small
.stack 100h
.data

    in_msg db 'Enter a digit: $'
    
    h_msg db 13,10,'High Bits$'
    l_msg db 13,10,'Low Bits$'
    
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
    ; 0000 1001
    ; 0000 0101   (or)
    ;------------------
    ; 0000 1101 -->(13: D) > 7
    ; 
    
    
    ; 0000 0011
    ; 0000 0101
    ;-------------------
    ; 0000 0111 ---> (7) !> 7
    
    or al, 5h
    
    cmp al, 7h
    
    jg high_bits
    
    jmp low_bits
    
    
    ;----------output section----------
    high_bits:
        mov ah, 09h
        lea dx, h_msg
        int 21h
        
        jmp stop
    
    
    low_bits:
        mov ah, 09h
        lea dx, l_msg
        int 21h

    stop:
        mov ax, 4c00h
        int 21h
    
    main endp
end main
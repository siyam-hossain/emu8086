; Problem 5: Password Check 
; Question: Write a program that prompts for a password. If the user enters 'X', display "ACCESS 
; GRANTED". Otherwise, display "ACCESS DENIED". 




.model small
.stack 100h
.data
    
    in_msg db 'Enter your password: $'
    access db 13,10,'ACCESS$'
    denied db 13,10,'DENIED$'


.code
main proc
    mov ax, @data
    mov ds, ax
    
    
    ;--------prpt msg----------
    mov ah, 09h
    lea dx, in_msg
    int 21h
    
    ;-------input-----
    mov ah, 01h
    int 21h
    
    ;-------password checking-------
    cmp al, 'X'
    je grant
    
    
    
    failed:
        mov ah, 09h
        lea dx, denied
        int 21h
        
        jmp stop 
    
    
    grant:
        mov ah, 09h
        lea dx, access
        int 21h
    
    stop:
        mov ax, 4c00h
        int 21h
        
    main endp
end main
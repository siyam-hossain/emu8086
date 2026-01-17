;   Problem 1: Simple Character Comparison 
;   Question: Write an assembly program that prompts the user to enter a character. If the character is 'A', 
;   display "CORRECT!". Otherwise, display "WRONG!".


.model small
.stack 100h
.data
    
    in_msg db 'Enter a character: $'
    correct db 13,10,'Correct$'
    wrong db 13,10, 'Wrong$'
    

.code
main proc
    mov ax, @data
    mov ds, ax
    
    ;--------showing prmt message-----------
    mov ah, 09h
    lea dx, in_msg
    int 21h     
    
    ;--------------input----------------
    mov ah, 01h
    int 21h
    
    
    ;----------check a or not-------------
    cmp al, 'a'
    je c_msg   
    
    
    ;--------if not----------
    mov ah, 09h
    lea dx, wrong
    int 21h
    
    ;---------then jump to terminate-------
    jmp stop
    
    
    c_msg:
        mov ah, 09h
        lea dx, correct
        int 21h
    
    
    
    
    
    stop:
        mov ax, 4c00h
        int 21h
        
    main endp
end main
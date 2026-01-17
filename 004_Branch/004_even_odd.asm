;    Problem 4: Even or Odd Number 
;    Question: Write a program that inputs a single digit and determines if it's even or odd using branch 
;    instructions.


.model small
.stack 100h
.data
    
    in_msg db 'Enter a digit: $'
    even db 13,10,'Even$'
    odd db 13,10,'Odd$'
    

.code
main proc
    mov ax, @data
    mov ds, ax
    
    ;--------prmt msg----------
    mov ah, 09h
    lea dx, in_msg
    int 21h
    
    
    ;------input---------
    mov ah, 01h
    int 21h
    
    ; convert it into digit
    sub al, 30h
    
    
    ;------even------
    mov ah, 0
    mov bl, 2
    
    div bl
    
    cmp ah, 0
    
    je say_even
    
    
    say_odd:
        mov ah, 09
        lea dx, odd
        int 21h
        
        jmp stop
    
    
    say_even:
        mov ah, 09h
        lea dx, even
        int 21h
    
    stop:
        mov ax, 4c00h
        int 21h
        
    main endp
end main
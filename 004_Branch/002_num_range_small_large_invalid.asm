; Problem 2: Number Range Check 
; Question: Write a program that inputs a digit (0-9) and displays "SMALL" if it's 0-4, "LARGE" if it's 5-9, or 
; "INVALID" if it's not a digit. 

.model small
.stack 100h
.data
    
    in_msg db 'Enter a digit: $'
    small db 13,10,'SMALL$'
    large db 13,10,'LARGE$'
    invalid db 13,10,'INVALID$'


.code
main proc
    mov ax, @data
    mov ds, ax
    
    ;---------prmt msg----------
    mov ah, 09h
    lea dx, in_msg
    int 21h
    
    ;-------input---------
    mov ah, 01h
    int 21h
    
    ;-------invalid--------
    cmp al, '0'
    jb  say_invalid
    
    cmp al, '9'
    ja  say_invalid
    
    
    ;---------small--------
    cmp al, '4'
    jle say_small
    
    
    say_large:
        mov ah, 09h
        lea dx, large
        int 21h
        
        jmp stop
   
    
    say_small:
        mov ah, 09h
        lea dx, small
        int 21h
        
        jmp stop
        
    
    say_invalid:
        mov ah, 09h
        lea dx, invalid
        int 21h
    
    stop:
        mov ax, 4c00h
        int 21h
    
    main endp
end main
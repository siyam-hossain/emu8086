; Problem 3: Simple Subtraction Check 
; Question: Input two digits. Subtract second from first. If result is positive, display "POSITIVE!". 
; If zero, display "EQUAL!". If negative, display "NEGATIVE!". 


.model small
.stack 100h
.data

    a_msg db 'a: $'
    b_msg db 13,10,'b: $'
    
    p_msg db 13,10,'Positive$'
    n_msg db 13,10,'Negative$'
    e_msg db 13,10,'Equal$'
    
    a db ?
    b db ?
    res db ?
    
.code
main proc
    mov ax, @data
    mov ds, ax
    
    ;---------prmpt msg----------
    mov ah, 09h
    lea dx, a_msg
    int 21h
    
    ;-------------input----------
    mov ah, 01h
    int 21h
    
    ;convert
    sub al, 30h
    mov a, al
    
    
    
    ;---------prmpt msg----------
    mov ah, 09h
    lea dx, b_msg
    int 21h
    
    ;-------------input----------
    mov ah, 01h
    int 21h
    
    ;convert
    sub al, 30h
    mov b, al
     
    
 
    ;-----------checking----------
    mov al, a
    mov bl, b
    
    cmp al, bl
    
    jz equal
    js negative
    
    
    ;----------output section----------
    positive:
        mov ah, 09h
        lea dx, p_msg
        int 21h
        
        jmp stop
    
    
    equal:
        mov ah, 09h
        lea dx, e_msg
        int 21h
        
        jmp stop
     
    negative:
        mov ah, 09h
        lea dx, n_msg
        int 21h

    stop:
        mov ax, 4c00h
        int 21h
    
    main endp
end main
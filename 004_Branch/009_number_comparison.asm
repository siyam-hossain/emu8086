; Problem 9: Number Comparison 
; Question: Write a program that inputs two single digits and displays which one is larger,  
; or if they are equal.

.model small
.stack 100h

.data
    fd db 'Enter first digit: $'
    sd db 13,10,'Enter second digit: $'
    
    fm db 13,10,'First is larger$'
    sm db 13,10,'Second is larger$'
    
    eq db 13,10,'Both are equal$'


.code
main proc
    mov ax, @data
    mov ds, ax
    
    ;-------prmpt msg---------------
    mov ah, 09h
    lea dx, fd
    int 21h
    
    ;--------input-----------
    mov ah, 01h
    int 21h
    
    ;------convert char into digit--------
    sub al, 30h
    mov bl, al 
    
    
    ;-------prmpt msg-------------
    mov ah, 09h
    lea dx, sd
    int 21h
    
    ;---------input-------------
    mov ah, 01h
    int 21h
    
    ;---------conversion-------
    sub al, 30h
    mov cl, al
    
    
    ;-------checking----------
    cmp bl, cl
    jg  f_m
    
    cmp bl, cl
    jl  s_m
        
    cmp bl, cl
    je  e_m 
    
    ;----------for others-----
    jmp stop
    
    
    ;-------output section-----------
    f_m:
        lea dx, fm
        jmp show
    s_m:
        lea dx, sm
        jmp show
    
    e_m: 
        lea dx, eq
        jmp show 
        
    show:
        mov ah, 09h
        int 21h
    
    
    stop:
        mov ax, 4c00h
        int 21h
        
    main endp
end main
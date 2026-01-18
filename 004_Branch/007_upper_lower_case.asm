; Problem 7: Upper/Lower Case Check 
; Question: Write a program that determines if an entered character is uppercase, lowercase, or neither. 

.model small 
.stack 100h 

.data 
    in_msg db 'Enter a character: $' 
    up_msg db 13,10,'UPPERCASE$' 
    lo_msg db 13,10,'LOWERCASE$' 
    ni_msg db 13,10,'NEITHER$' 
 

.code 

main proc
    mov ax, @data 
    mov ds, ax
    
    ;-------prmpt msg-----------------
     
    MOV ah, 09h 
    lea dx, in_msg
    int 21h 
     
    ;------input------------
    mov ah, 01h 
    int 21h 
    
    ;--------checking----------- 
    cmp al,'A'  ; ascii: A = 65 ; a = 97
    jl lower 
    
    cmp al,'Z' 
    jg lower
    


    
    ;--------output section-------------
    upper:
        mov ah, 09h
        lea dx, up_msg
        int 21h
        
        jmp stop
                    
    lower:
        ;---------checking------------
        cmp al,'a'  
        jl n_msg 
        
        cmp al,'z' 
        jg n_msg
        
        
        ;display
        mov ah, 09h
        lea dx, lo_msg
        int 21h
        
        jmp stop
    
    n_msg:
        mov ah, 09h
        lea dx, ni_msg
        int 21h
    
     
    
    stop:
        mov ax, 4c00h 
        int 21h
     
    main endp 
end main
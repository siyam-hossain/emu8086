; vowel calculation
; consonant calculation
; digit calculation

.model small
.stack 100h
.data
    
    str db "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789$"
    v_msg db 13,10,"vowel: $"
    c_msg db 13,10,"consonant: $"
    d_msg db 13,10,"digit: $"
    
    vl db 0
    cn db 0
    dg db 0
    
    ones db ?
    tens db ? 
    
.code

main proc
    mov ax, @data
    mov ds, ax
    
    mov es, ax
    
    ;---------source index-------------
    lea si, str
    
    ;---------data flag------------
    cld
    
    count:
        ;---------load a byte first-------------
        lodsb
        
        
        ;-----------base case-------------- 
        cmp al, '$'
        je show
        
        ;---------checking--------------
        digit:
            cmp al, '0'
            jl check_letter
            
            cmp al, '9'
            jg check_letter
            
            jmp inc_d
            
        
        check_letter:
            cmp al, 'A'
            jl count
            
            cmp al, 'Z'
            jg count
        
        vowel:
            cmp al, 'A'
            je inc_v
            
            cmp al, 'E'
            je inc_v
            
            cmp al, 'I'
            je inc_v 
            
            cmp al, 'O'
            je inc_v
            
            cmp al, 'U'
            je inc_v
        
        ;-----incremet consonant----------
        inc_c:
            inc cn
            jmp count
        
        ;-----increment consonant-----------
        inc_v:
            inc vl
            jmp count
        
        ;-----increment consonant------------ 
        inc_d:
            inc dg
            jmp count
            
        
    
    ;------------output section-----------------
    show:
        mov ah, 09h
        lea dx, v_msg
        int 21h
        
        mov al, vl
        mov bl, 10
        
        xor ah, ah
        
        div bl
        
        ; store
        mov ones, ah
        mov tens, al
        
        mov ah, 02h
        mov dl, tens
        add dl, 30h     ;vital point
        int 21h
        
        mov ah, 02h
        mov dl, ones
        add dl, 30h
        int 21h
           
           
           
           
        ;----------------- 
        mov ah, 09h
        lea dx, c_msg
        int 21h
        
        ;-------------------vital point------------
        mov al, cn
        mov bl, 10
        
        xor ah, ah
        
        div bl
        
        ; store
        mov ones, ah
        mov tens, al
        
        mov ah, 02h
        mov dl, tens
        add dl, 30h     ;vital point
        int 21h
        
        mov ah, 02h
        mov dl, ones
        add dl, 30h
        int 21h
        
        ;-------------------
        mov ah, 09h
        lea dx, d_msg
        int 21h
               

                       
        mov al, dg
        mov bl, 10
        
        xor ah, ah
        
        div bl
        
        ; store
        mov ones, ah
        mov tens, al
        
        mov ah, 02h
        mov dl, tens
        add dl, 30h     ;vital point
        int 21h
        
        mov ah, 02h
        mov dl, ones
        add dl, 30h
        int 21h
            

    
    
    stop:
        mov ax, 4c00h
        int 21h
        
    main endp
end main


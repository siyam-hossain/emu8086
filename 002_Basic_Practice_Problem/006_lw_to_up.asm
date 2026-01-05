.model small
.stack 100h
.data
msg db 'Enter a lowercase letter: $'        ; remember $ must at string
omsg db 'Uppercase letter: $'


.code

main proc
    mov ax, @data
    mov ds, ax
    
    
    ;prompt message
    mov ah, 09h
    lea dx, msg
    int 21h
    
    
    mov ah, 01h
    int 21h
    
    ;converting upper case
    sub al, 32
    mov bl, al ; save al
    
    
    ; new line
    mov ah, 02h
    mov dl, 13
    int 21h
    
    mov dl, 10
    int 21h  
    
    
    mov ah, 09h
    lea dx, omsg
    int 21h
    
    mov ah, 02h
    mov dl, bl
    int 21h
    
    
    
        
    
        
    
    
    main endp
end main
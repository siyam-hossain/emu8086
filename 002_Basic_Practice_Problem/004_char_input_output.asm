.model small
.stack 100h
.data
.code

main proc
    
    mov ax, @data
    mov ds, ax
        
    mov ah, 01h
    int 21h
    mov bl, al  ; save input
    
    
    mov cl, bl
    
    ;for new line only : in this case previous bl lost there fore bl need to preserve
    mov ah, 02h
    mov dl, 13
    int 21h
    
    mov dl, 10
    int 21h
     
     
     
     
     
    mov ah, 02h
    mov dl, cl
    int 21h
    
    
    
    mov ax, 4c00h
    int 21h 
        
        
        
    main endp
end main
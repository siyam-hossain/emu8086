.model small
.stack 100h
.data

msg db 'Hello!$'

.code

main proc
    
    mov ax, @data
    mov ds, ax
           
    
    
   
    
    ;for new line only
    mov ah, 02h
    mov dl, 13
    int 21h
    
    mov dl, 10
    int 21h
    
    
    mov ah, 02h
    mov dl, 13
    int 21h
    
    mov dl, 10
    int 21h
     
     
     
     
    ; display message
    mov ah, 09h
    lea dx, msg
    int 21h
    
    
    
    mov ax, 4c00h
    int 21h 
        
        
        
    main endp
end main
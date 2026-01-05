.model small
.stack 100h
.data

fnm db 'Siyam$'
nnm db 'Hossain$'

.code
main proc
    mov ax,@data
    mov ds, ax
        
    mov ah, 09h
    mov dx, offset fnm
    int 21h
    
    ;-----------------------------------new line-----------------------------------
    mov ah, 02h
    mov dl, 0dh ; 13 ---> cret
    int 21h
    
    mov dl, 0ah ; 10 ---> newl
    int 21h
    ;------------------------------------------------------------------------------
    
    mov ah, 09h
    mov dx, offset nnm
    int 21h 
    
    
    
    
    mov ax, 4c00h
    int 21h    
        
        
        
    main endp
end main
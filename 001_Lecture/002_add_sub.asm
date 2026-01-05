.model small
.stack 100h
.data
main proc

    mov ax, @data
    mov ds, ax
    
    mov ah, 12h
    mov al, 13h 
    
    add ah, al
    
    mov al, ah
    
    sub al, ah
    



main endp

end main
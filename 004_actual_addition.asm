.model small
.stack 100h
.data

a dw 1234h
b dw 6789h
sum dw ?
carry db 00h
.code 

main proc
    
    mov ax, @data
    mov ds, ax
    
    mov ax, a
    mov bx, b
    
    add ax, bx  
    
    
    jnc nocarry
        inc carry
    nocarry:
    
    mov sum, ax  
        
        
    main endp  

end main
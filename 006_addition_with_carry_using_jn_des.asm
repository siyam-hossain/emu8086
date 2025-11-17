.model small
.stack 100h
.data
 
 siyam dw 1234h
 hossain dw 0ffffh
 
 sum_res dw ?
 
 carry db 1
 
.code

main proc
    mov ax, @data
    mov ds, ax
    
    mov ax, siyam
    mov bx, hossain
    
    add ax,bx
    
    
    jc jump_carry
       dec carry
       jump_carry:
       
       mov sum_res, ax
       mov ax, 4h
       int 21h
    
    
    main endp

end main
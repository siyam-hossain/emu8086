.model small
.stack 100h
.data
 
 siyam dw 1234h
 ;hossain dw 0ffffh
 hossain dw 4444h
 
 sum_res dw ?
 
 carry db ?
 
.code

main proc
    mov ax, @data
    mov ds, ax
    
    mov ax, siyam
    mov bx, hossain
    
    add ax,bx
    
    jc jump_carry
       mov carry, 0
       
       jmp done  
       
       
    jump_carry:
       mov carry, 1
    
    
    done:
        mov sum_res, ax
        mov ax, 4h
        ;int 21h
    
    
    
    main endp

end main
; Problem 8: Simple Calculator Choice 
; Question: Write a program that displays a menu (1-Add, 2-Subtract, 3-Exit) and branches to appropriate 
; sections based on user choice.      


.model small
.stack 100h
.data
    
    menu db '1-Add 2-Subtract 3-Exit: $'
    add_msg db 13,10,'Add selected$'
    sub_msg db 13,10,'Subtract selected$'
    exit_msg db 13,10,'Exit selected$'

.code

main proc
    mov ax, @data
    mov ds, ax
    
    ;------prmpt msg-----------
    mov ah, 09h
    lea dx, menu
    int 21h
    
    ;---------input------------
    mov ah, 01h
    int 21h
    
    ;------convert it into digit-----------
    ; sub al, 30h
    ; it is not require cause we just check digits as character 
    
    
    ;------checking---------
    cmp al, '1'
    je a_msg
    
    cmp al, '2'
    je s_msg
    
    cmp al, '3'
    je e_msg
    
    ;-------for other----------
    ; jump
    jmp stop
    
     
    ;----------output msg---------------
    a_msg:
        mov ah, 09h
        mov dx, offset add_msg
        int 21h
        
        jmp stop
    
    s_msg:
        mov ah, 09h
        mov dx, offset sub_msg
        int 21h
        
        jmp stop
   
    e_msg:
        mov ah, 09h
        mov dx, offset exit_msg
        int 21h
    
    stop:
        mov ax, 4c00h
        int 21h
    
    main endp
end main
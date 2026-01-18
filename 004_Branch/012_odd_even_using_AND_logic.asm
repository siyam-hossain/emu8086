; Problem 2: Even or Odd using AND Logic 
; Question: Input a digit and use AND operation to check if it's even or odd. Display "EVEN NUMBER!" or 
; "ODD NUMBER!".


.model small
.stack 100h
.data
    msg db 'Enter a number: $'
    
    even_msg db 13,10,'Even$'
    odd_msg db 13,10,'Odd$'
    
.code
main proc
    mov ax, @data
    mov ds, ax
    
    ;---------prmpt msg----------
    mov ah, 09h
    lea dx, msg
    int 21h
    
    ;-------------input----------
    mov ah, 01h
    int 21h
    
    ;convert
    sub al, 30h
    
    ;-----------checking----------
    and al, 01h
    
    cmp al, 1
    je odd
    
    


    
    
    even:
        mov ah, 09h
        lea dx, even_msg
        int 21h
        
        jmp stop
     
    odd:
        mov ah, 09h
        lea dx, odd_msg
        int 21h

    stop:
        mov ax, 4c00h
        int 21h
    
    main endp
end main
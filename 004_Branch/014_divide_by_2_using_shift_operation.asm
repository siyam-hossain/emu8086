; Problem 4: Division by 2 Check 
; Question: Input a digit. Divide it by 2 using shift operation. 
; If result is greater than 3, display "BIG HALF!", otherwise "SMALL HALF!".  


.model small
.stack 100h
.data

    in_msg db 'Enter a digit: $'
    
    b_msg db 13,10,'Big Half$'
    s_msg db 13,10,'Small Half$'
    
.code
main proc
    mov ax, @data
    mov ds, ax
    
    ;---------prmpt msg----------
    mov ah, 09h
    lea dx, in_msg
    int 21h
    
    ;-------------input----------
    mov ah, 01h
    int 21h
    
    ;convert
    sub al, 30h
    

    ;-----------checking---------------
    ; normally: 8,4,2,1  [each time value increment by 2 times]
    ; mean if we shift bit right the number will be divided by 2
    
    shr al, 1
    cmp al, 3
    jg big
    
    jmp small
    
    
    ;----------output section----------
    big:
        mov ah, 09h
        lea dx, b_msg
        int 21h
        
        jmp stop
    
    
    small:
        mov ah, 09h
        lea dx, s_msg
        int 21h

    stop:
        mov ax, 4c00h
        int 21h
    
    main endp
end main
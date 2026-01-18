; Problem 1: Basic Addition Check 
; Question: Write a program that adds two single digits and checks if the result is greater than 10. Display 
; "BIG SUM!" if result > 10, otherwise display "SMALL SUM!". 


.model small
.stack 100h
.data
    a_msg db 'a: $'
    b_msg db 13,10,'b: $'
    
    bg_msg db 13,10,'BIG SUM!$'
    sm_msg db 13,10,'SMALL SUM!$'
    
    a db ?
    b db ?
    
    


.code
main proc
    mov ax, @data
    mov ds, ax
    
    ;---------prmpt msg----------
    mov ah, 09h
    lea dx, a_msg
    int 21h
    
    ;------input-------
    mov ah, 01h
    int 21h
    
    ;convert
    sub al, 30h
    mov a, al
    
    
    
    ;---------prmpt msg------------
    mov ah, 09h
    lea dx, b_msg
    int 21h
    
    ;--------input----------
    mov ah, 01h
    int 21h
    
    ;convert
    sub al, 30h
    mov b, al
    
    
    ;--------addition------------
    mov al, a
    add al, b
    
    ;---------checking----------
    cmp al, 10
    jg big
    
    
    
    small:
        mov ah, 09h
        lea dx, sm_msg
        int 21h
        
        jmp stop    
    
    big:
        mov ah, 09h
        lea dx, bg_msg
        int 21h
        
    stop:
        mov ax, 4c00h
        int 21h
    
    main endp
end main
; Problem 10: Loop with Condition 
; Question: Write a program that repeatedly asks for a character until the user enters 'Q' to quit. Display 
; "CONTINUE" for any other character.


.model small
.stack 100h
.data
    
    in_msg db 'Enter character (Q = quit): $'
    con_msg db 13,10,'CONTINUE',13,10, '$'
    q_m db 13,10,'GOOD BYE!$'

.code
main proc
    mov ax, @data
    mov ds, ax
    
    
    
    repeat_input:
        ;---------prmpt msg----------------
        mov ah, 09h
        lea dx, in_msg
        int 21h
        
        ;--------input----------------
        mov ah, 01h
        int 21h
        
        ;---------checking----------
        cmp al, 'Q'
        je quite
        
        ;-------continue---------
        mov ah, 09h
        lea dx, con_msg
        int 21h
        
        ;-------trigger loop again------------
        jmp repeat_input
    
    
    
    quite:
        mov ah, 09h
        lea dx, q_m
        int 21h 
    
    
    stop:
        mov ax, 4c00h
        int 21h
    
    main endp
end main
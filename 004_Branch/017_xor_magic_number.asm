; Problem 7: XOR Pattern Check 
; Question: Input a digit. XOR it with 3. If result is 0, display "MAGIC NUMBER!", 
; otherwise display "NORMAL NUMBER!".


.model small
.stack 100h
.data
    
    in_msg db 'Enter a digit: $'
    magic db 13,10,'MAGIC NUMBER!$'
    normal db 13,10,'NORMAL NUMBER!$'

.code

main proc
    mov ax, @data
    mov ds, ax
    
    ;------prmpt msg-------
    mov ah, 09h
    lea dx, in_msg
    int 21h
    
    ;------input------
    mov ah, 01h
    int 21h
    
    ;-------convert------
    sub al, 30h
    
    ;--------xor--------
    xor al, 3
    
    ;--------magic or not------
    jz  magic_num
    
    jmp normal_num
    
    ;---------output section---------
    magic_num:
        lea dx, magic
        jmp show
    
    normal_num:
        lea dx, normal
        
    show:
        mov ah, 09h
        int 21h
    
    stop:
        mov ax, 4c00h
        int 21h
    
    main endp
end main
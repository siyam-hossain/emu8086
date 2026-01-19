; Problem 9: NOT Operation Check 
; Question: Input a digit. Apply NOT operation and check if result is greater than 240. 
; Display "BIG NOT!" or "SMALL NOT!". 


.model small
.stack 100h
.data
    
    
    in_msg db 'Enter a digit: $'
    big_msg db 13,10,'BIG NOT!$'
    sml_msg db 13,10,'SMALL NOT!$'

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
    

    
    ;-------not operation--------
    not al
    cmp al, 240
    
    jg big
        
    ;---------output section---------
    small:
        lea dx, sml_msg
        jmp show
    
    big:
        lea dx, big_msg
         
    show:
        mov ah, 09h
        int 21h
    
    stop:
        mov ax, 4c00h
        int 21h
    
    main endp
end main
; Problem 10: Simple Average Check 
; Question: Input two digits. Add them and divide by 2 (using SHR). If average is 4 or more, 
; display "GOOD AVERAGE!", otherwise "LOW AVERAGE!".


.model small
.stack 100h
.data
    
    a_msg db 'a: $'
    b_msg db 13,10,'b: $'
    
    g_avg db 13,10,'GOOD AVERAGE!$'
    l_avg db 13,10,'LOW AVERAGE!$'
    
    a db ?
    b db ?

.code

main proc
    mov ax, @data
    mov ds, ax
    
    ;------prmpt msg-------
    mov ah, 09h
    lea dx, a_msg
    int 21h
    
    ;------input------
    mov ah, 01h
    int 21h
    
    ; convert
    sub al, 30h
    ; save
    mov a, al
    

    ;------prmpt msg-------
    mov ah, 09h
    lea dx, b_msg
    int 21h
    
    ;------input------
    mov ah, 01h
    int 21h
    
    ; convert
    sub al, 30h
    ; save
    mov b, al
    
    
    ;-----addition---------
    add al, a
              
    ;-----avg using shr-------
    shr al, 1
    
    
    ;-------checking------
    cmp al, 4
    jge good
        
    ;---------output section---------
    low:
        lea dx, l_avg
        jmp show
    
    good:
        lea dx, g_avg
         
    show:
        mov ah, 09h
        int 21h
    
    stop:
        mov ax, 4c00h
        int 21h
    
    main endp
end main
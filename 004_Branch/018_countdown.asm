; Problem 8: Simple Counter Loop 
; Question: Start with number 5. Keep subtracting 1 and display count until it reaches 0. 
; When 0, display "COUNTDOWN FINISHED!".


.model small
.stack 100h
.data
    
    
    in_msg db 'Enter counter: $'
    count db 13,10,'count: ',13,10,'$'
    finish_msg db 13,10,'COUNTDOWN FINISHED!$'

    counter db ?
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
    
    ; save counter
    mov counter, al
    
    ;-------countdown--------
    countdown:
        cmp counter, 0
        je  cd_end
        
        mov ah, 09h
        lea dx, count
        int 21h
        
        
        ;---convert into character-------
        mov bl, counter
        add bl, 30h
        
        mov ah, 02h
        mov dl, bl
        int 21h
        
        dec counter
        
        jmp countdown
        
        
    
    
    ;---------output section---------
    cd_end:
        lea dx, finish_msg
        jmp show
    
        
    show:
        mov ah, 09h
        int 21h
    
    stop:
        mov ax, 4c00h
        int 21h
    
    main endp
end main
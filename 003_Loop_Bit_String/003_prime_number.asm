;Problem 3 
;Write an 8086 assembly program that checks whether a given number N is prime or not prime.     


; N < 2 not a prime number
; N can't dividie by (n-1),(n-2),(n-3),......,2
; it can divide only N/N, or N/1
; then it is said to be a prime number
; we exclude 2 number to check prime condition {N,1}

.model small
.stack 100h
.data
    
    ;n dw 14
    n dw 2
    is_prime db 0


.code
main proc
    mov ax, @data
    mov ds, ax
    
    ;------------------ load the number first---------------------
    mov ax, n
    
    ;---------------check the number below 2 or not---------------
    cmp ax, 2
    
    ;-------------if below--------------------------
    jb not_prime_number
    
    ;------------if not-----------------------
    mov cx, ax  ;   setting the loop counter 
    sub cx, 2   ;   excluding N, 1
    
    ;------if cx = 2 then cx-2 = 0---------
    ; means it is still prime number
    je prime_num_found
    
    
    
    mov bx, 2   ; start divisor at 2
    
    check_prime:
        mov dx, 0
        mov ax, N
        
        div bx
        cmp dx, 0           ; if remainder 0 then divisible 
        je not_prime_number ; not found prime number
        
        inc bx
        loop check_prime
        
    
    
    
    prime_num_found:
        mov is_prime, 1
        jmp stop
    
    ;-------not_pime_number--------
    not_prime_number:
        mov is_prime, 0
        
    
    ;---------------terminate-----------
    stop:
        mov ax, 4c00h
        int 21h
    
    
    main endp
end main




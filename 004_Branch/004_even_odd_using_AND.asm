;    Problem 4: Even or Odd Number 
;    Question: Write a program that inputs a single digit and determines if it's even or odd using branch 
;    instructions.


.model small
.stack 100h
.data
    
    in_msg db 'Enter a digit: $'
    even db 13,10,'Even$'
    odd db 13,10,'Odd$'
    

.code
main proc
    mov ax, @data
    mov ds, ax
    
    ;--------prmt msg----------
    mov ah, 09h
    lea dx, in_msg
    int 21h
    
    
    ;------input---------
    mov ah, 01h
    int 21h
    ;---------convert into number-----------
    sub al, 30h
    
    
    ;------odd/even------(with add operation)
    ; 1 = 0001
    ; 3 = 0011
    ; 4 = 0100
    ; every odd number ends with 1
    ; every even number ends with 0
    ; means we need to check the last bit
    ; with help of AND masking
    
    and al, 01h
    cmp al, 1
    
    
    je say_odd
    
    
    say_even:
        mov ah, 09h
        lea dx, even
        int 21h
        
        jmp stop    
        
      
    say_odd:
        mov ah, 09
        lea dx, odd
        int 21h
        
    stop:
        mov ax, 4c00h
        int 21h
        
    main endp
end main
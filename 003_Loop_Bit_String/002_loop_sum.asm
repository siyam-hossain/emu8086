;Problem 2 
;Write an 8086 assembly program that 
;calculates the sum of the first N natural numbers (from 1 to N). 

.model small
.stack 100h
.data
    n dw 4
    sum dw 0
    

.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov cx, n
    mov ax, 0
    
    sum_natural:
        add ax, cx
        loop sum_natural
        
    mov sum, ax
    
    
    mov ax, 4c00h
    int 21h
            
            
        
        
    main endp
end main

;Problem 1 
;Write an 8086 assembly program that 
;counts the number of 1-bits (set bits) in a 16-bit word stored in memory. 

.model small
.stack 100h
.data

    ;number dw 1234h
    number dw 0001001000110100b
    count db 0


.code




main proc
    mov ax, @data
    mov ds, ax
    
    mov cx, 16  ; loop iterate 16 times
    
    ; 
    
    
    mov ax, number
    
    ;label
    loop_start:
        
        ;cy <- Accumulator <- shift bit left <- cy
        
        rcl ax, 1
        
        jc inc_count
        jnc no_inc
        
    
    ; this is just a label 
    ; it is not behave like if else statement
    ; to do that we externaly write that
    
    ; as we create two branch using jc, and jnc
    
    inc_count:
        inc count
        
        loop loop_start
    
    ;label    
    no_inc:
        loop loop_start
    
    ;terminate
    
    mov ax, 4c00h
    int 21h
        
        
    
    
    
    
    main endp
end main
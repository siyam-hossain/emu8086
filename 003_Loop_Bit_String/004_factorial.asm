;Problem 4 
;Write an 8086 assembly program to compute the factorial of a given non-negative integer 
;NUM (stored as a byte in memory). The program should calculate NUM! 


; 5! = 5*4*3*2*1
; 1! = 1
; 0! = 1


.model small 
.stack 100h
.data
    
    n db 5
    result dw ?


.code
main proc
    mov ax, @data
    mov ds, ax
    
    
    ; -----------init values in AX---------- 
    mov al, n
    mov ah, 0   ; clear ah
    
    ;------------init CX------------  
    mov cx, ax
    
    ;------------loop multiplication start with 1---------------
    ;   therefore
    mov ax, 1
    
    ;-------------compare ax and cx same or not---------------
    ; cx = 1 if we don't check it then cx = cx -1 
    ; as a result cx = 0 
    ; 0 * ax = 0
    
    cmp ax, cx
    je save_result
    
    
    
    ;-----------loop---------------
    factorial:
        mul cx
        loop factorial
    
    
     
    ;------------saving result----------------
    save_result:
        mov result, ax
        
        
    stop:
        mov ax, 4c00h
        int 21h
    
    
    
    
    
    
    main endp
end main 
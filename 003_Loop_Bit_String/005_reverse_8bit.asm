;Problem 6 
;Write an 8086 assembly program to reverse the bit order of an 8-bit binary number. 
;Input: 10100011 
;Output: 11000101 (reverse of input 10100011) 


.model small
.stack 100h
.data
    
    r db 0

.code

main proc
    mov ax, @data
    mov ds, ax
    
    
    ;-----------input----------------------
    mov dl, 10100011b
    
    ;---------want to rotate 8 bit---------------------------------------------------
    ; mov cl, 8                            
    ; ror dl, cl
    
    ; we can't use this approach cause rotate occured while [cl%register size > 0]
    
    ; since cl register size = 8
    ; therefore 8%8 = 0, as a result ror not performed
    ;-----------------------------------------------------------------------------------
   
    
    mov cx, 8
    
    reverse:
        ror dl, 1
        
        
        ;-------------extracting every single bit from carry--------------------
        ; <-- cy[] <----[r=0000 0000]<-----cy[]
        
        
        rcl r, 1    
        
        ;dec cl
        
        cmp cx, 0
        je stop
        
        loop reverse
   

    stop:
        mov ax, 4c00h
        int 21h
    
    main endp
end main
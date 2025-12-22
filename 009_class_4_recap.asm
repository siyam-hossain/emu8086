.model small
.stack 100h
.data
.code

main proc
    mov ax, @data
    mov ds, ax
    
       
    ;ADD
    mov al, 12h
    add al, 25h
    ;output: al = 37h : no carry 0
    
    mov bl, 23h
    mov cl, 18h
    add bl, cl
    ;ouput bl = 3B : no carry 0
    
    
    stc ; set carry 1
    mov al, 37h
    adc al, 25h
    ; al = 37 + 25 + 1 = 5B : no carray generated
    
    clc ; clear carry 0
    mov bl, 3bh
    mov cl, 18h
    adc bl,cl
    ; bl = 3b+18+0 = 53h: no carry
    
    
    ;SUB
    mov al, 37h
    sub al, 25h
    ;al = 37-25 = 12h : no borrow, cf = 0
    
    mov bl, 3bh
    mov cl, 18h
    sub bl, cl
    ;bl = 3b - 18 = 23h : no borrow, cf = 0
    
    
    ;SUB with borrow
    stc
    mov al, 12h
    sbb al, 25h
    ; al = 12h - 25h - 1 
    ; al = 12h + DBh + FFh = ECh : borrow, cf =1
    
    clc
    mov bl, 23h
    mov cl, 18h
    sbb bl,cl
    ;bl = 23 - 18 - 0 
    ;bl = 23 + E8 + 0 = 0B : no borrow 
     
     
    ; INC : Increment
    mov bl, 3bh
    inc bl
    ; bl = bl + 1 = 23 + 1 = 24h
    ; doesn't effect on CF
    
    mov bx, 0023h
    inc bx
    ; bx = bx + 1 = 0023 + 1 = 0024h
    
    
    
    ;DEC : Decrement
    mov bl, 3ch
    dec bl
    ; bl = bl - 1 = 3C - 1
    ; bl = 3c + FF = 3B
    ; does not effect CF
    
    mov bx, 0024h
    dec bx 
    ; bx = 0024 - 1
    ; bx = 0024 + FF
          
          
          
    ;-------------------------------------------------------------------
    
    ; MUL : unsigned multiplication
    ; Always multiply with [al] or [ax]
    
    mov al, 37h
    mov bl, 23h
    mul bl   
    
    ; ax <-- al * bl
    ; ax <-- 37 * 23 = 0785h 
    
    ;   n byte
    ; x n byte
    ;-------
    ;  2n byte
    
    ; therefore 2n can't store in al (1 byte)
    ; 2n can store in ax (2 byte) 
    
    mov ax, 85h
    mov bl, 49h ; it is unused
    mov cl, 65h
    mul cl
    ; ax <-- al * cl
    ; ax <-- 85 * 65 = 3479h
    ; ****************************always store in ax
     
    
    
    ;*** 
    mov ax, 3333h
    mov bx, 2040h
    mov cx, 7595h
    mul cx
    ;dx-ax <-- ax * cx = 3333 * 7595 = 1784 1BAF [4 byte]
    
    ;   2 byte
    ; X 2 byte
    ;------------
    ;   4 byte
    
    ; ax (2 byte : lower): 1BAF
    ; wx (2 byte : higher): 1784  
                                 
    
    ;setting ax bx 00 00
    mov ax, 0000h
    mov bx, 0000h
    
    ;IMUL : signed multiplication
    mov al, 37h ; signed value: +/-
    mov bl, 23h ; signed value: +/-
    imul bl
    
    ;ax <-- al * bl = 37 * 23 = 07 85h
    
    mov al, -2h ; signed value: -2 : FE
    mov bl, 9h  ; signed value: +9 : 09
    imul bl    
   
    ;ax <-- al * bl = -2 * 9 = FE * 09 = FF EE
    
    
    
    
    
    main endp
end main





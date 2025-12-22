.model small
.stack 100h
.data
.code

main proc

    mov ax, @data
    mov ds, ax
    
    
    ;------------------------------------------------------------
    ; ROL : rotate left
    ; if count = 1, it is directly specified in the instruction
    ; if count > 1, it has to be loaded in the CL register first
    
    clc
    mov bl, 10101011b
    rol bl,1
    
    
    clc
    mov cl, 2
    mov bl, 10101011b
    rol bl,cl
    
    
    ;------------------------------------------------------------
    ; ROR : rotate right
    ; 
    
    clc
    mov bl, 10101011b
    ror bl,1
    
    clc
    mov cl, 2
    mov bl, 10101011b
    ror bl,cl
              
    ;------------------------------------------------------------              
    ;RCL : Rotate through Carry Left
    clc
    mov bl, 10101011b
    rcl bl,1
    
    clc
    mov cl, 2
    mov bl, 10101011b
    rcl bl,cl
    

      
    ;------------------------------------------------------------              
    ;RCR : Rotate through Carry Right 
    clc
    mov bl, 10101011b
    rcr bl,1
    
    clc
    mov cl, 2
    mov bl, 10101011b
    rcr bl,cl              
              
              
    
    main endp
end main




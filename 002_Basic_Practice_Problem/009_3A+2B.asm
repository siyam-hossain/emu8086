; problem statement: single digit inputs and output
; calculate: 3A + 2B


.model small
.stack 100h
.data

mA db 'Enter A: $'
mB db 13,10, 'Enter B: $'
mout db 13,10, '3A+2B = $'


a db ?
b db ?

res db ?


.code

main proc
    mov ax, @data
    mov ds, ax
    
    ;-------msg--------
    mov ah, 09h
    lea dx, mA
    int 21h
    
    ;----input---------
    mov ah, 01h
    int 21h
     
    ;equation first-------
    ;convert as digit****************
    sub al, 30h
    
    mov bl, 3h
    mul bl  ; 3A
   
    ;storing-----------
    mov a, al
    
              
              
              
    ;-------msg--------
    mov ah, 09h
    lea dx, mB
    int 21h
    
    
    ;-----input-------
    mov ah, 01h
    int 21h
    
    
    ;equation second-------  
    ;convert into digit first*************
    sub al, 30h
    
    mov bl, 2h
    mul bl
    
    ;storing---------
    mov b, al
    
    
          
              
    
    ;full equation--------
    mov al, a
    mov bl, b
    
    add al, bl 
    
    mov res, al
    
    

     
    ;-------output msg------------
    mov ah, 09h
    lea dx, mout
    int 21h
    
     
    ;------ result output -------  
    ; convert first******************
    
    mov bl, res
    add bl, 30h
    
    mov ah, 02h
    mov dl, bl
    int 21h
    
    
    ; terminate
    mov ax, 4c00h
    int 21h
        
        
        
    main endp
end main

;problem statement
; take two input nunbers 
; add them
; show the result single single digit

.model small
.stack 100h
.data

input db 'input x: $'
input2 db 13,10, 'input y: $'
output db 13,10, 'output: $'

x db ?
y db ?
result db ?

digt1 db ?
digt2 db ?
      
      
.code

main proc
    mov ax, @data
    mov ds, ax
           
    ;--------------input message print----------------       
    mov ah, 09h
    lea dx, input
    int 21h
    
    ;--------------1st digit----------------
    mov ah, 01h
    int 21h
    
    ;--------------convert it actual digit----------------
    sub al,30h ; in ascii value
    mov x,al  
    
    ;--------------input message print----------------       
    mov ah, 09h
    lea dx, input2
    int 21h
    
    ;--------------2nd digit----------------
    mov ah, 01h
    int 21h
    
    sub al, 30h
    mov y, al
    
    ;--------------addition----------------       
    mov al, x
    add al, y
    
    mov result, al 
    
    
    ;--------------output message print----------------       
    mov ah, 09h
    lea dx, output
    int 21h
       
       
    ;-------------check if result >= 10-----------------   
    mov al,result
    cmp al, 10
    
    ja double_digit 
    
    
    
    ;--------------convert result: single digit--------- 
    add result, 30h   
    
    
    ;--------------output result---------------- 
    mov ah, 02h
    mov dl, result
    int 21h
    
    mov ax, 4c00h
    int 21h 
    
    
    
    ;--------------convert result: double digit---------
    
    double_digit:
        mov ah, 0
        mov al, result
        
        mov bl, 10
        div bl       ; AL = tens, AH = ones
        
        ; storing tens and ones values
        mov digt1, al
        mov digt2, ah
        
        ;convert tens first------------------------
        add digt1, 30h  
        
        ;print tens
        mov ah, 02h
        mov dl, digt1
        int 21h
        
        ; convert ones
        add digt2, 30h
        
        ;print ones
        mov ah, 02h
        mov dl, digt2
        int 21h 

    
    
    
    main endp
end main
;   problem:
;   eqation: A*B-C


.model small
.stack 100h
.data

m1 db 'Enter A: $'
m2 db 13,10, 'Enter B: $'
m3 db 13,10, 'Enter C: $'

m4 db 13,10, 'A*B-C = $'

a db ?
b db ?
c db ?

res db ?


.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 09h
    lea dx, m1
    int 21h
    
    mov ah, 01h
    int 21h
    
    ;convert
    sub al, 30h
    mov a, al 
    
    
    
    mov ah, 09h
    lea dx, m2
    int 21h
    
    mov ah, 01h
    int 21h
    
    ;convert
    sub al, 30h
    
    mov b,al 
    
    
    
    mov ah, 09h
    lea dx, m3
    int 21h
    
    mov ah, 01h
    int 21h
    
    ;convert
    sub al, 30h
    
    mov c,al
    
    
    
    ;full equation
    
    mov al, a
    mov bl, b
    mov cl, c
    
    mul bl
    sub al, cl
    mov res, al
    
    
    
    ;msg
    mov ah, 09h
    lea dx, m4
    int 21h
    
    mov bl, res
    ; convert
    add bl, 30h
    
    mov ah, 02h
    mov dl, bl
    int 21h
    
    
    ;terminate
    mov ax, 4c00h
    int 21h
    
    
    
    
    
    main endp
end main
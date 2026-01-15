;convert a lowercase letter to uppercase
.model small
.stack 100h
.data

input db 'Enter a lowercase letter: $'
output db 13,10,'Uppercase: $'

; here 13,10 use for newline creation


.code

main proc
    mov ax,@data
    mov ds, ax
    
    ;--------------input message print----------------
    mov ah, 09h
    ;lea dx, input
    mov dx, offset input
    int 21h
    
    
    ;--------------taking input-----------------------
    mov ah,01h
    int 21h
   
    ;-----------converting input in uppercase---------
    sub al, 32
    mov bl, al ; saving the uppercase
    
    
    ;--------------output message print----------------
    mov ah, 09h
    lea dx, output
    int 21h
    
    ;--------------print uppercase char----------------
    mov ah, 02h
    mov dl, bl
    int 21h
    
    
    
    mov ax, 4c00h
    int 21h
    
    
    
    main endp
end main
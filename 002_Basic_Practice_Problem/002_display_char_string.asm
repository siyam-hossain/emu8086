.model small
.stack 100h
.data 

nm db 'Siyam Hossain$'
;name db 'Siyam Hossain$'

.code

main proc
    mov ax,@data
    mov ds, ax
    
    
    ; Display the prompt '?'
    mov ah, 02h
    mov dl, '?'
    int 21h         ;interupt 21h 
    
           
    ; Display the message 'Siyam Hossain'
    mov ah, 09h
    ;lea dx, nm
    mov dx, offset nm
    
     
    ;lea dx, name
    int 21h
        
        
      
        
    mov ax, 4c00h   
    int 21h
       
        
        
        
    main endp
end main
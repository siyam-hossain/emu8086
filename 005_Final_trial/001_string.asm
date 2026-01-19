; Problem 7 
; Write an 8086 assembly program that takes a $-terminated string stored in memory, converts 
; all lowercase letters (a-z) in the string to uppercase, and leaves all other characters 
; unchanged. After conversion, display the message "Capitalized: " followed by the modified 
; string, then exit to DOS.
                                               

.model small
.stack 100h
.data
    
    str db "heLlo world! 8086 asm$"
    msg db "Capitalized: $"
    
    
.code

main proc
    mov ax, @data
    mov ds, ax
    mov es, ax
    
    
    lea si, str
    lea di, str
    
    
    ;--------------to increase si, di-------
    ; clear data flag first
    ; df = 0 , si, di auto increment
    
    cld
    
    ;----------capitalize-------------
    capitalize:
        ;---------load each byte---------
        lodsb
        
        
        ;--------base case--------stoping criteria--------
        cmp al, '$'
        je show
        
        
        ;-------if already capital--------------
        cmp al, 'a'
        jb no_change
        
        cmp al, 'z'
        ja no_change
        
        ;------if not capital--------
        sub al, 20h
        
        
        no_change:
            stosb   ; store a byte
        
        jmp capitalize
        
    
    
    
    show:
        mov ah, 09h
        lea dx, msg
        int 21h
        
        mov ah, 09h
        lea dx, str
        int 21h 
    
    
    stop:
        mov ax, 4c00h
        int 21h
        
    main endp
end main


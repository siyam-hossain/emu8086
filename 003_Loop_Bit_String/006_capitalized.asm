; Problem 7 
; Write an 8086 assembly program that takes a $-terminated string stored in memory, converts 
; all lowercase letters (a-z) in the string to uppercase, and leaves all other characters 
; unchanged. After conversion, display the message “Capitalized: ” followed by the modified 
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
    
    ;-----------ES normally use in string instruction (MOVS, STOS, LODS, CMPS)----------
    mov es, ax
    
    ;----------clear data flag--------------------
    ; cld, df = 0 : auto increment
    ; std, df = 1 : auto decrement
    
    cld
    
    
    ;------------we store the value of str in si and di---------------------
    mov si, offset str
    mov di, offset str                                     
    
    capitalize:
        ; load string byte
        lodsb
        
        ; checking end character 
        cmp al, '$'
        
        je store_done
        
        
        ; char<a or z<char just store as it is
        cmp al, 'a'
        jb store_as_it_is
        
        cmp al, 'z'
        ja store_as_it_is
        
        ;-------------other wise subtract 30 dec every time-------------
        sub al, 20h     ; 30 hex value 20
        
        
        
        
        
        
    store_as_it_is:
        stosb
        
        ; we don't use loop keyward case we don't konow the string size every time
        jmp capitalize
        
        
        
        
    
    ;------------all byte stored--------------           
    store_done:
        stosb
        
        display_msg:
            mov ah, 09h
            lea dx, msg
            int 21h
            
        capital_output:
            mov ah, 09h
            lea dx, str
            int 21h

    
    stop:
        mov ax, 4c00h
        int 21h
    
    main endp
end main
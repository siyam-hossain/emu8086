; Problem 3: Vowel or Consonant 
; Question: Write a program that checks if an entered character is a vowel (A,E,I,O,U) or consonant. 
; Display appropriate message.

.model small
.stack 100h
.data
    
    in_msg db 'Enter a character: $'
    vowel db 13,10,'Vowel$'
    consonant db 13,10,'Consonant$'
    
    
.code
main proc
    mov ax, @data
    mov ds, ax
    
    ;------prmt msg----------
    mov ah, 09h
    lea dx, in_msg
    int 21h
    
    ;---------input--------
    mov ah, 01h
    int 21h
    
    
    
    ;-----checking------
    cmp al, 'a'
    je say_vowel
    
    cmp al, 'e'
    je say_vowel
    
    cmp al, 'i'
    je say_vowel
    
    cmp al, 'o'
    je say_vowel
    
    cmp al, 'u'
    je say_vowel
    
    
    say_consonant:
        mov ah, 09h
        lea dx, consonant
        int 21h
        
        jmp stop
    
    say_vowel:
        mov ah, 09h
        lea dx, vowel
        int 21h
    
    stop:
        mov ax, 4c00h
        int 21h
        
        
    main endp
end main
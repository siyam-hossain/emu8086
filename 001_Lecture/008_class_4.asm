.model small
.stack 100h
.data
; No data variables needed, as we'll use registers for demos
.code
main proc
mov ax, @data
mov ds, ax

;ADD destination, source (basic addition)
; Initialize AL = 12H
mov al, 12h
add al, 25h     ; AL = AL + 25H = 12H + 25H = 37H (no carry, CF=0)

; Initialize BL=23H, CL=18H
mov bl, 23h
mov cl, 18h
add bl, cl      ; BL = BL + CL = 23H + 18H = 3BH (no carry, CF=0)

; ======================================
; Demo 2: ADC destination, source (add with carry)
; Assume previous ADD set CF=0, but for demo, force CF=1
stc             ; Set Carry Flag (CF=1) manually for example
mov al, 37h     ; Reset AL to 37H from previous example
adc al, 25h     ; AL = AL + 25H + CF = 37H + 25H + 1 = 63H (may set CF if overflow)
clc             ; Clear Carry Flag (CF=0)
mov bl, 3bh     ; Reset BL to 3BH
mov cl, 18h
adc bl, cl      ; BL = BL + CL + CF = 3BH + 18H + 0 = 53H (no carry)


; ======================================
; Demo 3: SUB destination, source (basic subtraction)
mov al, 37h     ; Set AL to 37H
sub al, 25h     ; AL = AL - 25H = 37H - 25H = 12H (no borrow, CF=0)
mov bl, 3bh
mov cl, 18h
sub bl, cl      ; BL = BL - CL = 3BH - 18H = 23H (no borrow, CF=0)


; ======================================
; Demo 4: SBB destination, source (subtract with borrow)
stc             ; Set CF=1 (borrow) for demo
mov al, 12h     ; Set AL to 12H
sbb al, 25h     ; AL = AL - 25H - CF = 12H - 25H - 1 = EEH (signed: -18, but with borrow, CF may set)
clc             ; Clear CF=0
mov bl, 23h
mov cl, 18h
sbb bl, cl      ; BL = BL - CL - CF = 23H - 18H - 0 = 0BH (no borrow)


; ======================================
; Demo 5: INC operand (increment)
mov bl, 3bh
inc bl          ; BL = BL + 1 = 3BH + 1 = 3CH (does not affect CF)
mov bx, 0023h   ; BX=0023H (assuming high byte 00 for simplicity)
inc bx          ; BX = BX + 1 = 0023H + 1 = 0024H


; ======================================
; Demo 6: DEC operand (decrement)
mov bl, 3ch
dec bl          ; BL = BL - 1 = 3CH - 1 = 3BH (does not affect CF)
mov bx, 0024h
dec bx          ; BX = BX - 1 = 0024H - 1 = 0023H


; ======================================
; Demo 7: MUL operand (unsigned multiplication)
mov al, 37h     ; AL=37H
mov bl, 23h     ; BL=23H
mul bl          ; AX = AL * BL = 37H * 23H = 0785DH 
; Note: For 16-bit, mov ax, some_value; mul bx; result in DX:AX


; ======================================
; Demo 8: IMUL operand (signed multiplication)
mov al, 37h     ; Treat as signed (positive)
mov bl, 23h
imul bl         ; AX = AL * BL (signed) = same as above for positives
; For negative demo: mov al, -1 (FFH); imul bl; etc.


; ======================================
; Demo 9: DIV divisor (unsigned division)
mov ax, 0785h   ; AX=079DH from mul example
mov bl, 23h     ; Divisor BL=23H
div bl          ; AL = AX / BL (quotient), AH = remainder; 079DH / 23H = 37H quotient (55 dec), remainder 00H 
; For 16-bit divisor: mov dx,0; mov ax,val; div bx; AX=quot, DX=rem


; ======================================
; Demo 10: IDIV operand (signed division)
; Similar to DIV, but signed
mov ax, 0785h
mov bl, 23h
idiv bl         ; Signed divide


;overflow
;mov ax, -2
;mov bl, 23h
;div bl

mov ax, -2
mov bl, 23h
idiv bl


mov ax, -40h
mov bl, 23h
idiv bl



; ======================================
; Demo 11: CBW (convert byte to word)
mov al, 37h     ; AL=37H (positive)
cbw             ; AX = sign-extend AL = 0037H
; For negative: mov al,0C5H (-59); cbw -> FFC5H
; ======================================


; Demo 12: CWD (convert word to doubleword)
mov ax, 0037h
cwd             ; DX:AX = sign-extend AX = 0000:0037H
; ======================================   


; Demo 13: CMP operand1, operand2 (compare)
mov bl, 3bh
mov cl, 18h
cmp bl, cl      ; BL - CL = 3BH - 18H = 23H (sets flags: ZF=0, SF=0, CF=0, etc.)
; ======================================  



; Demo 14: NEG operand (negate)
mov bl, 3bh     ; BL=3BH (59 dec)
neg bl          ; BL = -BL (two's complement) = -59 = C5H (signed)
; Program end
mov ah, 4ch
int 21h
main endp
end main
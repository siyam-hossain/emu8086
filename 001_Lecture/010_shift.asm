.model small
.stack 100h
.data
.code

main proc

mov ax, @data
mov ds, ax


;------------------------------------------------------------------------
;SAL/SHL : shift arithmetic left, logical
;syntax: SAL destination, count


; if count = 1, it is directly specified in the instruction.
; if count > 1, it has to be given using CL register

mov bl, 0001b
sal bl, 1       ; shift arithmetic left by 1
; cf[0]<----0000 0001b; hex: 01h
; cf[0]<----0000 0010b; hex: 02h


mov cl, 2
mov bl, 0011b
sal bl, cl
; cf[0]<----0000 0011b; hex: 01h
; cf[0]<----0000 0110b; hex: 06h
; cf[0]<----0000 1100b; hex: 0ch

mov cl, 2
mov bl, 1100b
sal bl, cl
; cf[0]<----0000 1100b; hex: 0ch
; cf[0]<----0001 1000b; hex: 18h
; cf[0]<----0011 0000b; hex: 30h


mov cl, 03h
mov bl, 0011 0000b
;mov bl, 30h
sal bl, cl
; cf[0]<----0011 0000b; hex: 30h
; cf[0]<----0110 0000b; hex: 60h
; cf[0]<----1100 0000b; hex: c0h
; cf[1]<----1000 0000b; hex: 80h


;------------------------------------------------------------------------
;SHR : Shift Logical Right
;syntax: shr destination, count

mov bl, 11000001b
shr bl, 1



; SAR: shift arithmetic Right
; sign bit preserved
mov bl, 11001001b
sar bl, 1


mov cl, 8
mov bl, 10000000b
shr bl, cl

mov cl, 8
mov bl, 10000000b
sar bl, cl



main endp
end main

; global offset of the boot sector
[org 0x7c00]

mov bp, 0x8000 ; this is an address far away from 0x7c00 so that we don't get overwritten
mov sp, bp ; if the stack is empty then sp points to bp

mov ah, 0x0e ; tty mode
mov al, [the_data]
int 0x10

push 'o'
push 'l'
push 'e'

; recover our characters using the standard procedure: 'pop'
; We can only pop full words so we need an auxiliary register to manipulate
; the lower byte
pop bx
mov al, bl
int 0x10 ; prints e

pop bx
mov al, bl
int 0x10 ; prints l
int 0x10 ; prints l again

pop bx
mov al, bl
int 0x10 ; prints o

mov al, ','
int 0x10
mov al, ''
int 0x10
mov al, 'w'
int 0x10
mov al, 'o'
int 0x10
mov al, 'r'
int 0x10
mov al, 'l'
int 0x10
mov al, 'd'
int 0x10
mov al, '!'
int 0x10

the_data:
    db "H"

jmp $ ; jump to current address = infinite loop

; padding
times 510 - ($-$$) db 0
; magic number
dw 0xaa55

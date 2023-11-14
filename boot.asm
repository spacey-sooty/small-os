; global offset of the boot sector
[org 0x7c00]

mov ah, 0x0e ; tty mode
mov al, [the_data]
int 0x10
mov al, 'e'
int 0x10
mov al, 'l'
int 0x10
int 0x10 ; 'l' is still on al, remember?
mov al, 'o'
int 0x10
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

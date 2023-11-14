; global offset of the boot sector
[org 0x7c00]

mov bp, 0x8000 ; this is an address far away from 0x7c00 so that we don't get overwritten
mov sp, bp ; if the stack is empty then sp points to bp

mov ah, 0x0e ; tty mode
mov al, "H"
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
mov bx, the_data
call print

print:
    pusha

; keep this in mind:
; while (string[i] != 0) { print string[i]; i++ }

; the comparison for string end (null byte)

    mov al, [bx] ; 'bx' is the base address for the string
    cmp al, 0 
    je done

    ; the part where we print with the BIOS help
    mov ah, 0x0e
    int 0x10 ; 'al' already contains the char

    ; increment pointer and do next loop
    add bx, 1
    jmp print

done:
    popa
    ret

the_data:
    db 'world!', 0

jmp $ ; jump to current address = infinite loop

; padding
times 510 - ($-$$) db 0
; magic number
dw 0xaa55

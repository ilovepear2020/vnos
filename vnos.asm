[bits 16]
[org 0x7c00]
start:
	xor ax,ax
	mov ds,ax
	mov es,ax
	mov bx,0x8000
	mov si,hello_world
	call print_string
hello_world:
	db '####################################',13,10
	db '#   Welcome to VNos version 1.0!   #',13,10
	db '####################################',13,10
	db '(+)Version: 1.0.0',13,10
	db '(+)Author: Nguyen Thanh Cong',13,10
	db '(+)Programming Language: Assembly',13,10
	db '(+)Created on: 09/2/2020',13,10
	db '####################################',0
print_string:
	mov ah,0x0E
.repeat_next_char:
	lodsb
	cmp al,0
	je .done_print
	int 0x10
	jmp .repeat_next_char
.done_print:
	ret
	times (510-($-$$)) db 0x00
	dw 0xAA55
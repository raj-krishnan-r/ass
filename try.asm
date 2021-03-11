SECTION .data
msg db 'RajKrishnan R'
SECTION .text
global _start
_start:

mov eax, 1 ;data
mov edx,13 ;Bytes
mov ecx, msg ;Stuff to print
mov ebx, 1 ;STDOUT in sys_write is selected
mov eax, 4 ;specifies that the call is sys_write
int 80h

mov eax, 1
int 80h

%include 'functions.asm'
SECTION .data
msg1 db 'Hello, brave World',0Ah, 0h
msg2 db 'This is brave',0Ah, 0h

SECTION .text
global _start
_start:
mov eax, msg1
call sprint
mov eax, msg2
call sprint
call quit
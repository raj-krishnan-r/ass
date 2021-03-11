%include 'functions.asm'
SECTION .data
msg1 db 'All fruits are not apple.'
msg2 db 'All apple are frutes.'
SECTION .text
global _start
_start:
    mov eax,msg1
    call sprintLF ;sprintLF takes value from eax
    mov eax,msg2
    call sprintLF
    call quit
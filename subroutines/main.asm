SECTION .data
msg db 'Hello World is overrated', 0Ah

SECTION .text
global _start
_start:
mov eax,msg; stored msg address to eax
call strlen ;calling strlen to calculate the length of the string
mov edx,eax ;strlen leaves result (string length) in eax and it is copied to edx
mov ecx,msg ;message address is copied to ecx
mov ebx, 1 ;STDOUT value is copied to ebx
mov eax, 4 ;sys_write mode activation
int 80h

;ahem exit code
mov ebx, 0
mov eax, 1
int 80h

strlen:
push ebx ;push the value of ebx to stack for preserving 
mov ebx, eax ;copy eax to ebx

nextchar:
cmp byte [eax],0
jz finished
inc eax
jmp nextchar

finished:
sub eax, ebx
pop ebx ;pop value on the stack
ret ;return to where the function was called


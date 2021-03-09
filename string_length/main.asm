SECTION .data
msg db 'Hello, We are all people living in this phase of the world',0Ah
SECTION .text
global _start
_start:
mov ebx, msg ;address of msg variable is copied at ebx
mov eax, ebx ;eax and ebx is set same

nextchar:
cmp byte [eax], 0 ;compare the byte pointed by [eax] with 0 (null pointer)
jz finished ;cmp sets a Zero Flag which results in a jump here to the finished label, if eax == 0
inc eax ;increment eax by one byte
jmp nextchar ;jump to nextchar label : this label or a recurssion..
finished:
sub eax, ebx ;finds the number number of memory segments between eax and ebx and stores it in eax

mov edx, eax ;copies eax to edx

mov ecx, msg ;copied pointer to msg to ecx
mov ebx, 1; Set STDOUT to ebx
mov eax, 4; sys_write mode set 
int 80h ;interupt called

;procedures for exiting
mov ebx, 0; no errors set
mov eax, 1; sys_exit mode set

int 80h



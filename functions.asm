;int slen(String message)
;Calculates the length of a string
;presumable stored @ eax
slen:
push ebx
mov ebx,eax
nextchar:
cmp byte [eax],0
jz finished
inc eax
jmp nextchar
finished:
sub eax,ebx ;result is stored in eax
pop ebx
ret ;like control back to ebx address.. 
;string print function
sprint:
push edx,
push ecx,
push ebx,
push eax,
call slen
mov edx, eax ;result for slen is stored at eax
pop eax 
mov ecx, eax
mov ebx, 1
mov eax, 4
int 80h
pop ebx
pop ecx
pop edx
ret
sprintLF:
call sprint
push eax ;since eax is being used by this function it is pushed to the stack
mov eax,0Ah ;0Ah represents linefeed, and it copied to eax
push eax ;it is then pushed into stack
mov eax,esp ;esp pointed to the head of stack and hence it represents 0Ah's address
;sprint function is designed to print whatever in eax
call sprint
pop eax ;eax should be popped twice since it is pushed twice; such that the previous value is restored.
pop eax
ret
quit:
mov ebx, 0
mov eax, 1
int 80h
ret
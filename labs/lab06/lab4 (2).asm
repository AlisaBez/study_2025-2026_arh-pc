%include 'in_out.asm'
SECTION .data
msg: DB 'Введите значение переменной х: ',0
rem: DB 'Результат: ',0
SECTION .bss
x: RESB 80
SECTION .text
GLOBAL _start
_start:
mov eax, msg
call sprint

mov ecx, x
mov edx, 80
call sread

mov eax, x
call atoi

add eax, 18    ; x + 18
mov ebx, 5     ; 
mul ebx        ; 5 * (x + 18)
sub eax, 28    ; 5*(x+18) - 28

mov edi, eax

mov eax, rem
call sprint
mov eax, edi
call iprintLF


mov eax, 1      ;
mov ebx, 0      ; 
int 0x80

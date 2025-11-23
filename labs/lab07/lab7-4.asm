%include 'in_out.asm'
SECTION .data
msg_x: DB 'Введите значение переменной x: ', 0
msg_a: DB 'Введите значение переменной a: ', 0
res: DB 'Результат: ', 0
SECTION .bss
x: RESB 80
a: RESB 80
SECTION .text
GLOBAL _start
_start:
; Ввод значения x
mov eax, msg_x
call sprint
mov ecx, x
mov edx, 80
call sread
mov eax, x
call atoi
mov edi, eax    ; edi = x

; Ввод значения a
mov eax, msg_a
call sprint
mov ecx, a
mov edx, 80
call sread
mov eax, a
call atoi
mov esi, eax    ; esi = a

; Вычисление функции f(x)
; f(x) = { 2a - x, если x < a
;         { 8,      если x ≥ a

cmp edi, esi    ; Сравниваем x и a
jl less_than    ; Если x < a, переходим к ветке 2a-x
mov eax, 8      ; Если x ≥ a, результат = 8
jmp print_result

less_than:
; Вычисляем 2a - x
mov eax, esi    ; eax = a
add eax, eax    ; eax = 2a (умножение на 2 через сложение)
sub eax, edi    ; eax = 2a - x

print_result:
mov edi, eax    ; Сохраняем результат в edi
mov eax, res
call sprint
mov eax, edi    ; Восстанавливаем результат
call iprintLF
call quit

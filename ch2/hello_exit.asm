section .data
message: db 'hello, world!', 10

section .text
global _start

_start:
    mov rax, 1  ; 'write' syscall number
    mov rdi, 1  ; discripter of stdout
    mov rsi, message    ; address of strings
    mov rdx, 14 ; bytes size of strings
    syscall

    mov rax, 60 ; 'exit' syscall number
    xor rdi, rdi
    syscall
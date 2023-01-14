section .data
codes:
  db '0123456789ABCDEF'

section .text
global _start
_start:
  ; Hex numbers
  mov rax, 0x1122334455667788

  mov rdi, 1
  mov rdx, 1
  mov rcx, 64

.loop:
  push rax
  sub rcx, 4
  ; cl is resister
  ; rax > eax > ax = (ah + al)
  ; rcx > ecx > cx = (ch + cl)
  sar rax, cl
  and rax, 0xf  ; right shift rax, then calculate AND 

  lea rsi, [codes + rax]
  mov rax, 1

  push rcx
  syscall
  pop rcx

  pop rax
  test rcx, rcx
  jnz .loop

  mov rax, 60 ; 'exit' system call
  xor rdi, rdi
  syscall
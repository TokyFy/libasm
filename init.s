section .text

global _start

_start:
    mov rax, [rsp];
    cmp rax, 2
    jne .exit

    mov rdi, [rsp + 16]
    call ft_strlen
    jmp .exit

.exit:
    mov rdi, 0
    mov rax, 60
    syscall

ft_strlen:
    xor rax, rax

.loop:
    cmp byte [rdi + rax], 0
    je .done
    inc rax
    jmp .loop

.done:
        ret


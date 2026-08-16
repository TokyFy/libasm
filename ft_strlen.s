section .text

global ft_strlen

ft_strlen:
    xor eax, eax

.loop:
    mov cl, [rdi + rax]
    cmp cl, 0
    je .done
    inc eax
    jmp .loop

.done:
        ret


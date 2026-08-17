section .text

extern ft_strlen
extern malloc
extern ft_strcpy

global ft_strdup

ft_strdup:
    push rdi
    call ft_strlen wrt ..plt
    
    mov rdi, rax
    inc rdi
    call malloc wrt ..plt

    cmp rax, 0
    je .error

    pop rsi
    mov rdi,rax
    
    call ft_strcpy wrt ..plt
    ret
    
.error :
    ret
    

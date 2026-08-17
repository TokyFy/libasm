section .text

global ft_strcpy

ft_strcpy:
    mov rdx, rdi
    jmp .loop

.loop:
    mov al, [rsi]
    mov [rdi], al 

    cmp al, 0
    je .done

    inc rsi
    inc rdi
    jmp .loop

.done:
    mov rax, rdx
    ret
    

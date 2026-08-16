section .text

extern __errno_location

global ft_write

ft_write:
    mov rax, 1
    syscall
    cmp rax , 0
    jl .ernno
    ret


.ernno:
    neg rax
    push rax
    call __errno_location wrt ..plt
    pop r8
    mov [rax] , r8d
    mov rax, -1
    ret


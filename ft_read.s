; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_read.s                                          :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: franaivo <franaivo@student.42antananarivo  +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2026/08/17 21:55:14 by franaivo          #+#    #+#              ;
;    Updated: 2026/08/17 21:55:18 by franaivo         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section .text

extern __errno_location

global ft_read

ft_read:
    mov rax, 0
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


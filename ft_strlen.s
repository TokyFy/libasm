; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strlen.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: franaivo <franaivo@student.42antananarivo  +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2026/08/17 21:55:52 by franaivo          #+#    #+#              ;
;    Updated: 2026/08/17 21:55:55 by franaivo         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section .text

global ft_strlen

ft_strlen:
    xor eax, eax

.loop:
    cmp byte [rdi + rax] , 0
    je .done
    inc eax
    jmp .loop

.done:
        ret


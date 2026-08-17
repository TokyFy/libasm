; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcpy.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: franaivo <franaivo@student.42antananarivo  +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2026/08/17 21:55:38 by franaivo          #+#    #+#              ;
;    Updated: 2026/08/17 21:55:41 by franaivo         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

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
    

; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strdup.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: franaivo <franaivo@student.42antananarivo  +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2026/08/17 21:53:34 by franaivo          #+#    #+#              ;
;    Updated: 2026/08/17 21:55:47 by franaivo         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section .text

extern ft_strlen
extern malloc
extern ft_strcpy

global ft_strdup

ft_strdup:
    push rdi
    call ft_strlen wrt ..plt
    
    inc rax
    mov rdi, rax
    call malloc wrt ..plt

    cmp rax, 0
    je .error

    pop rsi
    mov rdi,rax
    
    call ft_strcpy wrt ..plt
    ret
    
.error :
    pop rdi
    ret
    

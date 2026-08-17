; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcmp.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: franaivo <franaivo@student.42antananarivo  +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2026/08/17 21:55:24 by franaivo          #+#    #+#              ;
;    Updated: 2026/08/17 21:55:32 by franaivo         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

section .text

global ft_strcmp

ft_strcmp:
    mov al, [rdi]
    mov cl, [rsi]
    cmp al, cl
    jne .done
    
    cmp al, 0
    je .done
    cmp cl,0
    je .done

    inc rdi
    inc rsi
    jmp ft_strcmp

.done:
    xor eax, eax
    mov al, [rdi]

    xor ecx , ecx
    mov cl, [rsi]

    sub eax, ecx
    ret


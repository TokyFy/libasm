/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: franaivo <franaivo@student.42antananarivo  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2026/08/17 22:22:34 by franaivo          #+#    #+#             */
/*   Updated: 2026/08/17 22:22:45 by franaivo         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBASM_H
#define LIBASM_H

#include <stdio.h>

extern "C" {

size_t  ft_strlen(const char *s);
ssize_t ft_write( int fd, const void *buf, size_t c);
int     ft_strcmp(const char *s1, const char *s2);
char    *ft_strcpy(char *dst, const char *src);
char    *ft_strdup(const char *s);

}

#endif

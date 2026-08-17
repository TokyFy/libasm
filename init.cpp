/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   init.cpp                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: franaivo <franaivo@student.42antananarivo  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2026/08/17 21:56:08 by franaivo          #+#    #+#             */
/*   Updated: 2026/08/17 21:56:11 by franaivo         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"
#include <iostream>

int main() {
    char src[12] = "";
    void *ptr = ft_strdup(src);

    std::cout <<  ptr << std::endl;
}



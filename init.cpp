#include "libasm.h"
#include <iostream>

int main() {
    char src[12] = "Hello world";
    char dst[15] = "";

    ft_strcpy(dst , src);
    std::cout << dst << std::endl;
}



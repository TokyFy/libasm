NAME = libasm.a

SRCS =	ft_strlen.s ft_write.s ft_strcmp.s ft_strcpy.s 

OBJS = $(SRCS:.s=.o)

CFLAGS = -Wall -Wextra -Werror

all: $(NAME)

$(NAME): $(OBJS) 
	ar rcs $(NAME) $(OBJS)

%.o: %.s
	nasm -f elf64 $< -o $@

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f a.out
	rm -f $(NAME)

test : init.cpp
	c++ init.cpp -L. -lasm 

s : asm.s
	nasm -f elf64 asm.s

re: fclean all

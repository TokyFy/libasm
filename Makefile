NAME = libasm.a

SRCS =	ft_strlen.s ft_write.s ft_strcmp.s ft_strcpy.s ft_strdup.s ft_read.s 

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

test : main.cpp
	c++ main.cpp -L. -lasm 

s : asm.s
	nasm -f elf64 asm.s

re: fclean all

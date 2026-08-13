NAME = libasm.a

SRCS =	ft_strlen.s 

OBJS = $(SRCS:.s=.o)

CFLAGS = -Wall -Wextra -Werror

all: $(NAME)

$(NAME): $(OBJS) 
	ar rcs $(NAME) $(OBJS)

%.o: %.s
	nasm -f elf64 $(CFLAGS) $< -o $@

clean:
	rm -f $(OBJS:)

fclean: clean
	rm -f $(NAME)

test : init.cpp
	c++ init.cpp -L. -lasm 

re: fclean all

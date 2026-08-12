NAME = libasm

SRCS =	main.c 

OBJS = $(SRCS:.c=.o)

CC = cc
CFLAGS = -Wall -Wextra -Werror

all: $(NAME)

$(NAME): $(OBJS) 
	$(CC) $(CFLAGS) $(OBJS) -o $(NAME)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS:)

fclean: clean
	rm -f $(NAME)

test : init.s
	nasm -g -felf64 init.s && ld init.o && ./a.out

re: fclean all

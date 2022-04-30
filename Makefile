# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tkomeno <tkomeno@student.42tokyo.jp>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/30 02:45:29 by tkomeno           #+#    #+#              #
#    Updated: 2022/04/30 05:02:31 by tkomeno          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a
CFLAGS = -Wall -Wextra -Werror
SRCS = ft_printf.c helpers.c
OBJS = $(SRCS:.c=.o)

EXE = main
DSYM = $(EXE).dSYM
DB = lldb
CC = gcc
RM = rm -rf
AR = ar -rc

all: $(NAME)

$(NAME): $(OBJS)
	$(AR) $(NAME) $(OBJS)

clean:
	$(RM) $(OBJS) $(B_OBJS)

fclean: clean
	$(RM) $(NAME)

re: fclean all

bclean: fclean
	$(RM) $(EXE) $(DSYM)

bre: bclean run

run: all
	@$(CC) $(EXE).c $(NAME) -o $(EXE)
	@./$(EXE)

db:
	@$(CC) -g $(EXE).c $(NAME) -o $(EXE)
	clear
	$(DB) $(EXE)

norm:
	@norminette -R CheckForbiddenSourceHeader $(SRCS)
	@norminette -R CheckDefine includes/*.h

.PHONY: all clean fclean re run db norm

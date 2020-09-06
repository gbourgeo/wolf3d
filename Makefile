#******************************************************************************#
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gbourgeo <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/04/01 03:10:34 by gbourgeo          #+#    #+#              #
#    Updated: 2020/09/06 18:46:15 by gbourgeo         ###   ########.fr        #
#                                                                              #
#******************************************************************************#

NAME	= wolf3d

SRC_D	= srcs/
SRC 	=				\
		main.c			\
		draw.c			\
		ft_end.c		\
		ft_free.c		\
		ft_raycast.c	\
		get_map.c		\
		get_next_line.c	\
		map_error.c		\
		move.c			\
		wolf.c			\

OBJ_D	= objs/

OBJ 	= $(addprefix $(OBJ_D), $(SRC:.c=.o))

LIBFT	= libft

INCLUDES= -Iincludes -I$(LIBFT)/includes -I/usr/local/include/

LIBS	=  -L$(LIBFT) -lft -L/usr/local/lib -lmlx -framework OpenGL -framework AppKit

CC		= gcc

CFLAGS 	= -Wall -Werror -Wextra

all: lib $(OBJ_D) $(NAME)

lib:
	@make -C $(LIBFT)

$(OBJ_D):
	@mkdir -p $@

$(NAME): $(OBJ)
	$(CC) -o $@ $^ -L $(LIBS)

$(OBJ_D)%.o: $(SRC_D)%.c
	$(CC) $(CFLAGS) -o $@ -c $^ $(INCLUDES)

clean:
	@make -C $(LIBFT) clean
	@/bin/rm -rf $(OBJ_D)

fclean: clean
	@make -C $(LIBFT) fclean
	@/bin/rm -f $(NAME)

re: fclean all

.PHONY: libft $(OBJ_D) clean fclean re

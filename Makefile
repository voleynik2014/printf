# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: voliynik <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/01/26 16:30:03 by voliynik          #+#    #+#              #
#    Updated: 2017/03/01 17:19:25 by voliynik         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a

SRC	=	ft_printf.c \
		  ft_type_di.c \
		  ft_type_s.c \
		  ft_put_uintmax.c \
		  ft_padding.c \
		  ft_type_ox.c \
		  ft_specifiers.c \
		  ft_specifiers2.c \
		  ft_padding_str.c \
		  ft_type_wchar.c \
		  ft_color.c \

SRCLIB	=ft_isascii.c	ft_memcpy.c	ft_strchr.c	ft_strlen.c	ft_strrchr.c \
		ft_atoi.c	ft_isdigit.c	ft_memccpy.c	ft_strcmp.c	ft_strncat.c	ft_strstr.c \
		ft_bzero.c	ft_isprint.c	ft_memmove.c	ft_strcpy.c	ft_strncmp.c	ft_tolower.c \
		ft_isalnum.c	ft_memchr.c	ft_memset.c	ft_strdup.c	ft_strncpy.c	ft_toupper.c \
		ft_isalpha.c	ft_memcmp.c	ft_strcat.c	ft_strlcat.c	ft_strnstr.c	ft_memalloc.c \
		ft_memdel.c		ft_strnew.c	ft_strdel.c	ft_strclr.c		ft_striter.c	ft_striteri.c \
		ft_strmap.c		ft_strmapi.c	ft_strequ.c		ft_strnequ.c	ft_strsub.c	ft_strjoin.c \
		ft_strtrim.c	ft_strsplit.c	ft_putnbr_fd.c	ft_itoa.c		ft_putchar.c	ft_putstr.c \
		ft_putendl.c	ft_putchar_fd.c	ft_putnbr.c		ft_putstr_fd.c	ft_putendl_fd.c	ft_lstnew.c\
		ft_lstdelone.c	ft_lstdel.c		ft_lstadd.c		ft_lstiter.c	ft_lstmap.c \
		ft_strndup.c		ft_itoa_base.c	ft_itoa_ll.c	ft_putnstr.c \
		ft_putwchar.c 

OBJ		= $(addprefix $(OBJDIR), $(SRC:.c=.o))
OBJ 	+= $(addprefix $(OBJDIR), $(SRCLIB:.c=.o))



CC		= gcc
CFLAGS  = -Wall -Wextra -Werror
RM 		= rm -f

LIBDIR  = ./libft/
SRCDIR	= ./src/
INCDIR	= ./includes/
OBJDIR	= ./obj/

all: obj $(NAME)

obj:
	mkdir -p $(OBJDIR)
	mkdir -p $(LIBDIR)

$(OBJDIR)%.o: $(SRCDIR)%.c
	$(CC)  $(CFLAGS)  -I $(INCDIR) -c $< -o $@ 

$(OBJDIR)%.o: $(LIBDIR)%.c 
	$(CC) $(CFLAGS) -I $(INCDIR) -c $< -o $@

$(NAME): $(OBJ) 
	ar -rcs $(NAME) $(OBJ) 

clean:
	rm -rf $(OBJDIR)

fclean: clean
	$(RM) $(NAME)

re: fclean all

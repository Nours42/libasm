# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sdestann <sdestann@student.42perpignan.    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/22 14:21:35 by sdestann          #+#    #+#              #
#    Updated: 2024/03/11 17:07:12 by sdestann         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

### MISC ###

NAME = libasm.a

SRCS_DIR = srcs/
SRCS =	ft_read.s				\
		ft_strcmp.s				\
		ft_strcpy.s				\
		ft_strdup.s				\
		ft_strlen.s				\
		ft_write.s
		
		

OBJDIR = objs/
SRCS_PATH = $(addprefix $(SRCS_DIR), $(SRCS))
OBJ_SRCS = $(addprefix $(OBJDIR), $(SRCS:.s=.o))

### COMPILATION ###

CFLAGS    = -v -Wall -Wextra -Werror -fPIE -pie
NASMFLAGS = -f elf64

NASM    = nasm
TEST	= test

Y = "\033[33m"
R = "\033[31m"
G = "\033[32m"
B = "\033[34m"
X = "\033[0m"
UP = "\033[A"
CUT = "\033[K"

### RULES ###

all: $(OBJDIR) ${NAME}

$(OBJDIR):
	@mkdir -p $(OBJDIR)

$(OBJDIR)%.o: $(SRCS_DIR)%.s
	@$(NASM) $(NASMFLAGS) $< -o $@

${NAME}: ${OBJ_SRCS}
	@echo $(G)Creating .o files$(X)
	@echo $(G)Linking .o files in libasm.a$(X)
	@ar rcs $(NAME) ${OBJ_SRCS}
	@echo $(G)Project LIBASM by SDESTANN successfully compiled${X}

test: all $(NAME)
	clang $(CFLAGS) $(SRCS_DIR)main.c -L. -lasm -o $(TEST)

clean:
	@echo ${R}Cleaning LIBASM ${G}[${OBJDIR}]...${X}
	@/bin/rm -Rf ${OBJDIR}

fclean: clean
	@echo ${R}FCleaning LIBASM ${G}[${NAME}]...${X}
	@/bin/rm -f ${NAME}

re: fclean all

.PHONY: all clean fclean re test

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sdestann <sdestann@student.42perpignan.    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/22 14:21:35 by sdestann          #+#    #+#              #
#    Updated: 2024/03/12 15:14:04 by sdestann         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

### MISC ###

NAME = libasm.a
TEST = test.out

SRCS_DIR = srcs
OBJS_DIR = objs
TEST_DIR = test

SRCS =	ft_read.s				\
		ft_strcmp.s				\
		ft_strcpy.s				\
		ft_strdup.s				\
		ft_strlen.s				\
		ft_write.s

OBJS		= $(patsubst %.s, ${OBJS_DIR}/%.o, ${SRCS})
TEST_SRCS	= $(foreach dir, $(TEST_DIR), $(wildcard $(dir)/*.c))
INCLUDES	= -I includes
ASM			= nasm
ASMFLAGS	= -f elf64

CC			= clang
CFLAGS    	= -Wall -Wextra -Werror -lasm -L.

RM			= /bin/rm -f

### RULES ###

all: $(NAME)

$(OBJS_DIR)/%.o : $(SRCS_DIR)/%.s
	@mkdir -p $(OBJS_DIR)
	@$(ASM) $(ASMFLAGS) $< -o $@

$(NAME): $(OBJS)
	@ar rcs $(NAME) $(OBJS)

.PHONY: test
test: $(NAME) $(TEST_SRCS)
	$(CC) $(TEST_SRCS) $(CFLAGS) $(INCLUDES) -o $(TEST)
	./$(TEST) < ./test/test.txt

clean:
	@$(RM) -rf $(OBJS) $(OBJS_DIR)

fclean: clean
	@echo $(R)FCleaning LIBASM $(G)[$(NAME)]...$(X)
	@$(RM) -f $(NAME) $(TEST)

re: fclean all

.PHONY: all clean fclean re test

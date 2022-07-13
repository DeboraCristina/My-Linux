bmake()
{
echo 'NAME		=

SRCS		=

OBJS		=	$(SRCS:%.c=%.o)

COMPILER	=	cc

FLAGS		=	-Wall	-Wextra	-Werror

REMOVE		=	rm -f

AR			=	ar -rc

MAKENOPRINT	=	make --no-print-directory

%.o:	%.c
	@$(COMPILER) $(FLAGS) -c $< -o $(<:%.c=%.o)

$(NAME):	$(OBJS)

all:	$(NAME)

clean:
	@$(REMOVE) $(OBJS)

fclean:	clean
	@$(REMOVE) $(NAME)

re:	fclean	all

.PHONY:	all	clean	fclean	re
' > Makefile
}

bmain()
{
echo'NAME		=

SRCS		=

OBJS		=	$(SRCS:%.c=%.o)

COMPILER	=	cc

FLAGS		=	-Wall	-Wextra	-Werror

REMOVE		=	rm -f

%.o:	%.c
	@$(COMPILER) $(FLAGS) -c $< -o $(<:%.c=%.o)

$(NAME):

all:	$(NAME)

clean:
	@$(REMOVE) $(OBJS)

fclean:	clean
	@$(REMOVE) $(NAME)

re:	fclean	all

.PHONY:	all	clean	fclean	re
' > Makefile
}

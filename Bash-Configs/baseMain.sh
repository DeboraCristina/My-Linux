bmain()
{
DIR=$1

if [ -z $DIR ]
then
	echo "Coloque um parametro"
	exit
fi

if [ -d $DIR ]
then
	echo "Criando Base main em $DIR"
else
	echo Não existe
	exit
fi

echo '#include <stdio.h>

int	main(void)
{
	printf("Hello, World!\\n");
	return (0);
}' > $DIR/main.c

echo	"Criada"
}

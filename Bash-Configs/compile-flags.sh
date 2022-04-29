clibft()
{
	erro=$(mktemp)
	local=libft
	erromessage="\033[1;91m\tError\033[0m"
	sucessmessage='\033[96mSucessfully compiled\033[0m'
	failmessage='\033[91m\tNot compiled\033[0m'

	if [ -z $1 ]
	then
		echo $erromessage
		return 1
	fi

	gcc -Wall -Werror -Wextra $1 -L$HOME/$local -lft 2>$erro
	declare -i tam
	tam=$(wc -c $erro | awk '{print $1}')
	out=$(cat $erro)

	if [ $tam -eq 0 ]
	then
		echo $sucessmessage
		./a.out ; rm a.out
	else
		echo $failmessage
		echo "\n$out"
	fi

	rm $erro
}
showcolor()
{
	help='
showcolor [OPTION]

Description: Show terminal colors.

-r	show regular color
-b	show bold color
-u	show underline color
-bg	show background color
-i	show high intensity color
-bi	show bold intensity color
-bgi	show background intensity color
	'

	if [ -z $1 ]
	then
		echo "Show with echo:		echo -e"
		echo -e "Base code color:	\\\033[\033[30mcode\033[0mm"
	fi

	if [ "$1" = "--help" -o "$1" = "-h" ]
	then
		echo "$help"
		return 0
	fi
	if [ "$1" = "-a" ]
	then
		showcolor -r
		showcolor -b
		showcolor -u
		showcolor -bg
		showcolor -i
		showcolor -bi
		showcolor -bgi
		return 0
	fi

	if [ "$1" = "-r" -o "$1" = "-b" -o "$1" = "-u" -o "$1" = "-bg" -o "$1" = "-i" -o "$1" = "-bi" -o "$1" = "-bgi" ]
	then
		echo -e "\\\033[0m	\033[0m	# Text Reset"

		if [ "$1" = "-r" ]
		then
			echo "Regular"
			echo -e "\033[30m	# Black		[30\033[0m"
			echo -e "\033[0;31m	# Red		[31\033[0m"
			echo -e "\033[0;32m	# Green		[32\033[0m"
			echo -e "\033[0;33m	# Yellow	[33\033[0m"
			echo -e "\033[0;34m	# Blue		[34\033[0m"
			echo -e "\033[0;35m	# Purple	[35\033[0m"
			echo -e "\033[0;36m	# Cyan		[36\033[0m"
			echo -e "\033[0;37m	# White		[37\033[0m"
		elif [ "$1" = "-b" ]
		then
			echo Bold
			echo -e "\033[1;30m	# Black		[1;30\033[0m"
			echo -e "\033[1;31m	# Red		[1;31\033[0m"
			echo -e "\033[1;32m	# Green		[1;32\033[0m"
			echo -e "\033[1;33m	# Yellow	[1;33\033[0m"
			echo -e "\033[1;34m	# Blue		[1;34\033[0m"
			echo -e "\033[1;35m	# Purple	[1;35\033[0m"
			echo -e "\033[1;36m	# Cyan		[1;36\033[0m"
			echo -e "\033[1;37m	# White		[1;37\033[0m"
		elif [ "$1" = "-u" ]
		then
			echo Underline
			echo -e "\033[4;30m	# Black		[4;30\033[0m"
			echo -e "\033[4;31m	# Red		[4;31\033[0m"
			echo -e "\033[4;32m	# Green		[4;32\033[0m"
			echo -e "\033[4;33m	# Yellow	[4;33\033[0m"
			echo -e "\033[4;34m	# Blue		[4;34\033[0m"
			echo -e "\033[4;35m	# Purple	[4;35\033[0m"
			echo -e "\033[4;36m	# Cyan		[4;36\033[0m"
			echo -e "\033[4;37m	# White		[4;37\033[0m"
		elif [ "$1" = "-bg" ]
		then
			echo Background
			echo -e "\033[40m	# Black		[40\033[0m"
			echo -e "\033[41m	# Red		[41\033[0m"
			echo -e "\033[42m	# Green		[42\033[0m"
			echo -e "\033[43m	# Yellow	[43\033[0m"
			echo -e "\033[44m	# Blue		[44\033[0m"
			echo -e "\033[45m	# Purple	[45\033[0m"
			echo -e "\033[46m	# Cyane		[46\033[0m"
			echo -e "\033[47m	# White		[47\033[0m"
		elif [ "$1" = "-i" ]
		then
			echo High Intensity
			echo -e "\033[0;90m	# Black		[90\033[0m"
			echo -e "\033[0;91m	# Red		[91\033[0m"
			echo -e "\033[0;92m	# Green		[92\033[0m"
			echo -e "\033[0;93m	# Yellow	[93\033[0m"
			echo -e "\033[0;94m	# Blue		[94\033[0m"
			echo -e "\033[0;95m	# Purple	[95\033[0m"
			echo -e "\033[0;96m	# Cyane		[96\033[0m"
			echo -e "\033[0;97m	# White		[97\033[0m"
		elif [ "$1" = "-bi" ]
		then
			echo Bold High Intensity
			echo -e "\033[1;90m	# Black		[1;90\033[0m"
			echo -e "\033[1;91m	# Red		[1;91\033[0m"
			echo -e "\033[1;92m	# Green		[1;92\033[0m"
			echo -e "\033[1;93m	# Yellow	[1;93\033[0m"
			echo -e "\033[1;94m	# Blue		[1;94\033[0m"
			echo -e "\033[1;95m	# Purple	[1;95\033[0m"
			echo -e "\033[1;96m	# Cyane		[1;96\033[0m"
			echo -e "\033[1;97m	# White		[1;97\033[0m"
		elif [ "$1" = "-bgi" ]
		then
			echo High Intensity Background
			echo -e "\033[0;100m	# Black		[100"
			echo -e "\033[0;101m	# Red		[101"
			echo -e "\033[0;102m	# Green		[102"
			echo -e "\033[0;103m	# Yellow	[103"
			echo -e "\033[0;104m	# Blue		[104"
			echo -e "\033[0;105m	# Purple	[105"
			echo -e "\033[0;106m	# Cyane		[106"
			echo -e "\033[0;107m	# White		[107"
		fi
	else
		echo "Argumento incorreto."
		echo "$help"
	fi
}

showcolor $1

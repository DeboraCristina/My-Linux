showcolor()
{
	help='
showcolor [OPTION]

Description: Show terminal colors.

-r	show regular color
-b	show bold color
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
			echo -e "\033[30m	# Black \33[0m"
			echo -e "\033[0;31m	# Red"
			echo -e "\033[0;32m	# Green"
			echo -e "\033[0;33m	# Yellow"
			echo -e "\033[0;34m	# Blue"
			echo -e "\033[0;35m	# Purple"
			echo -e "\033[0;36m	# Cyan"
			echo -e "\033[0;37m	# White"
		elif [ "$1" = "-b" ]
		then
			echo Bold
			echo -e "\033[1;30m	# Black"
			echo -e "\033[1;31m	# Red"
			echo -e "\033[1;32m	# Green"
			echo -e "\033[1;33m	# Yellow"
			echo -e -e "\033[1;34m	# Blue"
			echo -e "\033[1;35m	# Purple"
			echo -e "\033[1;36m	# Cyan"
			echo -e "\033[1;37m	# White"
		elif [ "$1" = "-u" ]
		then
			echo Underline
			echo -e "\033[4;30m	# Black"
			echo -e "\033[4;31m	# Red"
			echo -e "\033[4;32m	# Green"
			echo -e "\033[4;33m	# Yellow"
			echo -e "\033[4;34m	# Blue"
			echo -e "\033[4;35m	# Purple"
			echo -e "\033[4;36m	# Cyan"
			echo -e "\033[4;37m	# White"
		elif [ "$1" = "-bg" ]
		then
			echo Background
			echo -e "\033[40m	# Black"
			echo -e "\033[41m	# Red"
			echo -e "\033[42m	# Green"
			echo -e "\033[43m	# Yellow"
			echo -e "\033[44m	# Blue"
			echo -e "\033[45m	# Purple"
			echo -e "\033[46m	# Cyan"
			echo -e "\033[47m	# White"
		elif [ "$1" = "-i" ]
		then
			echo High Intensity
			echo -e "\033[0;90m	# Black"
			echo -e "\033[0;91m	# Red"
			echo -e "\033[0;92m	# Green"
			echo -e "\033[0;93m	# Yellow"
			echo -e "\033[0;94m	# Blue"
			echo -e "\033[0;95m	# Purple"
			echo -e "\033[0;96m	# Cyan"
			echo -e "\033[0;97m	# White"
		elif [ "$1" = "-bi" ]
		then
			echo Bold High Intensity
			echo -e "\033[1;90m	# Black"
			echo -e "\033[1;91m	# Red"
			echo -e "\033[1;92m	# Green"
			echo -e "\033[1;93m	# Yellow"
			echo -e "\033[1;94m	# Blue"
			echo -e "\033[1;95m	# Purple"
			echo -e "\033[1;96m	# Cyan"
			echo -e "\033[1;97m	# White"
		elif [ "$1" = "-bgi" ]
		then
			echo High Intensity Background
			echo -e "\033[0;100m	# Black"
			echo -e "\033[0;101m	# Red"
			echo -e "\033[0;102m	# Green"
			echo -e "\033[0;103m	# Yellow"
			echo -e "\033[0;104m	# Blue"
			echo -e "\033[0;105m	# Purple"
			echo -e "\033[0;106m	# Cyan"
			echo -e "\033[0;107m	# White"
		fi
	else
		echo "Argumento incorreto."
		echo "$help"
	fi
}

showcolor $1

# 	alias config
# Paste in your *.rc config 
# source ~/My-Linux/Bash-Configs/MyRcConfig.sh
# 
# 	zsh

########################################
#	Instal Bash Configs
########################################

var_zsh="y"
# read -p "Do you use zsh? (y/n) " var_zsh

yes="y"

config="bash"

SETRC()
{
	terminal=".$1rc"
	echo setando configurações em $terminal
}

if [ "$var_zsh" == "$yes" ]
then
	if [ $(dpkg -l | grep zsh | wc -l) -eq 0 ]
	then
		echo zsh not found
		echo install zsh
		sudo apt-get install zsh -y 2> temp
		sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	fi
	config="zsh"
fi

SETRC $config

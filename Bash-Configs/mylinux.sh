# -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_ #
#!/bin/bash

##################################################
#	Inicio
##################################################
clear ; ls
#chmod 777 *
myBashConfigsPath="$HOME/My-Linux/Bash-Configs"
myVimConfigsPath="$HOME/My-Linux/Vim-Configs"

##################################################
#	Shell Utilits
##################################################
source $myBashConfigsPath/chmod_help/chmod_help.sh	# chmodhelp
source $myBashConfigsPath/show-colors.sh			# showcolor
source $myBashConfigsPath/gitignore.sh				# gitignore
source $myBashConfigsPath/newGitRepository.sh		# newrepo

##################################################
#	Check for Dynamic Wallpaper
##################################################
source $myBashConfigsPath/check_dynamic_wallpaper.sh
if [[ "$V_DWALL" == "true" ]]
then
	alias dwall="bash $HOME/Dwall/set_wallpaper.sh"
fi

##################################################
#	tldr - help comands
##################################################
alias help="tldr $@"

##################################################
#	remove files
##################################################
alias rm="rm -i"

##################################################
#	Length strings
##################################################
length(){ python3 $myBashConfigsPath/len.py $@ }

##################################################
#	Atalhos curtos
##################################################
alias c=clear
alias cls="clear ; ls -p"
alias dls="cd ; clear ; ls -p"
alias py="python3"
alias b=bash
alias v=vim
alias z=zsh
alias ndi=mkdir
alias bat='batcat'
alias cbat="clear ; batcat"
alias ls="ls -p"
alias ..="cd .."

##################################################
#	Atalhos com sudo
##################################################
alias update="sudo apt update"
alias upgrate="sudo apt upgrate"
alias install="sudo apt install -y "
alias full-upgrade="sudo apt update && sudo apt upgrade -y && flatpak update -y"

##################################################
#	Editar Bashrc, Zshrc, Vimrc e Meus alias
##################################################
#editar meus alias
alias val='vim ~/My-Linux/Bash-Configs/mylinux.sh'
#editar bashrc
alias vbash='vim ~/.bashrc'
#editar zsh
alias vzsh='vim ~/.zshrc'
#editar vimrc
alias vvim='vim ~/My-Linux/Vim-Configs/MyVimConfig'
#acessar esse diretório
alias configlinux="cd ; cd My-Linux/Bash-Configs ; cls"

##################################################
#	Abreviacoes pro git
##################################################
alias gs="git status"
alias cgs="clear;git status"
alias gadd="git add"
alias commit="git commit -m"
alias glog="git log"
alias clone="git clone"

##################################################
#	Macros mais usadas Vim
##################################################
#abrir tudo ggVGzO
#abrit linha VzO
#fechar tudo ggVGzM€ýa

# -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_ #

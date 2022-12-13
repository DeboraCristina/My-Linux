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
source $myBashConfigsPath/chmod-help.sh
source $myBashConfigsPath/show-colors.sh
source $myBashConfigsPath/alias42saopaulo.sh
source $myBashConfigsPath/gitignore.sh
source $myBashConfigsPath/newGitRepository.sh

##################################################
#	Check for Dynamic Wallpaper
##################################################
source $myBashConfigsPath/check_dynamic_wallpaper.sh
if [[ "$V_DWALL" == "true" ]]
then
	alias dwall="bash $HOME/Dwall/set_wallpaper.sh"
fi

##################################################
#	Clang bases
##################################################
source $myBashConfigsPath/Clang-bases/baseMain.sh
source $myBashConfigsPath/Clang-bases/baseMakefile.sh

##################################################
#	remove files
##################################################
alias rm="rm -i"

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
alias ccat="clear ; cat "
alias ls="ls -p"
alias cd..="cd .."

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
alias ga="git add"
alias gc-m="git commit -m"
alias clone="git clone"
alias git-puxa="git pull"

##################################################
#	Macros mais usadas Vim
##################################################
#abrir tudo ggVGzO
#abrit linha VzO
#fechar tudo ggVGzM€ýa

# -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_ #

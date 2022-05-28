# -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_ #
#!/bin/bash

##################################################
#	Inicio
##################################################
clear ; ls -pm
#chmod 777 *

##################################################
#	Shell Utilits
##################################################
source ~/My-Linux/Bash-Configs/chmod-help
source ~/My-Linux/Bash-Configs/baseMain.sh
source ~/My-Linux/Bash-Configs/shell-calculator.sh
source ~/My-Linux/Bash-Configs/compile-flags.sh

##################################################
#	Atalhos curtos
##################################################
alias c=clear
alias cls="clear ; ls -mp"
alias dls="cd ; clear ; ls -mp"
alias py="python3"
alias b=bash
alias v=vim
alias z=zsh
alias ndi=mkdir
alias ccat="clear ; cat "

##################################################
#	Editar Bashrc, Zshrc, Vimrc e Meus alias
##################################################
#editar meus alias
alias val='vim ~/My-Linux/Bash-Configs/MyRcConfig.sh'
#editar bashrc
alias vbash='vim ~/.bashrc'
#editar zsh
alias vzsh='vim ~/.zshrc'
#editar vimrc
alias vvim='vim ~/My-Linux/Vim-Configs/MyVimConfig'

##################################################
#	Abreviacoes pro git
##################################################
alias gs="git status"
alias cgs="clear;git status"
alias ga="git add"
alias gc-m="git commit -m"
alias clone="git clone"
alias git-manda="git push"
alias git-puxa="git pull"

##################################################
#	Coding in C
##################################################
alias rc="cc -Wall -Wextra -Werror" #rodar .c
alias tc="./a.out ; rm a.out" #testar codigo
alias norm="norminette -R CheckForbiddenSourceHeader"

##################################################
#	Atalhos de compilação C
##################################################

##################################################
#	Macros mais usadas Vim
##################################################
#abrir tudo ggVGzO
#fechar tudo ggVGzM€ýa

# -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_ #

# -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_ #
#!/bin/bash

##################################################
#	Temporario p/ libft
##################################################
alias libft="cd ; cd 42curso/Libft/ ; c"
alias projeto="cd ; cd 42curso/Libft/Projeto ; c"
alias testes="cd ; cd 42curso/Libft/Testes ; c"

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

##################################################
#	Atalhos curtos
##################################################
alias c=clear
alias cls="clear ; ls"
alias py="python3"
alias b=bash
alias v=vim
alias z=zsh
alias ndi=mkdir

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
alias vvim='vim ~/My-Linux/Bash-Configs/MyVimConfig'

##################################################
#	Abreviacoes pro git
##################################################
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias clone="git clone"
alias git-manda="git push"
alias git-puxa="git pull"

##################################################
#	Coding in C
##################################################
alias rc="gcc -Wall -Wextra -Werror" #rodar .c
alias tc="./a.out ; rm a.out" #testar codigo
alias norm="norminette -R CheckForbiddenSourceHeader"

##################################################
#	Atalhos de compilação C
##################################################
vmain()
{
    if [ -z $1 -o -z $2 ]
    then
        echo "vmain 1 0 - editar c01 e ex00"
    else
        if [ $2 -ge 10 ]
        then
            vim $(find c0$1/ex$2 -name '*.c') 
        else
            vim $(find c0$1/ex0$2 -name '*.c') 
        fi
    fi
}

roda()
{
    # local=$(find $1 -type f -name *.c -exec basename -s .sh {} \;)
    #local=$(find $1 -name '*.c')
    local=$1
    
    c ; gcc -Wall -Werror -Wextra -lbsd $local ; echo ; echo "--- Execucao ---" ; tc ; echo ; echo "----FIM----"
}

##################################################
#	Macros mais usadas Vim
##################################################
#abrir tudo ggVGzO
#fechar tudo ggVGzM€ýa

# -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_ #

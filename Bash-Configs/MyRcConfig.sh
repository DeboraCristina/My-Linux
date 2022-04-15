# -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_ #
#!/bin/bash

##################################################
#    Inicio
##################################################
clear ; ls -pm
chmod 777 *

##################################################
#   Shell Utilits
##################################################
source ~/.shell_utilits/chmod-help
source ~/.shell_utilits/baseMain.sh

##################################################
#    Atalhos curtos
##################################################
#alias c="clear ; echo Ola, Mundo!"
alias c=clear
alias py="python3"
alias b=bash
alias v=vim
alias z=zsh
alias ndi=mkdir

##################################################
#    Editar Bashrc, Zshrc, Vimrc e Meus alias
##################################################
#editar meus alias
alias val='vim ~/meusalias.sh'
#editar bashrc
alias vbash='vim ~/.bashrc'
#editar zsh
alias vzsh='vim ~/.zshrc'
#editar vimrc
alias vvim='vim ~/.vimrc'

##################################################
#    Abreviacoes pro git
##################################################
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias clone="git clone"

##################################################
#    Coding in C
##################################################
alias rc="gcc -Wall -Wextra -Werror" #rodar .c
alias tc="./a.out ; rm a.out" #testar codigo
alias norm="norminette -R CheckForbiddenSourceHeader"

##################################################
#    Atalhos de compilação C
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
#    Macros mais usadas Vim
##################################################
#abrir tudo ggVGzO
#fechar tudo ggVGzM€ýa

# -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_ #

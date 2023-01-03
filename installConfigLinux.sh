### Variaveis Gerais ###

gerenciadorPacotes="apt-get"
sys="debian"
flag=" -y "

######

cd $HOME

### Instalacoes gerais ###
sudo $gerenciadorPacotes $flag install git
sudo $gerenciadorPacotes $flag install vim
sudo $gerenciadorPacotes $flag install zsh
sudo $gerenciadorPacotes update
######

### Python ###
	# tkinter Python
if [[ $sys == "arch" ]]
then
	tkinter="tk"
fi
if [[ $sys == "debian" ]]
then
	tkinter="python-tk"
fi
sudo $gerenciadorPacotes $flag install $tkinter
	# Libs
pip install PySimpleGUI
######

### GIT ###
# Gerar Chave ssh
ssh-keygen -t rsa -b 4096 -C "deboracristinaproficional1@gmail.com"
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa

ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts

cat ~/.ssh/id_rsa.pub >> .Chave.txt
git config --global user.email "deboracristinaproficional1@gmail.com"
git config --global user.name "DeboraCristina"

######

### ZSH ###
# OhMyZSH
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

######

### VIM ###

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "let \$config = '~/My-Linux/Vim-Configs/MyVimConfig'
source \$config" > .vimrc

######

# pos github configurado
while :
do
	echo -ne "\033[1;95mA chave ssh já está configurada no git hub? [s/n]: \033[0m"
	read gitconfigurado
	if [ "$gitconfigurado" == "s" ]
	then
		git clone git@github.com:DeboraCristina/My-Linux.git
		git clone https://gist.github.com/da9a5f6d6c402e05617d897825cfcec1.git zsh
        if [ -d "$HOME/zsh" ]
        then
            mv zsh/zshrc ~/.zshrc
		    rm -fr zsh
            break
        else
            echo -e "\033[1;91mAlgo deu errado!\nTerminal nao configurado!"
        fi
	else
		if [ "$gitconfigurado" == "n" ]
		then
			echo adicione a chave ssh ao git hub para que configurações sejam instaladas completamente
		else
			echo opcao invalida
		fi
	fi
done

######


### Variaveis Gerais ###

gerenciadorPacotes="pamac"
sys="arch"
######

### Instalacoes gerais ###
sudo $gerenciadorPacotes install git
sudo $gerenciadorPacotes install vim
sudo $gerenciadorPacotes install zsh
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
sudo $gerenciadorPacotes install $tkinter
	# Libs
pip install PySimpleGUI
######

### GIT ###
# Gerar Chave ssh
ssh-keygen -t rsa -b 4096 -C "deboracristinaproficional1@gmail.com"
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa

cat ~/.ssh/id_rsa.pub >> .Chave.txt

# pos github configurado
git clone git@github.com:DeboraCristina/My-Linux.git
######

### ZSH ###
# OhMyZSH
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://gist.github.com/da9a5f6d6c402e05617d897825cfcec1.git My-Linux/zsh
mv My-Linux/zsh/zshrc My-Linux/

mv My-Linux/zshrc ~/.zshrc

######

### VIM ###

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "let $config = '~/My-Linux/Vim-Configs/MyVimConfig'
source $config
:PluginInstall" > .vimrc

######

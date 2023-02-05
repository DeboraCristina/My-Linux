# ********************************************* #
# DEFINIÇÕES
local_de_arquivos="$HOME/My-Linux/install_files"
source "$local_de_arquivos/variaveis_gerais.sh"


# IMPORTAÇÕES
source "$local_de_arquivos/cores.sh"
source "$local_de_arquivos/instalar_programas_basicos.sh"
source "$local_de_arquivos/configurar_python.sh"
source "$local_de_arquivos/configurar_git.sh"
source "$local_de_arquivos/gerar_chave_ssh.sh"
source "$local_de_arquivos/checar_chave_github.sh"
source "$local_de_arquivos/configurar_vim.sh"
source "$local_de_arquivos/configurar_zsh.sh"


# INSTALANDO
cd $HOME

configurar_git
configurar_python
gerar_chave_ssh
instalar_programas_basicos
checar_chave_github

if [ "$chave_adicionada" == "true" ]
then
	git clone git@github.com:DeboraCristina/My-Linux.git
	configurar_zsh
	configurar_vim
fi
######

# ********************************************* #
# DEFINIÇÕES
MediBangLink="https://medibangpaint.com/static/installer/MediBangPaintPro/MediBangPaintProSetup-28.4-32bit.exe"
local_de_arquivos="$HOME/My-Linux/install_files"
source "$local_de_arquivos/variaveis_gerais.sh"


# IMPORTAÇÕES
source "$local_de_arquivos/cores.sh"
source "$local_de_arquivos/instalar_programas.sh"
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
instalar_programas
checar_chave_github

firefox $MediBangLink

if [ "$chave_adicionada" == "true" ]
then
	git clone git@github.com:DeboraCristina/My-Linux.git
	configurar_zsh
	configurar_vim
fi
######

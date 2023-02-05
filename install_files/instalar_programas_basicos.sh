instalar_programas_basicos()
{
	sudo $gerenciadorPacotes $flag install git
	sudo $gerenciadorPacotes $flag install vim
	sudo $gerenciadorPacotes $flag install zsh
	sudo $gerenciadorPacotes $flag install tldr # substitue a flag --help
	sudo $gerenciadorPacotes $flag install bat # substitue cat
	sudo $gerenciadorPacotes update
}

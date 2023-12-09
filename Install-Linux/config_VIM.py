import os


def config_vim():
    link_vundle = 'https://github.com/VundleVim/Vundle.vim.git'
    vim_file = '$HOME/My-Linux/Vim-Configs/MyVimConfig'
    os.system(f'git clone {link_vundle} ~/.vim/bundle/Vundle.vim')
    os.system(f"""echo \"let \$config = '{vim_file}'
source \$config\" >> .vimrc""")

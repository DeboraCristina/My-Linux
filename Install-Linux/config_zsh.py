import os


def config_zsh():
    link_oh_my_zsh = 'https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh'
    config_path = '$HOME/My-Linux/zshrc'
    os.system(f'sh -c "$(curl -fsSL {link_oh_my_zsh})"')
    os.system(f'mv {config_path} ~/.zshrc')

import os


def __is_ssh_installed() -> bool:
    with os.popen('apt list | grep ^openssh') as cmd:
        cmd_exit = cmd.read()
    if 'openssh-client' in cmd_exit:
        return True
    return False


def __install_ssh() -> bool:
    result = os.system('sudo apt install openssh-client -y')
    if result == 0:
        return True
    return False


def check_github_connection() -> bool:
    result = os.system('git clone git@github.com:DeboraCristina/Libft.git /tmp/testeSSH')
    if result == 0:
        os.system('rm -rf /tmp/testeSSH')
        return True
    return False


def check_ssh_is_installed() -> None:
    ssh_installed = __is_ssh_installed()

    if not ssh_installed:
        if not __install_ssh():
            os.system('echo \"ssh not installed\">> /tmp/install_linux_except')


def generate_ssh_key(email):
    os.system(f'ssh-keygen -t rsa -b 4096 -C "{email}"')
    os.system('''eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa
ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
cat ~/.ssh/id_rsa.pub >>		"~/.SSHKEY"''')


def __install(package: str):
    os.system(f'sudo apt install -y {package}')


def __install_flatpack(name_package: str):
    os.system(f'flatpak install -y flathub {name_package}')


def get_debian_basic_packages():
    basic_packages = [
        'git',
        'vim',
        'zsh',
        'manpages',
        'man-db',
    ]
    return basic_packages


def get_debian_other_packages():
    packages = [
        'bat',
        'tree',
        'megasync',
        'tldr',
        'flatpak',
    ]
    return packages


def get_flatpack_packages():
    flatpack = [
        'md.obsidian.Obsidian',
        'org.flameshot.Flameshot',
        'com.jetbrains.PyCharm-Community',
        'com.jetbrains.IntelliJ-IDEA-Community',
        'com.visualstudio.code',
        'com.dropbox.Client',
        'org.onlyoffice.desktopeditors',
        'com.usebottles.bottles',
    ]
    return flatpack


def install_programs(debian_packages: list, flatpack_packages: list = ()):
    if len(debian_packages) > 0:
        for package in debian_packages:
            __install(package)
    if len(flatpack_packages) > 0:
        for package in flatpack_packages:
            __install_flatpack(package)


def config_git(email, user_name):
    os.system(f'git config --global user.email "{email}"')
    os.system(f'git config --global user.name	"{user_name}"')


def config_python():
    os.system('sudo apt install -y python3.11')
    os.system('sudo apt install -y python3-pip')
    os.system('sudo apt install -y python-tk')
    os.system('pip install PySimpleGUI')


def config_zsh():
    link_oh_my_zsh = 'https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh'
    config_path = '$HOME/My-Linux/zshrc'
    os.system(f'sh -c "$(curl -fsSL {link_oh_my_zsh})"')
    os.system(f'mv {config_path} ~/.zshrc')


def config_vim():
    link_vundle = 'https://github.com/VundleVim/Vundle.vim.git'
    vim_file = '$HOME/My-Linux/Vim-Configs/MyVimConfig'
    os.system(f'git clone {link_vundle} ~/.vim/bundle/Vundle.vim')
    os.system(f"""echo \"let \$config = '{vim_file}'
source \$config\" >> .vimrc""")


def full_install():
    git_email = ''
    git_user_name = ''
    debian_packages = get_debian_basic_packages()
    flatpack_packages = get_flatpack_packages()

    debian_packages += get_debian_other_packages()

    install_programs(debian_packages, flatpack_packages)
    os.system('sudo apt update')

    config_python()
    check_ssh_is_installed()
    config_git(git_email, git_user_name)
    generate_ssh_key(git_email)
    while True:
        input('waiting github connection... [press any key if connect]')
        connection = check_github_connection()
        if connection:
            break
        else:
            print('\033[1;91mcant connect. Try again!\nMake sure that key is on github settings\033[0m')
    os.system('git clone git@github.com:DeboraCristina/My-Linux.git')
    config_vim()
    config_zsh()
    os.system('sudo apt update')
    os.system('sudo apt full-upgrade')


def basic_install():
    git_email = ''
    git_user_name = ''
    debian_packages = get_debian_basic_packages()

    install_programs(debian_packages)

    config_git(git_email, git_user_name)
    generate_ssh_key(git_email)


def install():
    while True:
        is_basic = input("Fazer instalacao basica? [s/n]: ").lower()
        if is_basic == 's' or is_basic == 'n':
            break
    if is_basic == 's':
        basic_install()
    else:
        full_install()

    with open('', 'r') as fd:
        except_file = fd.read()
    while True:
        print('''* 0 * exit *
* 1 * read exception file *''')
        op = input('choose: ')
        if op == '0':
            break
        if op == '1':
            print(except_file)


if __name__ == '__main__':
    install()

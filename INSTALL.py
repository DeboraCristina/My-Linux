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


def check_ssh_is_installed(except_file) -> None:
    ssh_installed = __is_ssh_installed()

    if not ssh_installed:
        if not __install_ssh():
            os.system(f'echo \"ssh not installed\">> {except_file}')


def generate_ssh_key(email):
    os.system(f'ssh-keygen -t rsa -b 4096 -C "{email}"')
    os.system('''eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa
ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
cat ~/.ssh/id_rsa.pub >> $HOME/.SSHKEY''')


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


def full_install(except_file, git_email, git_user_name):
    debian_packages = get_debian_basic_packages()
    flatpack_packages = get_flatpack_packages()

    debian_packages += get_debian_other_packages()

    install_programs(debian_packages, flatpack_packages)
    os.system('sudo apt update')

    config_python()
    check_ssh_is_installed(except_file)
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


def basic_install(git_email, git_user_name):
    debian_packages = get_debian_basic_packages()

    install_programs(debian_packages)

    config_git(git_email, git_user_name)
    generate_ssh_key(git_email)


def clear() -> None:
    os.system('clear')


def show_except_file(except_file) -> bool:
    result = os.system(f'test -e {except_file}')
    if result == 0: # existe
        with open(except_file, 'r') as fd:
            print(fd.read())
    return (result == 0)


def install(except_file, options, git_email, git_user_name) -> None:
    while True:
        clear()
        
        i = 1
        for option in options:
            print(f'{i} - {option}')
            i += 1
        print('e - Exit')

        op = input('Choose: ')
        if op == '1':
            print('You choosed \033[1;97mBasic Installation\033[0m!')
            input()
            basic_install(git_email, git_user_name)
            print("Basic Installation Fineshed")
            show_except_file(except_file)
            input()
        elif op == '2':
            print('You choosed \033[1;97mFull Installation\033[0m!')
            input()
            full_install(except_file, git_email, git_user_name)
            print("Basic Installation Fineshed")
            input()
        elif op == '3':
            print('You choosed \033[1;97mCustom Installation\033[0m!')
            print('This function has not been implemented')
            # input()
            # TODO: Function
            print("Custom Installation Fineshed")
            input()
        elif op == '4':
            clear()
            print('Basic Packages:')
            packages = get_debian_basic_packages()
            for p in packages:
                print(p)
            input()
        elif op == '5':
            clear()
            print('Other Packages:')
            packages = get_debian_other_packages()
            for p in packages:
                print(p)
            input()
        elif op == '6':
            clear()
            print('Flatpack Packages:')
            packages = get_flatpack_packages()
            for p in packages:
                print(p)
            input()
        elif op == '7':
            except_file_exists = show_except_file(except_file)
            if not except_file_exists:
                print('Except File not exists')
            input()
        elif op == '8':
            generate_ssh_key(git_email)
        elif op.lower() == 'e':
            break
        else:
            print('Opcão inválida')
            input()


def main():
    git_email = 'deboracristinaproficional1@gmail.com'
    git_user_name = 'DeboraCristina'
    except_file = '/tmp/install_linux_except'
    options = [
        'Basic Installation',
        'Full Installation',
        'Custom Installation',
        'Show Basic Packages',
        'Show Other Packages',
        'Show Flatpack Packages',
        'Show Exception File',
        'Generate SHH Key',
    ]
    clear()
    install(except_file, options, git_email, git_user_name)


if __name__ == "__main__":
    main()

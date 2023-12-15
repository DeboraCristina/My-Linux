import os


def clear() -> None:
    os.system('clear')


# Custom Installation
def show_packages(packages: list, chosen: list) -> None:
    clear()
    len_packages = len(packages)
    for index in range(len_packages):
        char = '*' if len(chosen) > 0 and index in chosen else ' '
        print(f'{index + 1}. [{char}] {packages[index]}')


def choose(packages_list: list) -> list:
    chosen = []
    while True:
        show_packages(packages_list, chosen)

        print('\n* Choose packages (ex: \'1,2,4\' or \'1-4\' or \'a to all\')')
        print('* [Select the same package to deselect it]')
        print('* Type \'e\' to end selection\n')
        op = input('Choose: ')
        if op.lower() == 'e':
            break
        elif op.lower() == 'a':
            len_pack = len(packages_list)
            for i in range(len_pack):
                if i not in chosen:
                    chosen.append(i)
                else:
                    chosen.remove(i)
        elif op.replace(' ', '').replace('-', '').replace(',', '').isnumeric():
            op = op.replace(' ', '')
            if '-' in op and op.count('-') == 1:
                packages_index = op.split('-')

                start = int(packages_index[0]) - 1
                end = int(packages_index[1])
                for index in range(start, end):
                    index = int(index)
                    if index not in chosen:
                        chosen.append(index)
                    else:
                        chosen.remove(index)
            elif ',' in op:
                packages_index = op.split(',')

                for index in packages_index:
                    index = int(index)-1
                    if index not in chosen:
                        chosen.append(index)
                    else:
                        chosen.remove(index)
            else:
                index = int(op)-1
                if index not in chosen:
                    chosen.append(index)
                else:
                    chosen.remove(index)
        else:
            print('invalid option')
    result = []
    len_pack = len(packages_list)
    for i in chosen:
        result.append(packages_list[i])
    return result


def choose_packages(all_packages: list) -> list:
    if len(all_packages) <= 0:
        raise Exception('Empty List')

    for p in all_packages:
        if type(p) is not list:
            raise Exception('Invalid list package')

    chosen_packages = []
    for packages in all_packages:
        chosen_packages.append(choose(packages))

    return chosen_packages


def install_selected_packages(all_packages: list, installer: callable) -> None:
    for package_list in all_packages:
        for p in package_list:
            installer(p)

# Custom Installation


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


def install_deb(package: str):
    command = 'sudo apt install -y'
    os.system(f'{command} {package}')


def install_flatpack(name_package: str):
    command = 'flatpak install -y flathub'
    os.system(f'{command} {name_package}')


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
        'virtualbox',
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
        'org.gnome.Boxes',
    ]
    return flatpack


def install_programs(debian_packages: list, flatpack_packages: list = ()):
    if len(debian_packages) > 0:
        for package in debian_packages:
            install_deb(package)
    if len(flatpack_packages) > 0:
        for package in flatpack_packages:
            install_flatpack(package)


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


def custom_isntall(except_file, git_email, git_user_name):
    basic_debian_packages = get_debian_basic_packages()
    other_debian_packages = get_debian_other_packages()
    flatpack_packages = get_flatpack_packages()

    selected_debian_packages = choose_packages(
        [basic_debian_packages, other_debian_packages])
    selected_flatpack_packages = choose_packages([flatpack_packages])

    install_selected_packages(selected_debian_packages, install_deb)
    install_selected_packages(selected_flatpack_packages, install_flatpack)

    os.system('sudo apt update')

    while True:
        op = input('\033[1;92mContinue Custom Installation?\033[0m [s/n]')
        if op.lower == 's':
            break
        elif op.lower() == 'n':
            return

    config_python()
    check_ssh_is_installed(except_file)
    config_git(git_email, git_user_name)
    generate_ssh_key(git_email)

    while True:
        op = input('Connect on GitHub? [s/n] ')

        if op.lower == 's':
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
        elif op.lower() == 'n':
            break
    
    os.system('sudo apt update')
    os.system('sudo apt full-upgrade')
    pass


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
            print("\n\n\033[1;97mBasic Installation Fineshed\033[0m")
            show_except_file(except_file)
            input()
        elif op == '2':
            print('You choosed \033[1;97mFull Installation\033[0m!')
            input()
            full_install(except_file, git_email, git_user_name)
            print("\n\n\033[1;97mFull Installation Fineshed\033[0m")
            input()
        elif op == '3':
            print('You choosed \033[1;97mCustom Installation\033[0m!')
            input()
            custom_isntall(except_file, git_email, git_user_name)
            print("\n\n\033[1;97mCustom Installation Fineshed\033[0m")
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

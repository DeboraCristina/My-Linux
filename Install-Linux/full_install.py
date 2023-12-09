from ssh import *
from config_git import *
from config_python import *
from config_VIM import *
from config_zsh import *
from install_programs import *


def install():
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


if __name__ == '__main__':
    install()

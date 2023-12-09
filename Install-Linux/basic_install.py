from ssh import *
from config_git import *
from install_programs import *


def install():
    git_email = ''
    git_user_name = ''
    debian_packages = get_debian_basic_packages()

    install_programs(debian_packages)

    config_git(git_email, git_user_name)
    generate_ssh_key(git_email)


if __name__ == '__main__':
    install()

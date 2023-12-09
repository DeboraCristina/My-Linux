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

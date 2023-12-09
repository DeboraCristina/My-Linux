import os


def config_git(email, user_name):
    os.system(f'git config --global user.email "{email}"')
    os.system(f'git config --global user.name	"{user_name}"')

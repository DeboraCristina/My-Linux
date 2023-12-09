import os


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

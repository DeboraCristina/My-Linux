source ~/My-Linux/Bash-Configs/mylinux.sh

export ZSH="$HOME/.oh-my-zsh"

# THEME
# ➜  ~
# caminho curto
# ZSH_THEME="robbyrussell"

# ☁  ~
# caminho curto
 ZSH_THEME="cloud"

# ╭─debby at LinuxMint in ~
# ╰─○
# caminho longo
# ZSH_THEME="fino"

plugins=(git)

source $ZSH/oh-my-zsh.sh

### corrigindo wallpaper tilix ###
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

##############################

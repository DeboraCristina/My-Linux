#// Essenciais para interface gráfica //#
apt --no-install-recommends install -y xserver-xorg-core
apt --no-install-recommends install -y xserver-xorg-video-fbdev
apt --no-install-recommends install -y xserver-xorg
apt --no-install-recommends install -y x11-xserver-utils

#// XFCE Mínimo //#

apt --no-install-recommends install -y xfwm4                    # gestor de janelas
apt --no-install-recommends install -y xfce4-panel              # Painel do XFCE...
apt --no-install-recommends install -y xfce4-power-manager      # gestor de enregia - para notebook
apt --no-install-recommends install -y xfce4-notifyd            # visualizador de Notificações
apt --no-install-recommends install -y xfce4-pulseaudio-plugin  # Controlador do pulseaudio
apt --no-install-recommends install -y xfce4-battery-plugin     # Monitor de bateria
apt --no-install-recommends install -y xfce4-terminal           # emulador de terminal
apt --no-install-recommends install -y xfce4-datetime-plugin    # extensão de data e hora pro painel do xfce4

#// Config de audio //#
apt --no-install-recommends -y install pulseaudio
apt install -y libav-tools gstreamer1.0-libav
apt-get install -y gstreamer1.0-plugins-good
apt-get install -y gstreamer1.0-plugins-bad
apt-get install -y gstreamer1.0-plugins-ugly
apt-get install -y gstreamer1.0-nice

#// Extra, porém necessário //#

apt --no-install-recommends -y install system-config-printer        # interface pra configurar impressora
apt --no-install-recommends -y install cups                         # driver genérico pra impressora

apt install -y firefox-esr                                   # firefox
apt install -y firefox-esr-l10n-pt-br                        # pacote de idiomas pt-br firefox


apt update
apt full-upgrade

reboot -h now


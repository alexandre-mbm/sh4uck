#!/bin/bash
#
# Inicialmente este programa executará tarefas separamente. Exemplo:
#
#   $ sh4suck server      # instala software e configurações de rede
#

if [ "$(id -u)" != "0" ]; then
   echo "erro: este script deve ser executado como root" 1>&2
   echo "      tente novamente usando o sudo" 1>&2
   exit 1
fi

function inexistent() {
    echo "alvo \"$1\" não implementado"
}

# server

function install_x2go() {
    apt-get install python-software-properties  # 12.04
    add-apt-repository ppa:x2go/stable
    apt-get update
    apt-get install x2goserver x2goserver-xsession
    apt-get install x2goclient
}

function install_ssh() {
    apt-get install openssh-server
    apt-get install openssh-client
}

# office

function install_libreoffice() {
    add-apt-repository ppa:libreoffice/libreoffice-5-0
    apt-get update
    apt-get dist-upgrade
    apt-get install libreoffice-style-breeze  # tema de ícones
}

function install_gimp() {
    apt-get install gimp
}

function install_inkscape() {
    apt-get install inkscape
}

case "$1" in
    internet)
        # TODO: Firefox 28 com atalho e xpi de tradução para português
        # TODO: Java 6.31 e criar link simbólico na pasta do firefox
        # TODO: Default proxy settings firefox
        # TODO: Extensões para todos usuários (tradução firefox para pt-BR)
        # TODO: Proxy firefox para todos os usuários
        # TODO: Google Chrome
        inexistent "internet"
        ;;
    server) 
        install_x2go
        install_ssh
        # TODO: Scripts de rede
        # TODO: ocsinventoryagent
        # TODO: likewiseopen-5
        # TODO: Cliente Owncloud
        inexistent "server"
        ;;
    xorg)
        # TODO: MyUnity
        # TODO: Configurações padronizadas de ícones do unity
        # TODO: Temas
        # TODO: Adicionar papéis de parede
        # TODO: xfce4
        inexistent "xorg"
        ;;
    office)
        install_libreoffice
        install_inkscape
        install_gimp
        ;;  
    hardware) 
        # TODO: Adicionar todas as impressoras do esquadrão
        # TODO: Driver da impressora Samsung 3310
        inexistent "hardware"
        ;;
    virtual)
        # TODO: Virtualbox
        # TODO: Wine
        inexistent "virtual"
        ;;
    boot)
        # TODO: grub-customizer ‒ instalar
        # TODO: grub-customizer ‒ configurar
        # TODO: boot-repair
        inexistent "boot"
        ;;
    apt)
        # TODO: apt.conf
        # TODO: Gerenciador de pacotes Synaptics
        inexistent "apt"
        ;;
    cron)
        # TODO: Desligamento automático às 19h
        inexistent "cron"
        ;;
    fix)
        # TODO: Resolver o problema da build da UCK não poder retomar a customização
        inexistent "fix"
        ;;
    *)
        # Ajuda
        echo "alvos possíveis: internet server xorg office* hardware virtual boot apt cron fix"
        ;;
esac


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

source dist/vars.sh

mkdir download

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
    apt-get remove --purge libreoffice*
    apt-get clean
    apt-get autoremove
    wget -c $OFFICE_DIR/$OFFICE_PACKPACK -P download
    wget -c $OFFICE_DIR/$OFFICE_HELPPACK -P download
    wget -c $OFFICE_DIR/$OFFICE_LANGPACK -P download
    tar -xzvf download/$OFFICE_PACKPACK -C download
    tar -xzvf download/$OFFICE_HELPPACK -C download
    tar -xzvf download/$OFFICE_LANGPACK -C download
    PACK_DIR=$(tar -tf download/$OFFICE_PACKPACK | cut -d"/" -f1 | head -n 1)
    HELP_DIR=$(tar -tf download/$OFFICE_HELPPACK | cut -d"/" -f1 | head -n 1)
    LANG_DIR=$(tar -tf download/$OFFICE_LANGPACK | cut -d"/" -f1 | head -n 1)
    dpkg -i download/$PACK_DIR/DEBS/*
    dpkg -i download/$HELP_DIR/DEBS/*
    dpkg -i download/$LANG_DIR/DEBS/*
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


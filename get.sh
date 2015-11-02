#!/bin/bash

cd ~/
mkdir /tmp/sh4uck
wget -c https://github.com/alexandre-mbm/sh4uck/archive/master.tar.gz -P /tmp/sh4uck
tar -xzvf /tmp/sh4uck/master.tar.gz 
mv sh4uck-master sh4uck
cd sh4uck/
#export PATH=$PATH:$(pwd)

echo "Você instalou "$(pwd)
echo "Estando neste diretório, pode comandar \"sudo ./sh4uck\""

#!/bin/bash

cd ~/
mkdir /tmp/sh4uck
wget -c https://github.com/alexandre-mbm/sh4uck/archive/master.tar.gz -P /tmp/sh4uck -q
tar -xzf /tmp/sh4uck/master.tar.gz

mkdir sh4uck-backup
mv sh4uck sh4uck-backup/$(date +%Y-%m-%d.%Hh%Mm%Ss)
mv sh4uck-master sh4uck
cd sh4uck/

echo
echo "Parabéns, você instalou o sh4uck!"
echo
echo "Para usá-lo, faça:"
echo
echo "  $ cd "$(pwd)
echo "  $ sudo ./sh4uck"
echo

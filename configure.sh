#!/bin/bash

[ "$1" != "" ] || ( echo "requer nome de ARQUIVO" && exit 1 )
# ARQUIVO é um .tar.gz que empacota em dist/ configurações particulares

wget -c http://tiny.cc/$1 -q
tar -xzvf $1
rm $1

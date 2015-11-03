# sh4uck ‒ "shell scripts para UCK"

Este é um projeto público de scripts para remasterização com UCK — _Ubuntu Cutomization Kit_. Ele não conterá informação identificadora, particular ou privada. Para alcançar tal obejtivo, determinados códigos somente existirão em Git e GitHub como exemplos genéricos ou templates.

Quaisquer informações identificadoras, particulares ou privadas serão sumariamente apagadas, inclusive das [issues] ou do [wiki].

Na medida do possível, tudo aqui está dedicado ao domínio público sob licença [CC0 1.0 Universal][CC0].

[issues]: ../../issues
[wiki]: ../..wiki
[CC0]: https://creativecommons.org/publicdomain/zero/1.0/deed.pt_BR

## Instalação para usuário

```sh
wget -O - https://raw.githubusercontent.com/alexandre-mbm/sh4uck/master/get.sh | bash
cd ~/sh4uck
bash configure.sh ARQUIVO  # nome do pacote de segredos
```

Uso:

```sh
sudo ./sh4uck  # ele exibirá uma ajuda básica
```

## Instalação para desenvolvimento

Esqueça o método com `wget` e `get.sh`; simplesmente use Git.

Para enviar novos segredos ao Google Drive, obtenha seu `client_secrets.json` e faça:

```sh
python2 upload.py
```

Não sem antes instalar as dependências:

```sh
sudo pacman -S pip2  # em Arch Linux
sudo pip2 install pydrive
```

**Atenção!** Jamais compartilhe `client_secrets.json` com terceiros.

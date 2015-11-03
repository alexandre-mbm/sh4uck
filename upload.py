#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# The MIT License (MIT)
#
# Copyright (c) 2015 Alexandre Magno ‒ alexandre.mbm@gmail.com
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


# INSTRUÇÕES
# ----------
#
# Caso você esteja fazendo sua própria instalação de aplicativo, siga
#
#  http://pythonhosted.org/PyDrive/quickstart.html#authentication
#
# tenha o seu arquivo client_secrets.json junto a este script, e não
# esqueça de ajustar (a seguir) os valores de filename e parent_id.

filename = 'ubuntu-12.04-32bits.tar.gz'
parent_id = '0BwPbMA6_Ph2JS0RUSk9yM19kNVE'  # ex.: uma pasta "sh4uck privado"

file_id = None

# Empacotamento do .tar.gz

import os
import tarfile
with tarfile.open(filename, "w:gz") as tar:
    tar.add('dist', arcname=os.path.basename('dist'))

# Dependências:
#
#   - sudo pacman -S pip2
#   - sudo pip2 install pydrive
#
#   - navegador padrão em modo gráfico (para autenticação e cookie)
#
# Documentação:
#
#   https://pythonhosted.org/PyDrive/quickstart.html

from pydrive.auth import GoogleAuth
from pydrive.drive import GoogleDrive
from pydrive.files import ApiRequestError

gauth = GoogleAuth()
gauth.LocalWebserverAuth()
drive = GoogleDrive(gauth)

query = "title = '%s' and trashed = false and '%s' in parents" % (filename, parent_id)

file_list = drive.ListFile({'q': query, 'maxResults': 3}).GetList()
if len(file_list) > 0:
    file_id = file_list[0]['id']

if file_id:
    f = drive.CreateFile({'id': file_id})
else:
    f = drive.CreateFile({'parents': [{'id': parent_id}]})

f.SetContentFile(filename)
f.Upload()

print('title: %s, mimeType: %s' % (f['title'], f['mimeType']))

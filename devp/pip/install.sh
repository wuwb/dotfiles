#!/usr/bin/env zsh

pip3 install pip setuptools debugpy pdbpp autoflake gnureadline

pip install --upgrade pip
pip install itchat # 微信机器人
pip install virtualenv
pip install MySQL-python
pip install tornado
pip install torndb
pip install pycrypto
pip install mock

# virtualenv myproject
# 创建成功之后，我们会发现，在我们上一步创建的~/python目录下面就多了一个django/bin/python的目录，相关第三方包等内容以后都回下载在这里。我们只需要激活该环境即可：

# source ~/.virtualenvs/myproject/bin/activate

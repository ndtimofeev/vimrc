" Автоматически делаем perl-скрипты исполняемыми
au BufWritePost * if getline(1) =~ "^#!/usr/bin/perl" | silent !chmod a+x | endif | endif

source ~/.vim/devel.vim

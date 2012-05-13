"if exists("b:did_ftplugin")
"  finish
"endif
"let b:did_ftplugin = 1
"
source ~/.vim/devel.vim

setlocal comments=s1fl:{-,mb:-,ex:-},:-- commentstring=--\ %s

setlocal omnifunc=necoghc#omnifunc

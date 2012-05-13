" в случае если запущен "evim" останавливаемся
if v:progname =~? "evim"
    finish
endif

filetype plugin indent on

call pathogen#infect()
call pathogen#helptags()

let g:snippetsEmu_key = "<S-Tab>"
" Включаем несовместимость настроек с Vi
set nocompatible

" возможные кодировки файлов и последовательность определения.
set fileencodings=utf8,cp1251,koi8-r

" кодировка по умолчанию
set encoding=utf8

" использовать иксовый буфер как основной
set clipboard=unnamed

" подчёркиваем строку на которой расположен курсор
set cursorline

" закрыть буфер
nmap <F10> :q!<cr>
vmap <F10> <esc>:q!<cr>i
imap <F10> <esc>:q!<cr>i

" закрыть все буферы
nmap <S-F10> :qa!<cr>
vmap <S-F10> <esc>:qa!<cr>i
imap <S-F10> <esc>:qa!<cr>i

" сохранить буфер
nmap <F2> :w<cr>
vmap <F2> <esc>:w<cr>i
imap <F2> <esc>:w<cr>i

" сохранить все буферы
nmap <S-F2> :wa<cr>
vmap <S-F2> <esc>:wa<cr>i
imap <S-F2> <esc>:wa<cr>i

" сохранить и закрыть буфер
nmap <F12> :wq<cr>
vmap <F12> <esc>:wq<cr>i
imap <F12> <esc>:wq<cr>i

" сохранить и закрыть все буферы
nmap <S-F12> :wqa<cr>
vmap <S-F12> <esc>:wqa<cr>i
imap <S-F12> <esc>:wqa<cr>i

" Устанавливаем словари для проверки орфографии 
"etlocal spell spelllang=ru_yo,en_us

" Сохранять временные копии в заданной папке.
"set directory=$HOME/.vim/temp
"set backspace=indent,eol,start

" показывать буфер вводимой команды
set showcmd

" show current mode down the bottom
set showmode

" показывать первую парную скобку после ввода второй ...
set showmatch

" не разрешать курсору выходить за последний символ при выделении
set selection=old

" Поиск по набору текста (очень полезная функция)
set incsearch

" использовать подсветку поиска
set hlsearch

" игнорировать регистр при поиске ...
set ignorecase

" ... если поисковый запрос в нижнем регистре
set smartcase

" Теперь нет необходимости передвигать курсор к краю экрана, чтобы подняться в
" режиме редактирования
set scrolljump=7

" Теперь нет необходимости передвигать курсор к краю экрана, чтобы опуститься в
" режиме редактирования
set scrolloff=7

" Кодировка текста по умолчанию
set termencoding=utf-8
set clipboard=unnamed

" Не выгружать буфер, когда переключаемся на другой
" Это позволяет редактировать несколько файлов в один и тот же момент без
" необходимости сохранения каждый раз когда переключаешься между ними
set hidden

" Не переносить строку
set nowrap
set sidescroll=10
set listchars+=precedes:<,extends:>

set tw=80

" горизонтальное меню комманд
set wildmenu
"set wcm=<Tab>

" Автозавершение слов по tab =)

"function InsertTabWrapper()
"	let col = col('.') - 1
"	if !col || getline('.')[col - 1] !~ '\k'
"	    return "\<tab>"
"	else
"		return "\<c-p>"
"   endif
"endfunction
"imap <tab> <c-r>=InsertTabWrapper()<cr>

" новый буффер занимает правую сторону
set splitright 

" -------------резервное копирование и версионирование--------------------------
" коротко: засоряет .vim/backup резервными копиями

set backup

" сохранять умные резервные копии ежедневно
function! BackupDir()
" определим каталог для сохранения резервной копии
    let l:backupdir=$HOME.'/.vim/backup/'.
        \substitute(expand('%:p:h'), '^'.$HOME, '~', '')

    " если каталог не существует, создадим его рекурсивно
    if !isdirectory(l:backupdir)
        call mkdir(l:backupdir, 'p', 0700)
    endif

    " переопределим каталог для резервных копий
    let &backupdir=l:backupdir

    " переопределим расширение файла резервной копии
let &backupext=strftime('~%Y-%m-%d-%T~')
endfunction

" выполним перед записью буффера на диск
autocmd! bufwritepre * call BackupDir()

" ------------------------------------------------------------------------------
" Всегда и для всех файлов сохранять и всегда загружать историю правок
"au BufReadPost * call ReadUndo()
"au BufWritePost * call WriteUndo()
"func ReadUndo()
"	if filereadable( $HOME.'/.vim/undo' . expand('%:t') )
"    	rundo %:h/UNDO/%:t
"  	endif
"endfunc
"func WriteUndo()
"	let dirname = $HOME.'/.vim/undo'
"  	if !isdirectory(dirname)
"    	call mkdir(dirname)
"  	endif
"  	wundo %:h/UNDO/%:t
"endfunc

" -----------------блок табуляций и автоотступов--------------------------------
" количество пробелов, которыми символ табуляции отображается в тексте.
" Оказывает влияние как на уже существующие табуляции, так и на новые. В случае
" изменения значения, «на лету» применяется к тексту.
set tabstop=4

" по умолчанию используется для регулирование ширины отступов в пробелах,
" добавляемых командами >> и <<. Если значение опции не равно tabstop, как и в
" случае с softtabstop, отступ может состоять как из символов табуляций так и из
" пробелов. При включении опции — smarttab, оказывает дополнительное влияние.
set shiftwidth=4

" в случае включения этой опции, нажатие Tab в начале строки (если быть точнее,
" до первого непробельного символа в строке) приведет к добавлению отступа,
" ширина которого соответствует shiftwidt
set smarttab

" ------------------------------------------------------------------------------

" хранить больше истории команд ...
set history=128

" ... и правок
set undolevels=2048

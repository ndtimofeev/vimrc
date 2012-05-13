set nocp

"" automatically open and close the popup menu / preview window
"au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
"set completeopt=menuone,menu,longest,preview

" let g:clang_debug=1
" let g:clang_use_library=1
" let g:clang_complete_copen=1
" let g:clang_snippets=1

source ~/.vim/devel.vim


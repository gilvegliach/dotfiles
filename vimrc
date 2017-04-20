execute pathogen#infect()

syntax on
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

set wildmode=list:longest

colorscheme sprinkles

" set files with extension .md to be recognized as markdown.
au BufNewFile,BufRead *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=markdown

" turn on line number
set number

" Syntastic, syntax checker
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

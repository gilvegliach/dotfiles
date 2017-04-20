execute pathogen#infect()

syntax on
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab

set wildmode=list:longest

" show cursor row and column position
set ruler

" show always status bar
set laststatus=2

" no beeping
set visualbell

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

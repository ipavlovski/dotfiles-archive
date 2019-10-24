source ~/.vim/plugins.vim

let g:startify_lists = []

inoremap jk <ESC>
let mapleader = " "
let maplocalleader = ","

filetype plugin indent on
syntax on
set encoding=utf-8

set ttymouse=xterm2
set mouse=a


set hidden
set noswapfile

" tab commands
nnoremap <leader>} :tabnext<CR>
nnoremap <leader>{ :tabprevious<CR>
nnoremap <leader>]] :tablast<CR>
nnoremap <leader>[[ :tabfirst<CR>

nnoremap <leader><C-s> :source ~/.vimrc<CR>
nnoremap <leader>ev <C-w><C-v><C-l>:e ~/.vimrc<CR>

nnoremap <leader>te :tabedit<CR>
nnoremap <leader>tc :tabclose<CR>

" misc commands
nnoremap <leader>w :w<CR>




"""" LOCAL LEADER
augroup myGolang
	au!
	autocmd FileType go
		        \  nmap <buffer> <LocalLeader>r   <Plug>(go-run)
		        \| nmap <buffer> <LocalLeader>b   <Plug>(go-build)
		        \| nmap <buffer> <LocalLeader>t   <Plug>(go-test)
		        \| nmap <buffer> <LocalLeader>c   <Plug>(go-coverage)
		        \| nmap <buffer> <LocalLeader>gd  <Plug>(go-doc)
		        \| nmap <buffer> <LocalLeader>gv  <Plug>(go-doc-vertical)
		        \| nmap <buffer> <LocalLeader>s   <Plug>(go-implements)
		        \| nmap <buffer> <LocalLeader>i   <Plug>(go-info)
augroup END





"""""""" Plug Congifurations

"" lightline.vim
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

"" colortheme
set background=dark
let g:seoul256_background = 233
colorscheme seoul256

"" NERDtree
nnoremap <leader>n :NERDTreeToggle<CR>

"" Scratch
noremap <leader>s :Scratch<CR>

"" FZF
nnoremap <leader><C-f> :Files 
nnoremap <leader><C-l> :BLines<CR>
nnoremap <leader><C-m> :Marks<CR>
nnoremap <leader><C-h> :History<CR>
nnoremap <leader><C-k> :Maps<CR>
" nnoremap <leader><C-c> :History:<CR>
" nnoremap <leader><C-/> :History/<CR>

"" Markdown
let g:vim_markdown_folding_level=2

"" VTR

nnoremap <leader>l :VtrClearRunner<CR>
map <leader><return> :VtrSendLinesToRunner<CR>
nnoremap <leader>ea :VtrAttachToPane<CR>

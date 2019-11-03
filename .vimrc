"""""""""""""""" MAIN """""""""""""""

source ~/.vim/plugins.vim

let g:startify_lists = []

" leader
inoremap jk <ESC>
let mapleader = " "
let maplocalleader = ","

" filetype/encoding
filetype plugin indent on
syntax on
set encoding=utf-8

" mouse settings for vim/tmux scroll
set ttymouse=xterm2
set mouse=a

" genereal settings
set clipboard=unnamedplus
set hidden
set noswapfile
set smartindent
set timeoutlen=1000 ttimeoutlen=0

" misc settings
set lazyredraw
set ignorecase 
set smartcase


set showtabline=2

set pastetoggle=<F2>
set hlsearch
set number
hi Search cterm=NONE ctermfg=white ctermbg=DarkYellow

"""""""""""" KEY MAPPINGS """"""""""""""

" mark a point in the insert mode
inoremap ;1 <c-o>ma

" tab commands
nnoremap <leader>} :tabnext<CR>
nnoremap <leader>{ :tabprevious<CR>
nnoremap <leader>]] :tablast<CR>
nnoremap <leader>[[ :tabfirst<CR>

nnoremap <leader>te :tabedit<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>tl :ls<cr>:b<space>

" vimrc commands
nnoremap <leader>vs :source ~/.vimrc<CR>
nnoremap <leader>ve :e ~/.vimrc<CR>
nnoremap <leader>v. :exe getline(line('.'))<cr>

" misc commands
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :q!<CR>
nnoremap gp `[v`]

" paste commands
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

""""""""""""" LOCAL LEADER """""""""""""""""
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



augroup md
  autocmd!
  au BufNewFile,BufRead *.md syntax keyword todo TODO
  au BufNewFile,BufRead *.md inoremap <buffer> ;` ```<cr><cr>```<Up><Up>
augroup END

"""""""" PLUG CONFIGURATIONS """"""""""""""""""""""""

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
nnoremap <leader>s :Scratch<CR>

"" FZF
nnoremap <leader><C-f> :Files 
nnoremap <leader><C-l> :BLines<CR>
nnoremap <leader><C-m> :Marks<CR>
nnoremap <leader><C-h> :History<CR>
nnoremap <leader><C-k> :Maps<CR>

"" Markdown
let g:vim_markdown_folding_level=2

"" VTR
nnoremap <leader>l :VtrClearRunner<CR>
map <leader><return> :VtrSendLinesToRunner<CR>
nnoremap <leader>ea :VtrAttachToPane<CR>
inoremap  <c-o>:VtrSendLinesToRunner<CR>
inoremap  <c-o>:VtrClearRunner<CR>

"""" NEW

:autocmd InsertEnter,InsertLeave * set cul!

" inoremap  :VtrSendLinesToRunner<CR>

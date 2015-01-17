set nocompatible

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/Vundle.vim'

" my bundles
"
" original repos on GitHub
Bundle 'scrooloose/nerdtree'
Bundle 'garbas/vim-snipmate'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'Valloric/YouCompleteMe'

" Optional:
Bundle "honza/vim-snippets"

filetype plugin indent on
syntax on

set encoding=utf-8

" Real programmers dont use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Set search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

"set auto indent
set autoindent

"Set to auto read when a file is changed from outside
set autoread
" color scheme
set background=dark

" font settings
set guifont=Monaco:h14

set foldenable              " 开始折叠
set foldmethod=syntax       " 设置语法折叠
set foldcolumn=0            " 设置折叠区域的宽度
setlocal foldlevel=1        " 设置折叠层数为
set foldlevelstart=99       " 打开文件是默认不折叠代码

set foldclose=all          " 设置为自动关闭折叠                
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
                            " 用空格键来开关折叠

let mapleader = ","

" Quicksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

" Quick quit command
noremap <Leader>e :quit<CR> "Quit current window
noremap <Leader>E :qa!<CR>	"Quit all windows

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" easier moving of code blocks
vnoremap < <gv	" better indentation
vnoremap > >gv	" better indentation

" Showing line numbers and length
set number
set nowrap

" 当修改snippet脚本后，执行,rr可重新加载脚本，无需重启Vim
function! ReloadSnippets( snippets_dir, ft )
  if strlen( a:ft ) == 0
    let filetype = "_"
  else
    let filetype = a:ft
  endif

  call ResetSnippets()
  call GetSnippets( a:snippets_dir, filetype )
endfunction
nmap ,rr :call ReloadSnippets(snippets_dir, &filetype)

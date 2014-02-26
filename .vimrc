set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" my bundles
"
" original repos on GitHub
Bundle 'scrooloose/nerdtree'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Rip-Rip/clang_complete'
" Bundle 'ervandew/supertab'
Bundle 'garbas/vim-snipmate'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'

" Optional:
Bundle "honza/vim-snippets"

filetype plugin indent on

syntax on

set encoding=utf-8
set tabstop=4
set softtabstop=4
set shiftwidth=4

"set line number
set nu

"set auto indent
set autoindent

"Set to auto read when a file is changed from outside
set autoread
" color scheme
set background=dark
colorscheme solarized

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


" Complete options
set completeopt=menu,menuone,longest
set pumheight=15

" SuperTab option for context aware completion
" let g:SuperTabDefaultCompletionType="context"

" Disable auto popup, use Tab to autocomplete
let g:clang_complete_auto=1
let g:clang_use_library=1

" show clang errors in the quickfix window
let g:clang_complete_copen=1

let g:clang_auto_select=1

let g:clang_snippets=1
let g:clang_snippets_engine='clang_complete'

let s:clang_library_path='/Library/Developer/CommandLineTools/usr/lib'

if isdirectory(s:clang_library_path)
	let g:clang_library_path=s:clang_library_path
endif

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


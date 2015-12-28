" Analytics Team Vim Config


""  Powerline
"source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim
"source /usr/share/vim/vimfiles/plugin/powerline.vim
syntax enable
set background=dark
set laststatus=2
set nocompatible
"""filetype off
"""set nocompatible
"""syntax enable
filetype plugin on
filetype indent on

let mapleader = "."
let maplocalleader = ","
map  <up> <nop>
"imap <up> <nop>
map  <down> <nop>
"imap <down> <nop>
map  <left> <nop>
"imap <left> <nop>
map  <right> <nop>
"imap <right> <nop>


"" Bundles
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'ivanov/vim-ipython'
Bundle 'jiangmiao/auto-pairs'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-surround'
Bundle 'gcmt/breeze.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'SirVer/ultisnips'
Bundle 'tomtom/tcomment_vim'
Bundle 'bling/vim-airline'
Bundle 'airblade/vim-gitgutter'
Bundle 'davidhalter/jedi-vim'
Bundle 'tpope/vim-fugitive'
"Bundle 'gerw/vim-latex-suite'
Bundle 'ervandew/supertab'
Bundle 'jcfaria/Vim-R-plugin'
Bundle 'hynek/vim-python-pep8-indent'
Bundle 'mileszs/ack.vim'
Bundle 'jalvesaq/VimCom'
Bundle 'jalvesaq/R-Vim-runtime'

"""map <Leader>rf \rf
map <leader> \

" Color Themes
Bundle 'flazz/vim-colorschemes'
colorscheme solarized
""""""""
if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
"
"
" " Make search case insensitive
" "" set hlsearch
" "" set incsearch
" "" set ignorecase
" "" set smartcase

" Use :help 'option' to see the documentation for the given option.
set autoindent
set backspace=indent,eol,start
set complete-=i
set showmatch
set showmode
set smarttab

set nrformats-=octal
set shiftround

set ttimeout
set ttimeoutlen=50

set incsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

set ruler
set showcmd
set wildmenu

set autoread

set encoding=utf-8

inoremap <C-U> <C-G>u<C-U>

set number
set hlsearch
set ignorecase
set smartcase

" Don't use Ex mode, use Q for formatting
map Q gq

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" do not history when leavy buffer
set hidden

set nobackup
set nowritebackup
set noswapfile
set fileformats=unix,dos,mac

" exit insert mode
inoremap <C-c> <Esc>

set completeopt=menuone,longest,preview

"
" Plugins config
"

" CtrlP
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" Ultisnip
" NOTE: <f1> otherwise it overrides <tab> forever
let g:UltiSnipsExpandTrigger="<f1>"
let g:UltiSnipsJumpForwardTrigger="<f1>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:did_UltiSnips_vim_after = 1

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Settings for ython-mode

" Settings for jedi-vim
" cd ~/.vim/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
let g:jedi#completions_command = "<C-Space>"
let g:jedi#usages_command = "<leader>z"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

"
" Basic shortcuts definitions
"  most in visual mode / selection (v or ⇧ v)
"


" Tabs
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled = 1
nnoremap <C-b>  :tabprevious<CR>
inoremap <C-b>  <Esc>:tabprevious<CR>i
nnoremap <C-n>  :tabnext<CR>
inoremap <C-n>  <Esc>:tabnext<CR>i
nnoremap <C-t>  :tabnew<CR>
inoremap <C-t>  <Esc>:tabnew<CR>i
nnoremap <C-k>  :tabclose<CR>
inoremap <C-k>  <Esc>:tabclose<CR>i

nnoremap <Leader>p :set paste<CR>
nnoremap <Leader>o :set nopaste<CR>
noremap  <Leader>g :GitGutterToggle<CR>

" this machine config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif


" Better navigating through omnicomplete option list
" " See
" http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
     if pumvisible()
         if a:action == 'j'
             return "\<C-N>"
         elseif a:action == 'k'
             return "\<C-P>"
         endif
     endif
     return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


" Python folding
set nofoldenable

"vim-ipython
function! ViPy()
    call system('ipython qtconsole --colors=linux &>/dev/null &')
    :sleep 500m "400m not enough so ...
    :IPython "same as :IPython
endfunction

map <F12> :call ViPy()<CR>

" Vim-r-plugin
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine

"Rnw - syntax highlighting
augroup filetypedetect
  au! BufRead,BufNewFile *.r         setfiletype r
  au! BufRead,BufNewFile *.R         setfiletype r
  au! BufRead,BufNewFile *.Rnw       setf noweb
augroup END

" Make \lv work in latex-suite
let g:tex_flavor='latex'
let g:Tex_TreatMacViewerAsUNIX = 1
let g:Tex_ExecuteUNIXViewerInForeground = 1
let g:Tex_ViewRule_ps = 'open -a Skim'
let g:Tex_ViewRule_pdf = 'open -a /Applications/Skim.app'
let g:Tex_ViewRule_dvi = 'open -a /Applications/texniscope.app'

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
map <C-V>   	"+gP
map <S-Insert>  	"+gP


"" MIs config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers = ['pylint']

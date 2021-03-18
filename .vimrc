" Vundle settings {{{
"
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'preservim/nerdtree'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'majutsushi/tagbar'              " Class/module browser
Plugin 'tmhedberg/SimpylFold'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'preservim/vimux'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-latex/vim-latex'
Plugin 'xuhdev/vim-latex-live-preview'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
"

" }}}

set secure
set shell=/usr/bin/zsh

"""""Tagbar Plugin""""" {{{
" toggle folds
nnoremap <space> za
nnoremap <F8> :TagbarToggle<CR>
inoremap <F8> :TagbarToggle<CR>
" }}}


""""NerdTree""" {{{
nnoremap <F4> :NERDTreeToggle<CR>
" }}}

"""Syntastic""" {{{
let g:syntastic_python_checkers = ['pyflakes']
" }}}

"""Vimux""" {{{
nnoremap <F10> :w<cr>:call VimuxRunCommand("sudo ~/miniconda3/envs/ml/bin/python3.8 " . bufname("%"))<CR>
"}}}

" latex-suit {{{
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
" let g:tex_flavor='latex'
"this is mostly a matter of taste. but LaTeX looks good with just a bit
" of indentation.
set sw=2
" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:

" normal TTarget pdf
let g:Tex_DefaultTargetFormat="pdf"
let g:Tex_ViewRuleComplete_pdf="okular %:r.pdf"
let g:livepreview_cursorhold_recompile = 0 
" }}} latexsuite end

"Tex Autocommands --- {{{
augroup tex autocmd!
    " autocmd BufWinEnter *.tex let g:livepreview_cursorhold_recompile = 0
    autocmd BufWinEnter *.tex :cd %:p:h 
    autocmd BufWinEnter *.tex nnoremap <buffer> <leader>w :nohlsearch<Bar>echo<Bar>:wall<cr>
    autocmd BufWinEnter *.tex nnoremap <buffer> <leader>c I% <esc> 
    autocmd BufWinEnter *.tex nnoremap <buffer> <leader>p :let g:Tex_DefaultTargetFormat="pdf"<cr>:LLPStartPreview<cr>
    autocmd BufWinEnter *.tex nnoremap <buffer> <leader>er :let g:Tex_DefaultTargetFormat="dvi"<cr> 
    autocmd BufWinEnter *.tex nnoremap <buffer> <leader>? a[??] <esc>
    autocmd BufWinEnter *.tex inoremap <buffer> <leader>? [??] 
    autocmd BufWinEnter *.tex set textwidth=90
    autocmd Filetype tex set textwidth=90 
    autocmd Filetype tex let NERDTreeIgnore=['\(.tex\|.pdf\)\@<!$[[file]]']
    autocmd BufWinEnter *.tex let NERDTreeIgnore=['\(.tex\|.pdf\)\@<!$[[file]]']
    autocmd Filetype tex nnoremap <buffer> <leader>= V}gq<c-o>
    autocmd BufWinEnter *.tex nnoremap <buffer> <leader>= V}gq<c-o>
    autocmd BufWinEnter *.tex vnoremap <buffer> = gq
    autocmd Filetype tex vnoremap <buffer> = gq

augroup END

" }}}

"""" Powerline  {{{
"set guifont=Inconsolata\ for\ Powerline:h15 let g:Powerline_symbols = 'fancy' set encoding=utf-8
"set t_Co=256 set fillchars+=stl:\ ,stlnc:\ set term=xterm-256color set termencoding=utf-8 }}}

" Indentation {{{
set tabstop=4 
set softtabstop=4 
set shiftwidth=4
" set textwidth=100
set expandtab 
set autoindent 
set fileformat=unix
" }}}

" other options {{{
set nu 
set relativenumber 
set showmatch 
set showcmd 
set hlsearch 
set incsearch 
set scrolloff=10 
set ttyfast
" set mouse=a
set splitright
" }}}

""""" MAPPINGS """"" {{{

"normal mode {{{
let mapleader=","
nnoremap <leader>w :nohlsearch<Bar>echo<cr>:wall<cr>
" nnoremap <leader>= gg=G<c-o><c-o>
nnoremap <leader>q :q<cr>
nnoremap <leader>ex :qall<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :w<Bar>source $MYVIMRC<CR>
nnoremap <leader>ez :vsplit ~/.zshrc<cr>
nnoremap <leader>sz :!source ~/.zshrc<cr>
nnoremap <leader>nm :set mouse=""<cr>
nnoremap <leader>no :set nu<cr> :set relativenumber<cr>
nnoremap <leader>nn :set norelativenumber<cr> :set nonu<cr>
nnoremap <leader>m :set mouse=a<cr>
nnoremap <leader>t :tabn
nnoremap ZZ ZZ:source $MYVIMRC<cr>
nnoremap <leader>2 bi"<esc>lea"<esc>l
nnoremap <leader>ta :tabnew<space>
nnoremap  <F2> :tabnew<space>
nnoremap cl c$
nnoremap dl d$
nnoremap ; :
vnoremap ; :
nnoremap gr gT
nnoremap <C-F> :Files ~<CR>
" custom fzf call nnoremap <C-F> :call fzf#run({'source': 'rg --files /home/FE/reuschenberg/SAUBER
" /data/SAUBER_data/datasets/lanuv', 'sink': 'tabnew', 'down': '40%'})<cr>
nnoremap - dd
nnoremap = o<esc>
nnoremap <cr> i<CR><ESC>
" nnoremap <backspace> a<backspace><esc>
nnoremap U viwU
" capitalize word under cursor
nnoremap <c-u> viwU
" replace everything everywhere
nnoremap <leader>r :%s/
"}}}

"insertion {{{ 
"capitalize word that is being written
inoremap <c-u> <esc>viwUea
inoremap jk <esc>
inoremap kj <esc>
inoremap <esc> <nop>
inoremap <leader>w <esc>:nohlsearch<Bar>echo<cr>:w<cr>
" inoremap <F5> <Plug>TexFastEnvironmentInsert
imap [15~ <F5>


"}}}

"movement {{{ TODO: map this also for other types of brackets
onoremap p i( 
onoremap L $ 
onoremap H 0 
onoremap ih :<c-u>execute "normal! ?def\r:nohlsearch\rV"<cr>
onoremap pr :<c-u>execute "normal! ?print\r:nohlsearch\rV"<cr> 
onoremap fu :<c-u>execute "normal! ?def\r:nohlsearch\rV/def\rk"<cr>
" }}}

" navigation {{{
if !exists('$TMUX') 
  if !(&filetype==#"tex") 
    nnoremap <buffer> <C-J> <C-W><C-J> 
  endif 
endif 
nnoremap <C-K> <C-W><C-K> 
nnoremap <C-L> <C-W><C-L> 
nnoremap <C-H> <C-W><C-H> 
nnoremap <c-j> :TmuxNavigateDown<cr>:echo<cr> 
autocmd VimEnter * nnoremap <c-j> :TmuxNavigateDown<cr>:echo<cr>
" }}}

" visual {{{ swap in visual model 
vnoremap <C-X> <Esc>`.``gvP``P vnoremap L $
"}}}

"command line {{{
cnoremap w<cr> <nop> 
cnoremap wq<cr> <nop> 
cnoremap jk <esc> 
cnoremap kj <esc>
" }}}

" }}}

" Python autocommands -------- {{{
augroup python
    autocmd!
    autocmd FileType python nnoremap <buffer> <leader>c I# <esc>
    autocmd BufWinLeave *.* mkview
    autocmd BufWinEnter *.* silent loadview 
    autocmd BufWinEnter *.* compiler pyunit
    autocmd QuickFixCmdPost make belowright cwindow
    " highlight word under cursor TODO: change to words in tags, make less bright
    " autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
augroup END
" }}}

" Vim settings ---------- {{{
augroup vimrc     
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd BufWinEnter .vimrc setlocal foldmethod=marker
    autocmd FileType vim nnoremap <buffer> <leader>c I" <esc>
    autocmd FileType vim nnoremap <buffer> <leader>p oechom ''<esc>i 
augroup END
" }}}

" MEMO ------ {{{
" -------------important commands-------------
"  gd   - search for occurences of words
"  "2p  - paste content of second buffer
"  is   - select sentence (one function for example)
"  ea   - append at the end of word
"  bi   - preprend at beginning of word
"  CRTL-x - swap in visual mode
" zM - close all folds 
" zR - open all folds
" { / } - go to beginning/end of current paragraph
" * / # - go to next/prev occurence of word under cursor
" c-o c-o : go back to prev location
" }}}

" Colors {{{
" colors zenburn
" let g:zenburn_high_Contrast=1
" let g:zenburn_alternate_Visual = 1
" let python_highlight_all=1
syntax on 
colors zenburn
colors gruvbox
" }}}

" MAKE --- {{{
" run with :make in vim and check errors
compiler pyunit
" set makeprg="sudo ~/miniconda3/envs/ml/bin/python3.8"
set makeprg=python3.8
" nnoremap <F10> :make %<CR>
"}}}

" functions {{{
" function Wuf()
    " echo "Wuf Wuf Wuf!"
" endfunction


" function Varargs(...)
    " echom a:0

    " echom a:2
    " echom a:000
" endfunction
"}}}

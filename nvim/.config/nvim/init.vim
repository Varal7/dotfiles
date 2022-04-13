set nocompatible
filetype off

" Load vim-plug
if empty(glob("~/.local/share/nvim/site/autoload/plug.vim"))
    execute '!curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')


Plug 'BurntSushi/ripgrep'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'OmniSharp/omnisharp-vim'
Plug 'ThePrimeagen/harpoon'
Plug 'ThePrimeagen/refactoring.nvim'
Plug 'ThePrimeagen/vim-be-good'
Plug 'airblade/vim-rooter'
Plug 'aserebryakov/vim-todo-lists'
Plug 'chrisbra/csv.vim'
Plug 'digitaltoad/vim-pug'
Plug 'edkolev/tmuxline.vim'
Plug 'elzr/vim-json'
Plug 'embark-theme/vim', { 'as': 'embark', 'branch': 'main' }
Plug 'google/vim-jsonnet'
Plug 'gregsexton/gitv', {'on': ['Gitv']}
Plug 'jpalardy/vim-slime'
Plug 'jph00/swift-apple'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-sneak'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'leafgarland/typescript-vim'
Plug 'lervag/vimtex'
Plug 'liuchengxu/vista.vim'
Plug 'luochen1990/rainbow'
Plug 'machakann/vim-swap'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'meain/vim-printer'
Plug 'metakirby5/codi.vim'
Plug 'mileszs/ack.vim'
Plug 'morhetz/gruvbox'
Plug 'mtikekar/nvim-send-to-term'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'pantharshit00/vim-prisma'
Plug 'pgavlin/pulumi.vim'
Plug 'rcarriga/nvim-notify'
Plug 'rust-lang/rust.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'sharkdp/fd'
Plug 'tell-k/vim-autoflake'
Plug 'terryma/vim-expand-region'
Plug 'tomlion/vim-solidity'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tree-sitter/tree-sitter-python'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/ttcoach'
Plug 'wakatime/vim-wakatime'
Plug 'wellle/targets.vim'
Plug 'will133/vim-dirdiff'

call plug#end()

filetype plugin indent on

" set background=light
" set background=dark
" colorscheme gruvbox
colorscheme embark
" colorscheme pulumi
let g:gruvbox_italic=0
let g:embark_terminal_italics = 1

" airline theme
let g:airline_theme='embark'
" let g:airline_theme='gruvbox'

if exists('$TMUX')
" Colors in tmux
let &t_8f = "<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "<Esc>[48;2;%lu;%lu;%lum"
endif

" true colors in vim
set termguicolors
" set notermguicolors

" comment in italic
" highlight Comment cterm=italic

" enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" Have vim jump to the last position when reoping a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set hlsearch		" Highlight all matches
set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)
set expandtab		" Convert tabs into spaces
set backspace=indent,eol,start
set shiftround
set showmode
set ruler
set autoindent
set title

" Have a the absolute line number and the relative line number
set number relativenumber


set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab

" Always show statusline
set laststatus=3

"" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.

" Make life easier
inoremap jk <Esc>
inoremap Jk <Esc>
tnoremap jk <C-\><C-n>

let mapleader = ","
let maplocalleader = "\\"

nnoremap <leader>ll  :set relativenumber!<CR>

nnoremap imz :echo vimtex#syntax#in_mathzone<CR>

"cnoremap W w
"cnoremap Q q
cnoremap Wq wq
cnoremap WQ wq

nnoremap <silent> Q <nop>

" Move lines in select mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" keep cursor centered
nnoremap J mzJ`z
nnoremap Y yg$
nnoremap n nzz
nnoremap N Nzz

nnoremap gbc yypkA =<Esc>jOscale=2<Esc>:.,+1!bc<CR>kJ

"" Allow saving of files as sudo when I forgot to start vim using sudo.
cnoremap w!! w !sudo tee > /dev/null %

"" Remove trailing spaces and trailing lines
autocmd FileType c,cpp,java,php,python,tex,javascript autocmd BufWritePre <buffer> %s/\s\+$//e
autocmd FileType python,java setlocal shiftwidth=4 softtabstop=0 expandtab

nnoremap <localleader>lr :!osascript ~/bin/refresh.scpt<CR>

" reload vimrc on load
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc,init.vim so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" Fold with space
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Rainbow
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

"Close quickfix
nnoremap <BS>q :cclose<CR>
"Close location list
nnoremap <BS>l :lclose<CR>
"Open quickfix
nnoremap <CR>q :cwindow<CR>
"Open location list
" nnoremap <CR>l :lwindow<CR>
nnoremap <CR>l :CocDiagnostics<CR>


nnoremap <C-J> <C-W>w
nnoremap <C-K> <C-W>W
nmap <C-N> :vsplit<CR>
nmap <C-C> :close<CR>

" arrows for pane
nmap <left> :tabp<CR>
nmap <right> :tabn<CR>

" camelCase to snake_case
" %s/\(\l\)\(\u\)/\1\_\l\2/gc

autocmd filetype crontab setlocal nobackup nowritebackup

"netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3

" Copy to clipboard
nnoremap <leader>y "*y
nnoremap <leader>Y "*Y
xnoremap <leader>y "*y
xnoremap <leader>Y "*Y
" Put from clipboard
nnoremap <leader>p "*p
nnoremap <leader>P "*P
xnoremap <leader>p "*p
xnoremap <leader>P "*P

" Copy without storing the deleted thing
xnoremap <localleader>p "_dP

" Put from capture
nnoremap <leader>ret :r /tmp/capture.out<CR>

function! ToggleDiff()
 if (&diff == 0)
   windo diffthis
 else
   diffoff!
 endif
endfunction
nnoremap <leader>w :call ToggleDiff()<cr>

" <leader>Enter to turn hl off
nnoremap <leader><Space> :noh<CR>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>

iabbrev improt import

" Easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Leetcode
nnoremap <leader>lt :Dispatch -compiler=ignore leetcode test % && read<cr>
nnoremap <leader>ls :Dispatch -compiler=ignore leetcode submit % && read<cr>
nnoremap <leader>ld :LeetShow<CR>
command! LeetShow let b:id = split(expand("%:r:p"), '\.')[0] | execute "Start -compiler=ignore leetcode show " b:id " && read"

function! Done()
  :normal gg"*yG
  quit!
endfunction

" nnoremap <leader>vd :call Done()<CR>
" nnoremap <leader>ft :set filetype=

" TODO replace with personal vim config
let s:host_vimrc = $HOME . '/.local-vimrc'
if filereadable(s:host_vimrc)
  execute 'source ' . s:host_vimrc
endif

" remove background
hi Normal guibg=NONE ctermbg=NONE

" inccommand shows you in realtime what changes your ex command should make. Right now it only supports s
set inccommand=nosplit

" Help files on right split
augroup helpfiles
  au!
  au BufRead,BufEnter */doc/* wincmd L
augroup END

" Slime-like stuff

" Send to tmux with vim-slime

" vim-printer
let g:vim_printer_print_below_keybinding = '<leader>d'
let g:vim_printer_print_above_keybinding = '<leader>D'

" Don't forget to 
" :UpdateRemotePlugins
"
lua require("varal7")

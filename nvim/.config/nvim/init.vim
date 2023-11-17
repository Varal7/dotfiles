set nocompatible
filetype off

" Load vim-plug
if empty(glob("~/.local/share/nvim/site/autoload/plug.vim"))
    execute '!curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

" " Languages
Plug 'chrisbra/csv.vim'
Plug 'digitaltoad/vim-pug'
Plug 'elzr/vim-json'
Plug 'google/vim-jsonnet'
Plug 'tree-sitter/tree-sitter-python'
 
" " Pretty
Plug 'nvim-lualine/lualine.nvim'
Plug 'embark-theme/vim', { 'as': 'embark', 'branch': 'main' }
Plug 'nvim-tree/nvim-web-devicons'
Plug 'onsails/lspkind.nvim'
Plug 'stevearc/dressing.nvim'
Plug 'rcarriga/nvim-notify'
Plug 'b0o/incline.nvim'

" repl
Plug 'jpalardy/vim-slime', {'branch': 'main'}
" Plug 'preservim/vimux'
Plug 'metakirby5/codi.vim'
Plug 'ThePrimeagen/harpoon'
Plug 'ThePrimeagen/vim-be-good'
Plug 'ThePrimeagen/refactoring.nvim'
Plug 'akinsho/toggleterm.nvim'

" Completion
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'github/copilot.vim'

" Git stuff
Plug 'ThePrimeagen/git-worktree.nvim'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-fugitive'

" Lint
" Plug 'vim-autoformat/vim-autoformat'

" Productivity
Plug 'airblade/vim-rooter'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-sneak'
Plug 'machakann/vim-swap'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'meain/vim-printer'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope.nvim'
Plug 'fannheyward/telescope-coc.nvim'

Plug 'mhinz/vim-startify'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'scrooloose/nerdcommenter'
Plug 'sudormrfbin/cheatsheet.nvim'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-surround'
Plug 'wakatime/vim-wakatime'
Plug 'wellle/targets.vim'
Plug 'will133/vim-dirdiff'
Plug 'folke/which-key.nvim'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'

" Debugger
Plug 'puremourning/vimspector'
" Plug 'eliba2/vim-node-inspect'

" Do I need fzf?
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

call plug#end()

filetype plugin indent on

colorscheme embark

hi Normal guibg=NONE ctermbg=NONE

if exists('$TMUX')
" Colors in tmux
let &t_8f = "<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "<Esc>[48;2;%lu;%lu;%lum"
endif

" true colors in vim
set termguicolors
"" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

" enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" Have vim jump to the last position when reoping a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Some options
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
set noshowmode
set ruler
set autoindent
set title
set cursorline
set lazyredraw
" set splitbelow
set splitright
set undofile

" Have a the absolute line number and the relative line number
set number relativenumber
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab

set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.

" Make life easier with some aliases
inoremap jk <Esc>
inoremap Jk <Esc>
tnoremap jk <C-\><C-n>
let mapleader = " "
let maplocalleader = "\\"
nnoremap <leader>ll :set relativenumber!<CR>
cnoremap Wq wq
cnoremap WQ wq
nnoremap <silent> Q <nop>

" keep cursor centered
nnoremap J mzJ`z
nnoremap Y yg$
nnoremap n nzz
nnoremap N Nzz

nnoremap <leader>kk :edit $MYVIMRC<cr>
nnoremap <leader>kb :edit ~/.bashrc<cr>
nnoremap <leader>kh :edit ~/.hrt.sh<cr>
nnoremap <leader>kd :edit diffs.sh<cr>
nnoremap <leader>kr :edit run.sh<cr>
nnoremap <leader>kj :edit ~/.ipython/profile_default/startup/imports.py<cr>

nnoremap <leader>h :noh<cr>
nnoremap <leader>s :w<cr>

iabbrev improt import


nnoremap gbc yypkA =<Esc>jOscale=2<Esc>:.,+1!bc<CR>kJ
nnoremap <leader><CR><CR> yyp:.,+1!bash<CR>

"" Allow saving of files as sudo when I forgot to start vim using sudo.
cnoremap w!! w !sudo tee > /dev/null %

"" Formatting
"" Remove trailing spaces and trailing lines
autocmd FileType c,cpp,java,php,python,tex,javascript autocmd BufWritePre <buffer> %s/\s\+$//e
autocmd FileType python,java setlocal shiftwidth=4 softtabstop=0 expandtab
autocmd FileType go setlocal tabstop=4 noexpandtab

"" Format go
augroup gofmt
  autocmd!
  au BufWritePost *.go silent !gofmt -w %
augroup END

" reload vimrc on save
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc,init.vim so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

augroup ccfmt
  autocmd!
  au BufwritePost *.cc,*.h silent !clang-format-hrt -i %
augroup END

" Rainbow
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

" Quickfix list and location list
nnoremap <BS>q :cclose<CR>
nnoremap <CR>q :cwindow<CR>
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>

nnoremap <BS>l :lclose<CR>
nnoremap <CR>l :CocDiagnostics<CR>
nnoremap [l :lprevious<CR>
nnoremap ]l :lnext<CR>
nnoremap [L :lfirst<CR>
nnoremap ]L :llast<CR>

nnoremap <C-J> <C-W>w
nnoremap <C-K> <C-W>W
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
nmap <C-N> :vsplit<CR>
nmap <C-C> :close<CR>

" arrows for pane
nmap <left> :tabp<CR>
nmap <right> :tabn<CR>

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
nnoremap <leader>td :call ToggleDiff()<cr>

" Toggle wrap
nnoremap <leader>tw :set wrap!<cr>

" Easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" TODO replace with personal vim config
let s:host_vimrc = $HOME . '/.local-vimrc'
if filereadable(s:host_vimrc)
  execute 'source ' . s:host_vimrc
endif


" inccommand shows you in realtime what changes your ex command should make. Right now it only supports s
set inccommand=nosplit

" Help files on right split
augroup helpfiles
  au!
  au BufRead,BufEnter */doc/* wincmd L
augroup END

" vim-printer
let g:vim_printer_print_below_keybinding = '<leader>d'
let g:vim_printer_print_above_keybinding = '<leader>D'

" vimspector
let g:vimspector_enable_mappings = 'HUMAN'

" copilot
imap <silent><script><expr> <C-l> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true



" for normal mode - the word under the cursor
nmap <Leader>gdi <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>gdi <Plug>VimspectorBalloonEval

let g:vimspector_base_dir='/Users/varal7/.vim/plugged/vimspector'

let g:embark_terminal_italics = 1
let g:embark_terminalcolors = 1


" Don't forget to 
" :UpdateRemotePlugins
"
lua require("varal7")

set secure exrc

function! Timestamp()
  let timestamp = strftime("%c")
  call setpos(".", [0, 0, 0])
  call setline(1, timestamp)
endfunction

nnoremap <silent> <leader>ts :call Timestamp()<cr>

" search for the visual selection
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>N

" FZF stuff
if has('nvim')
    let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
endif
nmap <c-p> :GFiles<cr>
nmap <leader>rr :Rg<space>

" fzf
" let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'
"
 "--preview '/home/francisco/scripts/batcat --style=numbers --line-range :300 {}'
 "
let $FZF_DEFAULT_OPTS="--bind ctrl-a:select-all --preview-window 'right:57%'
\ --bind ctrl-y:preview-up,ctrl-e:preview-down,
\ctrl-b:preview-page-up,ctrl-f:preview-page-down,
\ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down,
\shift-up:preview-top,shift-down:preview-bottom,
\alt-up:half-page-up,alt-down:half-page-down"

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" set shell=bash\ -i " let me use by bash aliases in vim

" nmap <leader>x yyp:.!bash<CR>
nmap <leader>x :exec 'r!'.getline('.')<CR>



" imap <C-x> <Plug>(lama-toggle)
" nmap <C-x> <Plug>(lama-toggle)

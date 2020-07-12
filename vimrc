set nocompatible              " be iMproved, required
filetype off                  " required
" Load vim-plug
if empty(glob("~/.local/share/nvim/site/autoload/plug.vim"))
    execute '!curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif


call plug#begin('~/.vim/plugged')


"Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
"Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
"Plug 'davidhalter/jedi-vim'
"Plug 'edkolev/tmuxline.vim'
"Plug 'ervandew/supertab'
"Plug 'ludovicchabant/vim-gutentags'
"Plug 'ryanoasis/vim-devicons'
"Plug 'sjbach/lusty'
"Plug 'szymonmaszke/vimpyter' "Vundle
"Plug 'vim-scripts/LycosaExplorer' " requires python2
"Plug 'vim-syntastic/syntastic'
"Plug 'yuttie/comfortable-motion.vim'
"Plugin 'CtrlP/ctrlp.vim'



Plug 'HerringtonDarkholme/yats.vim'
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'aserebryakov/vim-todo-lists'
Plug 'chrisbra/csv.vim'
Plug 'elzr/vim-json'
Plug 'google/vim-jsonnet'
Plug 'gregsexton/gitv', {'on': ['Gitv']}
Plug 'honza/vim-snippets'
Plug 'jph00/swift-apple'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-sneak'
Plug 'leafgarland/typescript-vim'
Plug 'lervag/vimtex'
Plug 'liuchengxu/vista.vim'
Plug 'luochen1990/rainbow'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'mileszs/ack.vim'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'scrooloose/nerdcommenter'
" Plug 'symphorien/dwm.vim'
Plug 'tell-k/vim-autoflake'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
" Plug 'tpope/vim-vinegar'
Plug 'varal7/vim-slime'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/ttcoach'
Plug 'w0rp/ale'
Plug 'wakatime/vim-wakatime'
Plug 'will133/vim-dirdiff'
Plug 'digitaltoad/vim-pug'
" Plug 'SirVer/ultisnips'
call plug#end()

" Vim load indentation rules and plugins
" according to the detected filetype.
filetype plugin indent on    " required

"set background=light
set background=dark
colorscheme gruvbox
let g:gruvbox_italic=0

" true colors in vim
set termguicolors

" comment in italic
"highlight Comment cterm=italic


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
set number		" Show line number
set expandtab		" Convert tabs into spaces
set backspace=indent,eol,start
set shiftround
set showmode
set ruler
set autoindent
set title

set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab

" Always show statusline
set laststatus=2

"" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.


" Make life easier

inoremap jk <Esc>
inoremap Jk <Esc>
let mapleader = ","
let maplocalleader = "\\"
"cnoremap W w
"cnoremap Q q
cnoremap Wq wq
cnoremap WQ wq

" let @v = '"nyy"np:s/train/val/g"np:s/train/test/g:noh'
" let @d = '"nyy"np:s/train/dev/g"np:s/train/test/g:noh'
" let @p = ':set paste"*p:set nopaste'
" let @y = '"+y'
" let @r = ':wa:!chmod +x "%" && ./"%"'

nnoremap gbc yypkA =<Esc>jOscale=2<Esc>:.,+1!bc<CR>kJ
nnoremap gp :set paste<CR>
nnoremap gu :set nopaste<CR>

"" Allow saving of files as sudo when I forgot to start vim using sudo.
cnoremap w!! w !sudo tee > /dev/null %

"" Remove trailing spaces and trailing lines
autocmd FileType c,cpp,java,php,python,tex,javascript autocmd BufWritePre <buffer> %s/\s\+$//e
autocmd FileType python,java setlocal shiftwidth=4 softtabstop=0 expandtab


" uncomment next line to have feedback on vimtex compilation
let g:vimtex_compiler_progname = 'nvr'
let g:tex_flavor = "latex"

" Have a the absolute line number and the relative line number
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" reload vimrc on load
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc,init.vim so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

"set splitbelow
"set splitright

" For pasting
"let &t_SI .= "\<Esc>[?2004h"
"let &t_EI .= "\<Esc>[?2004l"

"inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

"function! XTermPasteBegin()
  "set pastetoggle=<Esc>[201~
  "set paste
  "return ""
"endfunction


" Slime

let g:slime_no_mappings = 1 "disable default mappings
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "code:.0"}
let g:slime_dont_ask_default = 1
let g:slime_python_ipython = 1
let g:slime_preserve_curpos = 1

"Easily choose what pane to send to
command! Code let b:slime_config = {"socket_name": "default", "target_pane": "code:.0"}
command! Cur let b:slime_config = {"socket_name": "default", "target_pane": ":.0"}

" command! Cur1 let b:slime_config = {"socket_name": "default", "target_pane": ":.1"}
" command! Cur2 let b:slime_config = {"socket_name": "default", "target_pane": ":.2"}
" command! Cur3 let b:slime_config = {"socket_name": "default", "target_pane": ":.3"}

function! Cur(...)
  let pane = a:0 >= 1 ? a:1 : 0
  let b:slime_config = {"socket_name": "default", "target_pane": ":." . pane}
  :echom b:slime_config['target_pane']
endfunction


nmap <leader>t0 :call Cur(0)<CR>
nmap <leader>t1 :call Cur(1)<CR>
nmap <leader>t2 :call Cur(2)<CR>
nmap <leader>t3 :call Cur(3)<CR>
nmap <leader>t4 :call Cur(4)<CR>

let @s = '^"wdt,x:call Cur(w),,j'

nmap <leader>v <Plug>SlimeConfig
nmap <leader>a <Plug>SlimeSendCC

"In visual mode, send selection
xmap <leader><leader> <Plug>SlimeRegionSend
xmap <leader>f <Plug>SlimeRegionSend`>}}{j

"In normal mode, send paragraph
nmap <leader>f <Plug>SlimeParagraphSend}}{j
"In insert mode, send paragraph
"imap <localleader>f <Esc><S-v><Plug>SlimeParagraphSend}a

""In normal mode, send current line
nmap <leader><leader> <S-v><Plug>SlimeRegionSend
""In insert mode, send current line
"imap `` <Esc><S-v><Plug>SlimeRegionSend jI

" New noremappings to move around cell
nmap <leader>j /# %%<CR>j:noh<CR>
nmap <leader>k k?# %%<CR>j:noh<CR>

nmap <leader>d o# %%<Esc>O<Esc>
nmap <leader>D O# %%<Esc>o<Esc>
"imap `d <CR># %%<CR><Esc>kk

nmap <leader>S j?# %%<CR>jv/# %%<CR>k$<leader><leader>:noh<CR>
nmap <leader>s <leader>S<leader>jzz
nmap <leader>= ^"ayt=o<Esc>"ap

" Fold with space
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

"toggle UndoTree
nnoremap <leader>u :UndotreeToggle<cr>



" Rainbow
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

" YouCompleteMe
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
"nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
"nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nnoremap <leader>gd :YcmCompleter GetDoc<CR>

" Fugitive: Open QuickFix window after grep
"
" autocmd QuickFixCmdPost *grep* cwindow

"Close quickfix
nnoremap <BS>q :cclose<CR>
"Close location list
nnoremap <BS>l :lclose<CR>
"Open quickfix
nnoremap <CR>q :cwindow<CR>
"Open location list
nnoremap <CR>l :lwindow<CR>

set statusline+=%{coc#status()}

nnoremap <leader>m :SyntasticToggleMode<CR>

" Tagbar
"
nmap <leader>b :TagbarToggle<CR>


" Ultisnips

" Why is this not working???
let g:UltiSnipsSnippetsDir = "~/dotfiles/UltiSnips"
let g:UltiSnipsSnippetDirectories=["UltiSnips", $HOME.'/dotfiles/UltiSnips']

" dwm.vim (Tiled window manager)

let g:dwm_map_keys = 0
nmap <C-W>= <Plug>DWMFocus
"nmap <C-C> <Plug>DWMClose
"nmap <C-w> <Plug>DWMRotateCounterclockwise

nnoremap <C-J> <C-W>w
nnoremap <C-K> <C-W>W
nmap <C-N> :vsplit<CR>
nmap <C-C> :close<CR>

"nmap <C-e> <Plug>DWMRotateClockwise " no need for that
" heck, do terminal too
"tmap <C-w> <Plug>DWMRotateCounterclockwise
"tmap <C-I> <Plug>DWMFocus

" terminal
" nmap <leader>t :terminal<CR>

" On enter, saves normal buffer to file
nmap <silent><expr> <CR> empty(&buftype) ? ":w<CR>" : "<CR>"
" gets last command
nmap <localleader><localleader> :<UP>

"executes current file
"nmap <localleader><localleader> :!./%

" arrows for pane
nmap <left> :tabp<CR>
nmap <right> :tabn<CR>

" airline theme

let g:airline_theme='bubblegum'

" camelCase to snake_case
" %s/\(\l\)\(\u\)/\1\_\l\2/gc

autocmd filetype crontab setlocal nobackup nowritebackup


"Try label-mode for a minimalist alternative to EasyMotion:
let g:sneak#label = 1

" fzf as C-P
nmap <C-p> :Files<CR>
nmap <C-f> :Rg<CR>
nmap <C-b> :Buffers<CR>
nmap <C-g> :Rg <C-R><C-W><CR>
nmap <C-s> :Lines<CR>
" fzf like lusty
nmap <leader>lr :Files %:p:h<CR>
nmap <leader>lb :Buffers<CR>
nmap <leader>lf :Files<CR>

" Autochangedir to that with .git
let g:rooter_patterns = ['.git/']

" for vim git gutter
set updatetime=100
nmap ]g <Plug>(GitGutterNextHunk)
nmap [g <Plug>(GitGutterPrevHunk)


"netrw
" nmap - :Vexplore<CR>
nmap - :Explore<CR>
let g:netrw_banner = 0

" Nerd-tree like
let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 25
"augroup ProjectDrawer
""autocmd!
""autocmd VimEnter * :Vexplore
"augroup END

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


"Ale
let g:ale_linters = {
      \         'python': ['pycodestyle', 'pylint', 'mypy'],
\}

let g:ale_fixers = {
      \  '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'javascript': [],
      \ 'typescript': ['eslint', 'prettier'],
\ 'python': ["yapf"],
\}

let g:ale_echo_msg_format = '%linter% says %s'

" let g:ale_fix_on_save = 1
let g:ale_fix_on_save = 0

"autocmd FileType c,cpp,java,php,python,tex,typescript autocmd BufWritePre <buffer> call ALEFix()

nnoremap <leader>at :ALEToggle<CR>

"Rhubarb
let g:github_enterprise_urls = ['https://github.mit.edu']

function! ToggleDiff()
 if (&diff == 0)
   windo diffthis
 else
   diffoff!
 endif
endfunction
nnoremap <leader>w :call ToggleDiff()<cr>

" Coc.vim

let g:coc_global_extensions = [
      \  'coc-json',
      \  'coc-neosnippet',
      \  'coc-snippets',
      \  'coc-tsserver',
      \  'coc-ultisnips',
      \  'coc-tabnine',
      \  'coc-pairs',
      \  'coc-python',
      \  'coc-vimtex',
      \  'coc-highlight'
      \ ]

" Better display for messages

set cmdheight=2
set signcolumn=yes
nmap [c <Plug>(coc-diagnostic-prev)
nmap ]c <Plug>(coc-diagnostic-next)

nmap ]k :CocNext<CR>
nmap [k :CocPrev<CR>

nmap <leader>rn <Plug>(coc-rename)

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap keys for gotos
nmap  gd <Plug>(coc-definition)
nmap  gy <Plug>(coc-type-definition)
nmap  gi <Plug>(coc-implementation)
nmap  gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap  K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold *  call CocActionAsync('highlight')


" Remap for format selected region
"vmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


" airline integration with coc.vim
"let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
"let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" Using CocList
" Show all diagnostics
nnoremap  <localleader>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap  <localleader>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap  <localleader>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap  <localleader>o  :<C-u>CocList outline<cr>
" Search worklocalleader symbols
nnoremap  <localleader>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap  <localleader>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap  <localleader>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap  <localleader>p  :<C-u>CocListResume<CR>

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" <leader>Enter to turn hl off
nnoremap <leader><CR> :noh<CR>

"Workaround until fixed in neovim
augroup secure_modeline_conflict_workaround
  autocmd!
  autocmd FileType help setlocal nomodeline
augroup END

imap <C-u> <Esc>viwUea

nnoremap <leader>ev :vsplit $MYVIMRC<cr>

iabbrev improt import

" Fugitive

nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gt :Gcommit -v -q %:p<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <leader>gp :Ggrep<leader>
nnoremap <leader>gm :Gmove<leader>
nnoremap <leader>gb :Git branch<leader>
nnoremap <leader>go :Git checkout<leader>
nnoremap <leader>gps :Dispatch! git push<CR>
nnoremap <leader>gpl :Dispatch! git pull<CR>

nnoremap <leader>af :ALEFix<CR>

" Easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Typescript tags
let g:tagbar_type_typescript = {
  \ 'ctagsbin' : 'tstags',
  \ 'ctagsargs' : '-f-',
  \ 'kinds': [
    \ 'e:enums:0:1',
    \ 'f:function:0:1',
    \ 't:typealias:0:1',
    \ 'M:Module:0:1',
    \ 'I:import:0:1',
    \ 'i:interface:0:1',
    \ 'C:class:0:1',
    \ 'm:method:0:1',
    \ 'p:property:0:1',
    \ 'v:variable:0:1',
    \ 'c:const:0:1',
  \ ],
  \ 'sort' : 0
\ }

" NerdCommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Leetcode

nnoremap <leader>lt :Dispatch -compiler=ignore leetcode test % && read<cr>
nnoremap <leader>ls :Dispatch -compiler=ignore leetcode submit % && read<cr>
nnoremap <leader>ld :LeetShow<CR>
command! LeetShow let b:id = split(expand("%:r:p"), '\.')[0] | execute "Start -compiler=ignore leetcode show " b:id " && read"

" Match python functions
" syntax match pythonFunction /\v([^[:cntrl:][:space:][:punct:][:digit:]]|_)([^[:cntrl:][:punct:][:space:]]|_)*\ze(\s?\()/
"
function! Done()
  :normal gg"*yG
  quit!
endfunction


" nnoremap <leader>vd :call Done()<CR>
" nnoremap <leader>ft :set filetype=

" Clears jupyter notebooks
function! ClearNb()
  %s/\n\# In\[.*$\n\n\n//g
endfunction

command! ClearNb :call ClearNb()

nmap <Leader>j "=system('gitmoji-selector')<C-M>P

let  g:python3_host_prog = "/data/rsg/nlp/quach/miniconda3/envs/py365/bin/python"

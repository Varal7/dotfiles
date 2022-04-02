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

nmap <leader>qq  :set relativenumber!<CR>

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
tnoremap jk <C-\><C-n>

let mapleader = ","
let maplocalleader = "\\"

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

" uncomment next line to have feedback on vimtex compilation
let g:vimtex_compiler_progname = 'nvr'
let g:tex_flavor = "latex"
let g:vimtex_view_method = 'skim'

let g:vimtex_quickfix_ignore_filters = [
  \ 'Warning',
  \ 'Underfull',
  \ 'Overfull'
\]


"" <localleader>ll to start compilation
"" <localleader>lv to show pdf
"" <localleader>lr to refresh preview
nnoremap <localleader>lr :!osascript ~/bin/refresh.scpt<CR>


" reload vimrc on load
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc,init.vim so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" Fold with space
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

"toggle UndoTree
nnoremap <leader>u :UndotreeToggle<cr>

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


" Tagbar
"
nmap <leader>b :TagbarToggle<CR>

nnoremap <C-J> <C-W>w
nnoremap <C-K> <C-W>W
nmap <C-N> :vsplit<CR>
nmap <C-C> :close<CR>

" gets last command
nmap <localleader><localleader> :<UP>

" arrows for pane
nmap <left> :tabp<CR>
nmap <right> :tabn<CR>


" camelCase to snake_case
" %s/\(\l\)\(\u\)/\1\_\l\2/gc

autocmd filetype crontab setlocal nobackup nowritebackup

"Try label-mode for a minimalist alternative to EasyMotion:
let g:sneak#label = 1

nnoremap <silent><C-f> :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <silent><C-g> :lua require('telescope.builtin').grep_string({ search = vim.fn.expand("<cword>") })<CR>
nnoremap <silent><C-_> :lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>
nnoremap <silent><C-b> :lua require('telescope.builtin').buffers()<CR>
nnoremap <silent><C-q> :lua require('telescope.builtin').quickfix()<CR>
nnoremap <silent><C-p> :lua require('telescope.builtin').find_files({ hidden = true})<CR>

nnoremap <silent><leader>lr :lua require('telescope.builtin').find_files({ no_ignore= true})<CR>
nnoremap <silent><leader>vh :lua require('telescope.builtin').help_tags()<CR>

" Autochangedir to that with .git
let g:rooter_patterns = ['.git/']


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

xnoremap <leader>p "_dP

" greatest remap ever
xnoremap <localleader>p "_dP

" Put from capture
nnoremap <leader>ret :r /tmp/capture.out<CR>


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
"

let g:coc_global_extensions = [
      \  'coc-json',
      \  'coc-clangd',
      \  'coc-neosnippet',
      \  'coc-snippets',
      \  'coc-tsserver',
      \  'coc-tabnine',
      \  'coc-pairs',
      \  'coc-git',
      \  'coc-lists',
      \  'coc-vimtex',
      \  'coc-prisma',
      \  'coc-eslint',
      \  'coc-explorer',
      \  'coc-pyright',
      \  'coc-solidity'
      \ ]

      " \  'coc-highlight',

" " navigate chunks of current buffer
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
" show chunk diff at current position
nmap gs <Plug>(coc-git-chunkinfo)
" show commit contains current position
nmap gc <Plug>(coc-git-commit)
" create text object for git chunks
omap ig <Plug>(coc-git-chunk-inner)
xmap ig <Plug>(coc-git-chunk-inner)
omap ag <Plug>(coc-git-chunk-outer)
xmap ag <Plug>(coc-git-chunk-outer)


" Better display for messages
set statusline+=%{coc#status()}
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" airline integration with coc.vim
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

set cmdheight=2
set signcolumn=yes
nmap [c <Plug>(coc-diagnostic-prev)
nmap ]c <Plug>(coc-diagnostic-next)

nmap ]k :CocNext<CR>
nmap [k :CocPrev<CR>

nmap <leader>rn <Plug>(coc-rename)

" Use <c-t> to trigger completion.
inoremap <silent><expr> <c-t> coc#refresh()

nnoremap <leader>cmd :CocCommand<CR>

" Open explorer
nnoremap <space>e :CocCommand explorer<CR>
nnoremap - :CocCommand explorer<CR>

highlight link CocErrorSign GruvboxRed
" highlight link CocWarningSign
" highlight link CocWarningSign
" highlight link CocInfoSign
" highlight link CocHintSign


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
nmap gh :CocCommand clangd.switchSourceHeader<CR>

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

" Map function and class text objects
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)


" Remap for format selected region
vmap <localleader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

command! -nargs=0 Format :call CocAction('format')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end



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
nnoremap <leader><Space> :noh<CR>

"Workaround until fixed in neovim
" cf https://github.com/neoclide/coc.nvim/issues/668
" cf https://github.com/neovim/neovim/issues/9881
augroup secure_modeline_conflict_workaround
  autocmd!
  autocmd FileType help setlocal nomodeline
augroup END

nnoremap <leader>ev :vsplit $MYVIMRC<cr>

iabbrev improt import

" Fugitive
nnoremap <leader>gbr :lua require('telescope.builtin').git_branches()<CR>
nnoremap <leader>gfs :lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>gbl :Git blame<CR>
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gl :Git --paginate lg1<CR>
nnoremap <leader>gp :Git push -u<CR>
nnoremap <leader>gd :Gdiff<CR>
" use gd on a file to open vimdiff
" then use
nnoremap <leader>gj :diffget //3<CR>
nnoremap <leader>gk :diffget //2<CR>


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

let s:host_vimrc = $HOME . '/.local-vimrc'
if filereadable(s:host_vimrc)
  execute 'source ' . s:host_vimrc
endif

" remove background
hi Normal guibg=NONE ctermbg=NONE

" inccommand shows you in realtime what changes your ex command should make. Right now it only supports s
set inccommand=nosplit

" telescope.lua

lua <<EOF
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local previewers = require("telescope.previewers")
local action_state = require("telescope.actions.state")
local conf = require("telescope.config").values
local actions = require("telescope.actions")

require("telescope").setup({
	defaults = {
		file_sorter = require("telescope.sorters").get_fzy_sorter,
		prompt_prefix = " >",
		color_devicons = true,

		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

		mappings = {
			i = {
				["<C-x>"] = false,
				["<C-q>"] = actions.send_to_qflist,
			},
		},
	},
	extensions = {
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		},
	},
})

require("telescope").load_extension("fzy_native")
EOF

" treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
EOF

" Help files on right split
augroup helpfiles
  au!
  au BufRead,BufEnter */doc/* wincmd L
augroup END


" harpoon
nnoremap <silent><leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <silent><C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <silent><leader>tc :lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>

nnoremap <silent><leader>1 :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <silent><leader>2 :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <silent><leader>3 :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <silent><leader>4 :lua require("harpoon.ui").nav_file(4)<CR>

" Slime-like stuff

" Send to tmux with vim-slime

let g:slime_no_mappings = 1 "disable default mappings
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{up-of}"}
let g:slime_dont_ask_default = 1
let g:slime_python_ipython = 1
let g:slime_preserve_curpos = 1

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

"In visual mode, send selection
xmap <leader><leader> <Plug>SlimeRegionSend
nmap <leader><leader> <S-v><Plug>SlimeRegionSend

"Find what's before =
nmap <leader>= ^"ayt=o<Esc>"ap

" vim-printer
let g:vim_printer_print_below_keybinding = '<leader>d'
let g:vim_printer_print_above_keybinding = '<leader>D'


" Send to terminal with harpoon
nmap <localleader>" :lua require("harpoon.term").gotoTerminal({idx=1, create_with="split \| terminal"})<CR>
vmap <localleader><localleader> "zy<CR>:lua require("harpoon.term").sendCommand(1,  vim.fn.getreg('"'))<CR>
nmap <localleader><localleader> <S-v>"zy<CR>:lua require("harpoon.term").sendCommand(1,  vim.fn.getreg('"'))<CR>

" Send to terminal with nvim-send-to-term
let g:send_disable_mapping=1	
nmap <leader>" :split \| term <CR>iipy<CR>jk:SendHere ipy<CR><C-w>j
nmap <leader>s <Plug>SendLine
vmap <leader>s <Plug>Send
nmap <leader>h <C-w>k:SendHere ipy<CR><C-w>j

" Don't forget to 
" :UpdateRemotePlugins

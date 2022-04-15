" Coc.vim

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
      \  'coc-prettier',
      \  'coc-explorer',
      \  'coc-pyright',
      \  'coc-solidity'
      \ ]


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

set cmdheight=1
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

"Workaround until fixed in neovim
" cf https://github.com/neoclide/coc.nvim/issues/668
" cf https://github.com/neovim/neovim/issues/9881
augroup secure_modeline_conflict_workaround
  autocmd!
  autocmd FileType help setlocal nomodeline
augroup END


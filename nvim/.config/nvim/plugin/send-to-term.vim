" Send to terminal with nvim-send-to-term
let g:send_disable_mapping=1	
nmap <leader>" :split \| term <CR>iipy<CR>jk:SendHere ipy<CR><C-w>j
nmap <leader>s <Plug>SendLine
vmap <leader>s <Plug>Send
nmap <leader>h <C-w>k:SendHere ipy<CR><C-w>j


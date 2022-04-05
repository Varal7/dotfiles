" harpoon
nnoremap <silent><leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <silent><C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <silent><leader>tc :lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>

nnoremap <silent><leader>1 :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <silent><leader>2 :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <silent><leader>3 :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <silent><leader>4 :lua require("harpoon.ui").nav_file(4)<CR>

" Send to terminal with harpoon
nmap <localleader>" :lua require("harpoon.term").gotoTerminal({idx=1, create_with="split \| terminal"})<CR>
nmap <leader>tt :lua require("harpoon.term").gotoTerminal({idx=1})<CR>
vmap <localleader><localleader> "zy<CR>:lua require("harpoon.term").sendCommand(1,  vim.fn.getreg('"'))<CR>
nmap <localleader><localleader> <S-v>"zy<CR>:lua require("harpoon.term").sendCommand(1,  vim.fn.getreg('"'))<CR>


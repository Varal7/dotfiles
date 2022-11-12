" harpoon
nnoremap <silent><leader>m :lua require("harpoon.mark").add_file()<CR>
nnoremap <silent><C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>

nnoremap <silent><leader>1 :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <silent><leader>2 :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <silent><leader>3 :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <silent><leader>4 :lua require("harpoon.ui").nav_file(4)<CR>

nnoremap <silent><leader>tc :lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>
nnoremap <silent><leader>e :lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>
" Send to terminal with harpoon
nmap <leader>tt :lua require("harpoon.term").gotoTerminal({idx=1})<CR>
nmap <leader>t1 :lua require("harpoon.term").sendCommand(1, 1)<CR>
nmap <leader>t2 :lua require("harpoon.term").sendCommand(1, 2)<CR>
nmap <leader>t3 :lua require("harpoon.term").sendCommand(1, 3)<CR>


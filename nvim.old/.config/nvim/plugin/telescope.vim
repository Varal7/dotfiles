" nnoremap <silent><C-f> :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
" Ctrl+/ to search in file
nnoremap <silent><C-_> :lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>
nnoremap <silent><C-b> :lua require('telescope.builtin').buffers()<CR>
nnoremap <silent><C-q> :lua require('telescope.builtin').quickfix()<CR>
nnoremap <silent><C-p> :lua require('telescope.builtin').find_files({ hidden = true})<CR>
nnoremap <silent><leader>fg :lua require('varal7.telescope').project_files()<CR>
nnoremap <silent><leader>ff :lua require('telescope.builtin').find_files()<CR>
nnoremap <silent><leader>fr :lua require('telescope.builtin').oldfiles()<CR> 
nnoremap <silent><leader>fg :lua require('varal7.telescope').project_files()<CR>

nnoremap <silent><leader>fsf :lua require('telescope.builtin').find_files({ hidden = true})<CR>
nnoremap <silent><leader>fw :lua require('telescope.builtin').live_grep()<CR>
nnoremap <silent><leader>fc :lua require('telescope.builtin').grep_string({ search = vim.fn.expand("<cword>")})<CR>
nnoremap <silent><leader>fb :lua require('telescope.builtin').buffers()<CR>

nnoremap <silent><leader>lr :lua require('telescope.builtin').find_files({ no_ignore = true})<CR>
nnoremap <silent><leader>vh :lua require('telescope.builtin').help_tags()<CR>

nnoremap <leader>gb :lua require('telescope.builtin').git_branches()<CR>
nnoremap <leader>gs :lua require('telescope.builtin').git_status()<CR>
nnoremap <leader>gff :lua require('telescope.builtin').git_files()<CR>

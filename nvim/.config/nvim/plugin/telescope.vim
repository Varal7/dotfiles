nnoremap <silent><C-f> :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <silent><C-g> :lua require('telescope.builtin').grep_string({ search = vim.fn.expand("<cword>") })<CR>
nnoremap <silent><C-_> :lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>
nnoremap <silent><C-b> :lua require('telescope.builtin').buffers()<CR>
nnoremap <silent><C-q> :lua require('telescope.builtin').quickfix()<CR>
nnoremap <silent><C-p> :lua require('varal7.telescope').project_files()<CR>
" nnoremap <silent><C-p> :lua require('telescope.builtin').find_files({ hidden = true})<CR>

nnoremap <silent><leader>lr :lua require('telescope.builtin').find_files({ no_ignore= true})<CR>
nnoremap <silent><leader>vh :lua require('telescope.builtin').help_tags()<CR>

nnoremap <leader>gbr :lua require('telescope.builtin').git_branches()<CR>
nnoremap <leader>gfs :lua require('telescope.builtin').git_files()<CR>



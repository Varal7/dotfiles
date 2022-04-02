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

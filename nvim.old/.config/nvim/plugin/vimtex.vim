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

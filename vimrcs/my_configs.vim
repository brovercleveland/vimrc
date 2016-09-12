set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set pastetoggle=<f2>
let g:tex_flavor = "latex"

""" Set next (previous) buffer to Alt-p (o).
""" Alt key is treated differently in OSX vs. Linux.
if has("unix")
    let s:uname = system("uname -s")
    if s:uname =~ "Darwin"
        nnoremap π :bn<cr> 
        nnoremap ø :bp<cr>
    else
        exec "set <M-O>=\eo"
        exec "set <M-P>=\ep"
        nnoremap <M-P> :bn<cr>
        nnoremap <M-O> :bp<cr>
    endif
endif


"""""""""""""""""""""""""""
""" Split Screen mappings 
"""""""""""""""""""""""""""
" Map space to split screen cycle
nmap <Space> <C-w><C-w>
nnoremap <silent> <C-w><C-w> <C-w><C-w>:if &buftype ==# 'nofile'<Bar>wincmd w<Bar>endif<CR>
let nbuff = len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))

" Open split screens for various scenarios 
function! Split_if_big() 
    if line('$') > 100
        split
    endif
endfunction

function! Split_if_many() 
    below sbn
    wincmd p
endfunction

if nbuff>1
    au VimEnter * nested call Split_if_many() 
else
    au VimEnter * nested call Split_if_big()
endif



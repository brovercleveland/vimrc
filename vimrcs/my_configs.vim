set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set pastetoggle=<f2>
" The following two maps will not work on linux
nnoremap ∏ :bn<cr> 
nnoremap Ø :bp<cr>
let g:tex_flavor = "latex"

""""" My Attempt at custom splitscreen mapping and actions
nmap <Space> <C-w><C-w>
nnoremap <silent> <C-w><C-w> <C-w><C-w>:if &buftype ==# 'nofile'<Bar>wincmd w<Bar>endif<CR>
let nbuff = len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))

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



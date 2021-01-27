set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set pastetoggle=<f2>
let g:tex_flavor = "latex"

""" Set next (previous) buffer to Alt-p (o).
""" Alt key is treated differently in OSX vs. Linux.
let s:uname = system("uname -s")
if s:uname =~ "Darwin"
    nnoremap π :bn<cr> 
    nnoremap ø :bp<cr>
else
    exec "set <M-O>=\eo"
    exec "set <M-P>=\ep"
    nnoremap <M-P> :bn<cr>
    nnoremap <M-O> :bp<cr>
    nnoremap π :bn<cr> 
    nnoremap ø :bp<cr>
    "nnoremap <M-P> :bn<cr> 
    "nnoremap <M-O> :bp<cr>
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


""""""""""""""""""""""""""
""" Clipboard Yanks
""""""""""""""""""""""""""
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

"""""""""""""""""""""""""
""" -X startup option
"""""""""""""""""""""""""
"-X          Do not try connecting to the X server to get the current
"            window title and copy/paste using the X clipboard.  This
"            avoids a long startup time when running Vim in a terminal
"            emulator and the connection to the X server is slow.
"            See --startuptime to find out if affects you.
"            Only makes a difference on Unix or VMS, when compiled with the
"            +X11 feature.  Otherwise it's ignored.
"            To disable the connection only for specific terminals, see the
"            'clipboard' option.
"            When the X11 Session Management Protocol (XSMP) handler has
"            been built in, the -X option also disables that connection as
"            it, too, may have undesirable delays.
set clipboard=exclude:.*

""""""""""""""""
"Fix Python compile issue?
"

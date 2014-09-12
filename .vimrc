" 
map \wr <Esc>:w<CR>:! python %:p<CR>

" Save and run Rubber (LaTeX)
map \wx <Esc>:w<CR>:! rubber --pdf %:p<CR>

" Python tab stuff
set modeline
set ls=2
set expandtab
set tabstop=4
set shiftwidth=4
set scrolloff=4

" Title of terminal
set title

" tmux fixes "
""""""""""""""
" Handle tmux $TERM quirks in vim
"if $TERM =~ '^screen-256color'
    "map <Esc>OH <Home>
    "map! <Esc>OH <Home>
    "map <Esc>OF <End>
    "map! <Esc>OF <End>
"endif
"
set cursorline
syntax on

set esckeys
"set background=dark
set t_Co=256
color luna-term

" airline
let g:airline#extensions#tabline#enabled = 1

" latex
filetype plugin on
filetype indent on
let g:tex_flavor='latex'
let g:tex_fold_enabled=1

" j and k move displayed lines
nnoremap <Down> gj
nnoremap <Up> gk
nnoremap 0 g0
nnoremap $ g$
nnoremap g0 0
nnoremap g$ $
"
"inoremap <Down> <Esc> gji
"inoremap <Up> <Esc> gki
"inoremap 0 g0
"inoremap $ g$
"inoremap g0 0
"inoremap g$ $
"

" Set pwd to open tab/file
autocmd BufEnter * lcd %:p:h

" Enable Pathogen
execute pathogen#infect()

" Quote word under cursor
nnoremap <leader>' viW<esc>a'<esc>gvo<esc>i'<esc>gvo<esc>3l

" Command for file tree
"map \f :NERDTreeToggle<CR>

" Folding
set foldmethod=indent
set foldlevel=99

" Tasklist (TODO)
map <leader>td <Plug>TaskList

" Line numbers OFF
":set nu!

" Toggle numbers on/off (for pasting etc?)
"nnoremap <silent><leader>n :set nu<cr>

" Need vim 7.3
"autocmd InsertEnter * :set number
"autocmd InsertLeave * :set relativenumber

" Auto-indent
set autoindent
set copyindent

" Allow pasting indenting
set pastetoggle=<F2>

function! TogglePyComment()
    
    let pos=getpos(".")
    let win=winsaveview()
    if getline(".") =~ '\s*\# '
        normal! ^2x
        let pos[2]-=1
    else 
        normal! I# 
        let pos[2]+=3
    endif
    call winrestview(win)
    call setpos(".",pos)
    startinsert
endfunction   

function! ToggleTexComment()
    
    let pos=getpos(".")
    let win=winsaveview()
    if getline(".") =~ '\s*% '
        normal! ^2x
        let pos[2]-=1
    elseif getline(".") =~ '\s*%'
        normal! ^x
        let pos[2]-=1
    else 
        normal! I% 
        let pos[2]+=3
    endif
    call winrestview(win)
    call setpos(".",pos)
    startinsert
endfunction   

autocmd Filetype python nnoremap <F3> <Esc>:call TogglePyComment()<CR><Esc>
autocmd Filetype tex nnoremap <F3> <Esc>:call ToggleTexComment()<CR><Esc>

map <silent> ]s :/\\\(sub\)\{,2}section\s*{<CR> :noh<CR>
map <silent> [s :?\\\(sub\)\{,2}section\s*{<CR> :noh<CR>

map <silent> ]d :/\<def\><CR> :noh<CR>
map <silent> [d :?\<def\><CR> :noh<CR>


" Comment (Python)
"map <F3> I# <Esc>       
" Uncomment (Python)
"map <F4> ^xx<Esc>      


" Line number toggle
set number
map <F4> :set nonumber!<cr>

map <F5> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1
let NERDTreeHighlightCursorline=1
map <F6> <Esc>ZZ<CR>

nnoremap <F7> :tabp <cr>
inoremap <F7> <Esc> :tabp <cr>
nnoremap <F8> :tabn <cr>
inoremap <F8> <Esc>:tabn <cr>

" Sublime-style movement of lines
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

set timeout ttimeoutlen=5

nnoremap <A-j> :m .+1<cr>
nnoremap <A-k> :m .-2<cr>

map <F9> <Esc> :noh <cr>

map <F12> <Esc> :set spell! spelllang=en_us <cr>

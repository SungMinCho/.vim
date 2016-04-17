syntax enable
syntax on

filetype plugin on
filetype indent plugin on
filetype indent on

call pathogen#infect()
call pathogen#helptags()

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

hi Search cterm=NONE ctermfg=black ctermbg=blue

let base16colorspace=256

Plugin 'valloric/youcompleteme'

autocmd vimenter *  wincmd p | Tlist 

let Tlist_Use_Right_Window = 1
let Tlist_Show_One_File = 1
let Tlist_Highlight_Tag_On_BufEnter = 1
let Tlist_Process_File_Always = 1
let Tlist_Auto_Update = 1

function! CheckLeftBuffers()
  if tabpagenr('$') == 1
    let i = 1
    while i <= winnr('$')
      if getbufvar(winbufnr(i), '&buftype') == 'help' ||
            \getbufvar(winbufnr(i), '&buftype') == 'quickfix' ||
            \exists('t:NERDTreeBufName') &&
            \bufname(winbufnr(i)) == t:NERDTreeBufName ||
            \bufname(winbufnr(i)) == '__Tag_List__'
         let i += 1
      else
        break
      endif
    endwhile
    if i == winnr('$') + 1
      qall
    endif
    unlet i
  endif
endfunction

autocmd BufEnter * call CheckLeftBuffers()

set nu
set ruler
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set showmatch
set mat=2
set background=dark

set noerrorbells
set novisualbell

set encoding=utf8
set ffs=unix,dos,mac

set nobackup
set nowb
set noswapfile

set expandtab
set smarttab
set shiftwidth=2
set tabstop=2

set si
set ai

set cursorline
hi CursorLine cterm=NONE ctermbg=blue ctermfg=black guibg=blue guifg=black

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:airline#extensions#tabline#enabled = 1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_quiet_messages={'level':'warnings'}
let g:syntastic_c_include_dirs = [ 'include', '../../../../include', '../../..' ]
let g:syntastic_cpp_include_dirs = [ 'include', '../../../../include', '../../..' ]

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <S-TAB> <C-W><C-W>

nnoremap <S-w> :w<return>
nnoremap <S-s> :wq<return>
nnoremap <S-q> :q!<return>

nmap s <Plug>(easymotion-bd-w)

nmap ; :CtrlPLine<CR>
nmap f :CtrlP<CR>
nmap b :CtrlPBuffer<CR>

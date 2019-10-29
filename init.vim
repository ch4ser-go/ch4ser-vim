" editor setting

set number
augroup relative_numbser
  autocmd!
  autocmd InsertEnter * :set norelativenumber
  autocmd InsertLeave * :set relativenumber
augroup END

set wildmenu

set ignorecase
set shell=/bin/bash

" font and icons for vim
set encoding=utf8
" set guifont=DroidSansMono\ Nerd\ Font\ 11

let mapleader="\<Space>"

autocmd VimEnter * :silent! loadview
" autocmd TabEnter * :silent! loadview
" autocmd WinNew * :silent! loadview

nnoremap ) $
nnoremap ( 0
nnoremap w :mkview<CR>:w!<CR>
nnoremap E W
nnoremap e w
nnoremap Q q
nnoremap q :mkview<CR>:q!<CR>
map R :w<CR>:call Runit()<CR>
func Runit()
    if &filetype == 'php'
    	exec "!time php %"
    elseif &filetype == 'python'
	exec "!time python %"
    elseif &filetype == 'javascript'
	exec "!time node %"
    elseif &filetype == 'c'
	exec "!gcc % -o output"
	exec "!time sudo ./output"
    elseif &filetype == 'cpp'
	exec "!g++ % -o output"
	exec "!time ./output"
    endif
endfunc
"
" set shift width
set shiftwidth=4
set pastetoggle=<F9>

map vs :vs 
map sp :sp 
map go :Goyo<CR>
map <leader>l <C-w>l
map <leader>h <C-w>h
map <leader>j <C-w>j
map <leader>k <C-w>k
map <leader>L <C-w>L
map <leader>H <C-w>H
map <leader>J <C-w>J
map <leader>K <C-w>K


nnoremap te :vs<CR>:te<CR>A
tnoremap <esc> <C-\><C-n>

" 关于多标签模式的设定

nnoremap tn :tabnew 
nnoremap L :tabnext<CR>
nnoremap H :tabprev<CR>
set foldmethod=indent
set foldlevel=99
"
" set cursorline 
" set cursorcolumn!
" highlight CursorLine cterm=NONE ctermbg=black ctermfg=green

"这段代码可以让每次打开文件的时候将光标定位到上一次所在的位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif



" Plug install
"
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'alvan/vim-closetag'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
Plug 'joshdick/onedark.vim'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'mattn/emmet-vim'
call plug#end()


" coc.nvim
"
"
let g:coc_global_extensions = ['coc-html','coc-css','coc-emmet','coc-python', 'coc-json', 'coc-tsserver','coc-snippets','coc-phpls','https://github.com/andys8/vscode-jest-snippets']

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
" set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" I modify this to enable tab-out function
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : (search('\%#[]>''")}]', 'n') ? '<Right>' : '<Tab>')

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use K to show documentation in preview window
" nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)
"
"
" airline theme
" if (empty($TMUX))
  " if (has("nvim"))
      " let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  " endif
  " if (has("termguicolors"))
      " set termguicolors
  " endif
" endif

" let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='murmur'
colorscheme onedark

hi! Pmenu ctermbg=black ctermfg=blue guibg=NONE guifg=#c6c8d1
hi! PmenuSbar ctermbg=NONE guibg=NONE
hi! PmenuSel ctermbg=black ctermfg=darkblue guibg=NONE guifg=#eff0f4
hi! PmenuThumb ctermbg=NONE guibg=NONE
hi! visual ctermbg=black ctermfg=red guibg=none
hi! wildmenu ctermbg=none ctermfg=234 guibg=none guifg=#17171b
hi! Search ctermbg=NONE ctermfg=darkgreen guibg=NONE guifg=#392313



" autopair setting
let g:AutoPairsShortcutJump = '<S-Tab>'
let g:AutoPairsShortcutFastWrap='<C-v>'

let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'


" bookmark setting
let g:bookmark_sign = '>>'
let g:bookmark_highlight_lines = 1
" unmap mp
nmap mN <Plug>BookmarkPrev

" nerdcomment setting
" comment followed a space
let g:NERDSpaceDelims=1
map <C-_> <Plug>NERDCommenterToggle


" nerdtree setting
map T :NERDTreeToggle<CR><leader>l

"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" taglist
map <leader>t :TlistToggle<CR> 
let Tlist_WinWidth=30        
let Tlist_Exit_OnlyWindow=1 
let Tlist_Use_Right_Window   = 0

" let Tlist_Show_One_File=1
let Tlist_File_Fold_Auto_Close=1

unmap <C-i>

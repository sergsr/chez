let mapleader = " "

" FILES & BUFFERS

noremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

nnoremap <leader>q :bd<CR>
nnoremap <leader>w :w<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MOVEMENT

set scrolloff=5

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AESTHETICS

set number relativenumber 
nnoremap <leader>n :set number! relativenumber!<CR>

set termguicolors
"
" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SEARCHES
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
set grepformat=%f:%l:%c:%m,%f:%l:%m
nnoremap <leader>g :silent lgrep<space>
nnoremap <leader>r :silent lgrep<space><cword><CR>

nnoremap <silent> [f :lprevious<CR>
nnoremap <silent> ]f :lnext<CR>
nnoremap <silent> [n :cprevious<CR>
nnoremap <silent> ]n :cnext<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS

call plug#begin()
  Plug 'wikitopian/hardmode'
  Plug 'tomasr/molokai'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'google/vim-maktaba'
  Plug 'SirVer/ultisnips'
call plug#end()

nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>

colorscheme molokai


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" language server protocol settings
set hidden
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'cpp': ['clangd'],
    \ }
let g:LanguageClient_autoStop = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-go settings
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_fields = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

autocmd FileType go nnoremap <leader>i :GoInfo<CR>
autocmd FileType go nnoremap <leader>a :GoAlternate<CR>
autocmd FileType go nnoremap <leader>t :GoTest<CR>
autocmd FileType go nnoremap <leader>b :GoBuild<CR>
autocmd FileType go :GoGuruScope ...

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocomplete settings
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctrl-p / file finding customization
if executable('fd')
  let g:ctrlp_user_command = 'fd --type f --color=never "" %s'
  let g:ctrlp_use_caching = 0
endif

let g:ctrlp_lazy_update = 1
let g:ctrlp_regexp = 1

let mapleader = " "

" FILES & BUFFERS

noremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

nnoremap <leader>q :bd<CR>
nnoremap <leader>w :w<CR>

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

" replace this with lazy.nvim, almost everyone recommends that nowadays
call plug#begin()
  Plug 'tomasr/molokai'
  Plug 'neovim/nvim-lspconfig'
  Plug 'mason-org/mason.nvim'
  Plug 'mason-org/mason-lspconfig.nvim'
  Plug 'mrcjkb/rustaceanvim'
  Plug 'numToStr/Comment.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate'}
  " need to make sure fd and fzf good for the next to be fast:
  "Plug 'ctrlpvim/ctrlp.vim'
  "Plug 'SirVer/ultisnips'
call plug#end()

colorscheme molokai
lua require('mason-config')
lua require('Comment').setup()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

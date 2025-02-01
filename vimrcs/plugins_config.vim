""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FZF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=/usr/local/opt/fzf
let g:fzf_launcher = 'newiterm_window %s'
let g:fzf_layout = { 'down': '~40%' }
map <leader>j :FZF<cr>

" call plug#begin('~/.vim_runtime/plugged')
"
" Plug 'flazz/vim-colorschemes'
" Plug 'preservim/nerdtree'
" Plug 'jlanzarotta/bufexplorer'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
" Plug 'itchyny/lightline.vim'
" Plug 'christoomey/vim-tmux-navigator'
" Plug 'othree/html5.vim'
" Plug 'pangloss/vim-javascript'
" Plug 'mxw/vim-jsx'
" Plug 'godlygeek/tabular'
" Plug 'leafgarland/typescript-vim'
" Plug 'evanleck/vim-svelte'
" Plug 'modille/groovy.vim'
" Plug 'neovim/nvim-lspconfig'
" Plug 'hrsh7th/nvim-cmp', { 'commit': 'b356f2c' }
" Plug 'hrsh7th/cmp-nvim-lsp'
" Plug 'williamboman/mason.nvim'
" Plug 'williamboman/mason-lspconfig.nvim'
" Plug 'hrsh7th/cmp-vsnip'
" Plug 'hrsh7th/vim-vsnip'
" Plug 'mhartington/formatter.nvim'
" Plug 'FabijanZulj/blame.nvim'
" Plug 'folke/trouble.nvim'
" Plug 'nvim-tree/nvim-web-devicons'
" Plug 'nvim-treesitter/nvim-treesitter'
" Plug 'ray-x/go.nvim'
" Plug 'ray-x/guihua.lua'
" Plug 'dhruvasagar/vim-table-mode'
" Plug 'chrisbra/csv.vim'
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
" Plug 'luckasRanarison/tailwind-tools.nvim'
"
" call plug#end()

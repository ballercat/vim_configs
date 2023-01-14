colorscheme wombat
set shiftwidth=2                " Use indents of 4 spaces
set tabstop=2                   " An indentation every four columns
set softtabstop=2               " Let backspace delete indent
set number
set foldmethod=indent
set cc=80
" set cursorline

highlight clear SignColumn      " SignColumn should match background
highlight clear LineNr          " Current line number row will have same background color in relative mode
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
highlight Comment cterm=italic


set wrap!
set ttyfast
set lazyredraw

" display special chars (eol, tab etc)
" set invlist
set cursorcolumn

" newline without insert
nmap <S-Enter> O<Esc>j
nmap <CR> o<Esc>k

" Clear whitespace on :w
autocmd BufWritePre * %s/\s\+$//e

" character 'put' no insert
nnoremap <Leader>i :exec "normal i".nr2char(getchar())."\e"<CR>

" the best
imap <Leader><Leader> <Esc>

" Allow for mouse scrolling
set mouse=a

" This is a bad spot for this
let g:instant_markdown_slow=1

" Table plugin
let g:table_mode_corner='|'

" Copy visual selection to clipboard
map <C-c> "+y

" Do not replace default register after paste
xnoremap p pgvy

" Copy relative file path to clipboard
noremap <Leader>yf :let @*=expand("%")<cr>:echo "Copied file to clipboard"<cr>

" Tab shortcuts
noremap <Leader>H :tabprevious<CR>
noremap <Leader>L :tabnext<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Change cursor based on mode!
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" bare iTerm
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" tmux
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" JSX highlight
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:jsx_ext_required = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autoload
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:reload_on_write = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Markdown preview
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let vim_markdown_preview_hotkey='<Leader>m'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Conflicted
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:diffget_local_map = 'gl'
let g:diffget_upstream_map = 'gu'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filefolder', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'], ['filetype'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}',
      \ },
      \ 'component_function': {
      \   'filefolder': 'LightlineFileFolder',
      \   'filename': 'LightLineFilename',
      \   'filetype': 'LightLineFiletype',
      \   'mode': 'LightLineMode',
      \   'fugitive': 'LightLineGit'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(&filetype!="help"&&exists("*fugitive#head") && ""!=fugitive#head())',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

function! IsNerdTree()
  return expand('%:t') =~ 'NERD_tree'
endfunction

function! LightLineGit()
  return IsNerdTree() ? '' : exists("*fugitive#head")? fugitive#head() : ''
endfunction

function! LightLineMode()
  return IsNerdTree() ? '' : winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! LightLineFilename()
  return IsNerdTree() ? '' : expand('%:t')
endfunction

function! LightlineFileFolder()
  return IsNerdTree() ? NERDStatus() : expand('%:h')
endfunction

function! LightLineFiletype()
  return IsNerdTree() ? '' : &filetype!=#""?&filetype:"no ft"
endfunction

function NERDStatus()
  return matchstr(getline('.'), '\\s$')
  " return getline('.')
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  let g:NERDTreeWinPos = "left"
  map <leader>F :NERDTreeFind<cr>
  let NERDTreeShowHidden=1
  let g:NERDTreeWinSize=45
  " autocmd vimenter * NERDTree
  augroup nerdtreehidecwd
      autocmd!
      autocmd FileType nerdtree setlocal conceallevel=3 | syntax match NERDTreeHideCWD #^[</].*$# conceal
  augroup end
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntax checker
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:ale_javascript_eslint_use_global = 1
let g:ale_javascript_eslint_executable = 'yarn'
let g:ale_javascript_eslint_options = 'lint'

let g:ale_sign_error = '!'
let g:ale_sign_warning = '?'
let g:ale_sign_column_always = 1
" Don't use eslint if it's not available
let g:ale_linters = { 'shell': ['shellcheck'] }
" if !empty(glob("node_modules/eslint/bin/eslint.js"))
  let g:ale_linters = { 'shell': ['shellcheck'], 'javascript': ['eslint'], 'typescriptreact': ['eslint'], 'typescript': ['eslint'] }
  let g:ale_javascript_flow_use_global = 0
" endif

let g:ale_fixers = {'javascript': ['prettier'], 'markdown': ['prettier'], 'typescript': ['prettier'], 'typescriptreact': ['prettier']}
let g:ale_fix_on_save = 1

let g:ale_completion_enabled = 1
let g:ale_completion_delay = 10

if !empty(glob(".prettierc"))
  " let g:ale_markdown_prettier_options = "--config .prettierrc"
endif

autocmd BufNewFile,BufRead *.kit set syntax=javascript
autocmd BufNewFile,BufRead *.walt set syntax=javascript

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags


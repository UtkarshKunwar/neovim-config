call plug#begin('~/.vim/plugged')

" I need that color
Plug 'flazz/vim-colorschemes'
Plug 'skielbasa/vim-material-monokai'

" vim-airline, the lean mean statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Icons
Plug 'ryanoasis/vim-devicons'

" Linting for vim
Plug 'dense-analysis/ale'

" Intellisense for vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Formatting
Plug 'Chiel92/vim-autoformat'

" Syntax/indent etc.
Plug 'sheerun/vim-polyglot'

" Forget trailing spaces
Plug 'ntpeters/vim-better-whitespace'

" Quoting/paranthesizing made simple
Plug 'tpope/vim-surround'

" Commenting things
Plug 'tpope/vim-commentary'

" Indentation guide
Plug 'yggdroot/indentline'

" NERD tree: a tree explorer
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Fuzzy file search
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" Detects indent settings on a file by file basis
Plug 'ciaranm/detectindent'

" Git diffs in gutter
Plug 'airblade/vim-gitgutter'

" Colored braces
Plug 'luochen1990/rainbow'

" Them easy-motion
Plug 'phaazon/hop.nvim'

" Better indented pasting
Plug 'sickill/vim-pasta'

" Code finder
Plug 'liuchengxu/vista.vim'

" I'm smooth as fuck boi
Plug 'yuttie/comfortable-motion.vim'

" Repeat stuff
Plug 'tpope/vim-repeat'

" To avoid jk mappings
Plug 'zhou13/vim-easyescape'

" Git commands
Plug 'tpope/vim-fugitive'

" Snippets
Plug 'honza/vim-snippets'

call plug#end()

" Appearance {{{
set background=dark
set termguicolors
let g:materialmonokai_italic=1
let g:materialmonokai_subtle_spell=1
let g:airline_theme='materialmonokai'
colorscheme material-monokai

" For relative number stuff
set relativenumber

" Yes, the space exists
set list lcs=tab:\¦\ 

" To break long lines
set breakindent
set breakindentopt=shift:2
set showbreak=↳

" Leading space characters
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'

" Rainbow bracket colors to match with the theme
let g:rainbow_active = 1
let rainbowcolors = ['hotpink3', 'cyan', 'mediumpurple', 'yellow']
let g:rainbow_conf = {'guifgs': rainbowcolors}

let g:colorizer_auto_filetype='css,html,vim'
let g:colorizer_skip_comments = 1

" JSON comment highlighting
autocmd FileType json syntax match Comment +\/\/.\+$+

" Icons
let g:lightline#bufferline#enable_devicons = 1
" }}}

" Ale {{{
let g:ale_lint_on_buffer_change = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['flake8']}
let g:ale_python_flake8_options = '--ignore=E1,E23,W503'
let g:ale_fixers = {'python': ['black', 'isort']}
let g:ale_fix_on_save = 1
let g:airline#extensions#ale#enabled = 1
" }}}

" Formatting {{{
set tabstop     =4
set softtabstop =4
set shiftwidth  =4
set expandtab
" }}}

" Exploring {{{
" NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" Opens NERDTree when by default when vim opens with no file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | wincmd p | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" Closes vim when NERDTree is the only remaining window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeWinSize=25
let g:NERDTreeSyntaxDisableDefaultExtensions = 1
let g:NERDTreeDisableExactMatchHighlight = 1
let g:NERDTreeDisablePatternMatchHighlight = 1
let g:NERDTreeSyntaxEnabledExtensions = ['c', 'cpp', 'dart', 'java', 'jpg', 'json', 'md', 'mp4', 'png', 'py', 'yaml']
let g:NERDTreeHighlightCursorline = 0
nnoremap <silent> <Space>f :NERDTreeToggle<CR>

" Vista {{{
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}
let g:vista_default_executive = 'coc'
let g:vista_sidebar_width=25
let g:vista_fzf_preview = ['right:50%']
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }
autocmd bufenter * if winnr("$") == 1 && vista#sidebar#IsOpen() | execute "normal! :q!\<CR>" | endif
" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

nnoremap <silent> <Space>v :Vista!!<CR>
" }}}

" Navigation {{{
" Sets motion leader as <Leader> instead of <Leader><Leader>
lua require'hop'.setup {keys = 'sadfjklewcmpgh', teasing = false, case_insensitive = true}
map f :HopWord<CR>

" Window tab thingies
nnoremap <silent> <C-t> :tabnew <bar> :NERDTreeMirror <bar> wincmd p <CR>
nnoremap <silent> <C-x> :tabclose<CR>

" Makes sense I guess
nnoremap H ^
nnoremap L $
nnoremap ; :

nmap <silent> < <C-w><
nmap <silent> > <C-w>>
nmap <silent> - <C-w>-
nmap <silent> + <C-w>+
nmap <silent> = <C-w>=

" This remaps arrow keys to switch between windows
nmap <silent> <Up> :wincmd k<CR>
nmap <silent> <Down> :wincmd j<CR>
nmap <silent> <Left> :wincmd h<CR>
nmap <silent> <Right> :wincmd l<CR>
" Move windows
nmap <silent> <C-Up> :wincmd K<CR>
nmap <silent> <C-Down> :wincmd J<CR>
nmap <silent> <C-Left> :wincmd H<CR>
nmap <silent> <C-Right> :wincmd L<CR>

" Escape --> jk
let g:easyescape_chars = { "j": 1, "k": 1 }
let g:easyescape_timeout = 200
cnoremap jk <ESC>
cnoremap kj <ESC>

" Natural splitting
set splitbelow
set splitright

" Window size specific settings for comfortable motion
let g:comfortable_motion_no_default_key_mappings = 1
let g:comfortable_motion_impulse_multiplier = 1  " Feel free to increase/decrease this value.
nnoremap <silent> <C-d> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 3)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -3)<CR>
nnoremap <silent> <C-f> :Files<CR>
" }}}

" Miscellaneous {{{
" folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "don't fold by default
set foldlevel=1         "this is just what i use

syntax on
set mouse=a
set number
set clipboard=unnamedplus
set incsearch

let g:indentLine_enabled = 1

nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
noremap 0 g0
noremap $ g$

" Copy to clipboard
vnoremap y "+y
nnoremap Y "+yg_
nnoremap y "+y
nnoremap yy "+yy

" Paste from clipboard
nnoremap P "+P
nnoremap p "+p
vnoremap P "+P
vnoremap p "+p

au TermOpen * tnoremap <Esc> <c-\><c-n>
au FileType fzf tunmap <Esc>

set tildeop

au BufWinEnter * :DetectIndent
let g:airline_powerline_fonts = 1

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" To replace stuff globally
set gdefault

" Coz redo should be U
nnoremap U <C-r>

" ignores cases for search
set ignorecase

" Opens files in buffer in a menu with Space + Tab
set wildcharm=<Tab>
nnoremap <Leader><Tab> :buffer<Space><Tab>

" To execute a macro over visual line selections
xnoremap Q :'<,'>:normal @q<CR>

" Set undodir
set undofile
set undodir=/tmp/nvim_undo_history

let g:vim_markdown_conceal = 0
let g:tex_conceal = ""
let g:vim_markdown_math = 1
let g:vim_markdown_conceal_code_blocks = 0
" }}}

" CoC below taken from the official repo {{{
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" For highlighting
autocmd CursorHold * silent call CocActionAsync('highlight')

" All plugins
let g:coc_global_extensions = [
      \'coc-word',
      \'coc-syntax',
      \'coc-spell-checker',
      \'coc-snippets',
      \'coc-prettier',
      \'coc-pairs',
      \'coc-lists',
      \'coc-highlight',
      \'coc-git',
      \'coc-emoji',
      \'coc-dictionary',
      \'coc-calc',
      \'coc-actions',
      \'coc-markdownlint',
      \'coc-json',
      \'coc-pyright',
      \'coc-docker',
      \'coc-yaml',
\]

" Tab completion for coc-snippets like VSCode
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
" Coc ends here finally }}}

if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif

" Docstring generation config
let g:ultisnips_python_style = 'numpy'

" Remove if not on headless server for better cursor in INSERT mode {{{
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=0
set guicursor=
" }}}

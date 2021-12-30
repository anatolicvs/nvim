let mapleader=" "
" Use system clipboard
set clipboard+=unnamedplus

set autoindent smartindent

" -----Basic AutoCmd-----
" Fix tex file type set
autocmd BufRead,BufNewFile *.tex set filetype=tex
autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown

autocmd FileType tex,latex,markdown setlocal spell spelllang=en_au

" Vertically center document when entering insert mode
autocmd InsertEnter * norm zz

" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" ------Standard Bindings------
" Basic file system commands
nnoremap <A-o> :!touch<Space>
nnoremap <A-e> :!crf<Space>
nnoremap <A-d> :!mkdir<Space>
nnoremap <A-m> :!mv<Space>%<Space>

" Fix indenting visual block
vmap < <gv
vmap > >gv

" Enable and disable auto comment
map <leader>c :setlocal formatoptions-=cro<CR>
map <leader>C :setlocal formatoptions=cro<CR>

" Enable spell checking, s for spell check
map <leader>s :setlocal spell! spelllang=en_au<CR>

" Enable Disable Auto Indent
map <leader>i :setlocal autoindent<CR>
map <leader>I :setlocal noautoindent<CR>

" Shell check
map <leader>p :!clear && shellcheck %<CR>

" Compile and open output
map <leader>G :w! \| !comp <c-r>%<CR><CR>
map <leader>o :!opout <c-r>%<CR><CR>

" Shortcutting split navigation
map <A-h> <C-w>h
map <A-j> <C-w>j
map <A-k> <C-w>k
map <A-l> <C-w>l

" Tab shortcuts
nnoremap <A-p> :tabp<CR>
nnoremap <A-n> :tabn<CR>

" Alias replace all to
nnoremap <A-s> :%s//gI<Left><Left><Left>

" Alias write  nd quit to Q
nnoremap <leader>q :wq<CR>
nnoremap <leader>w :w<CR>

" Save file as sudo when no sudo permissions
cmap w!! w !sudo tee > /dev/null %

" -----Code Generation-----
" Guide navigation
noremap <leader><Tab> <Esc>/<++><Enter>"_c4l
inoremap <leader><Tab> <Esc>/<++><Enter>"_c4l
vnoremap <leader><Tab> <Esc>/<++><Enter>"_c4l

" general insert commands
inoremap ;g <++>

" shell
map <leader>b i#!/bin/sh<CR><CR>
autocmd FileType sh inoremap ,f ()<Space>{<CR><Tab><++><CR>}<CR><CR><++><Esc>?()<CR>
autocmd FileType sh inoremap ,i if<Space>[<Space>];<Space>then<CR><++><CR>fi<CR><CR><++><Esc>?];<CR>hi<Space>
autocmd FileType sh inoremap ,ei elif<Space>[<Space>];<Space>then<CR><++><CR><Esc>?];<CR>hi<Space>
autocmd FileType sh inoremap ,sw case<Space>""<Space>in<CR><++>)<Space><++><Space>;;<CR><++><CR>esac<CR><CR><++><Esc>?"<CR>i
autocmd FileType sh inoremap ,ca )<Space><++><Space>;;<CR><++><Esc>?)<CR>i

" markdown
autocmd FileType markdown noremap <leader>r i---<CR>title:<Space><++><CR>author:<Space>"Brodie Robertson"<CR>geometry:<CR>-<Space>top=30mm<CR>-<Space>left=20mm<CR>-<Space>right=20mm<CR>-<Space>bottom=30mm<CR>header-includes:<Space>\|<CR><Tab>\usepackage{float}<CR>\let\origfigure\figure<CR>\let\endorigfigure\endfigure<CR>\renewenvironment{figure}[1][2]<Space>{<CR><Tab>\expandafter\origfigure\expandafter[H]<CR><BS>}<Space>{<CR><Tab>\endorigfigure<CR><BS>}<CR><BS>---<CR><CR>
autocmd FileType markdown inoremap ,i ![](<++>){#fig:<++>}<Space><CR><CR><++><Esc>kkF]i
autocmd FileType markdown inoremap ,a [](<++>)<Space><++><Esc>F]i
autocmd FileType markdown inoremap ,1 #<Space><CR><CR><++><Esc>2k<S-a>
autocmd FileType markdown inoremap ,2 ##<Space><CR><CR><++><Esc>2k<S-a>
autocmd FileType markdown inoremap ,3 ###<Space><CR><CR><++><Esc>2k<S-a>
autocmd FileType markdown inoremap ,4 ####<Space><CR><CR><++><Esc>2k<S-a>
autocmd FileType markdown inoremap ,5 #####<Space><CR><CR><++><Esc>2k<S-a>
autocmd FileType markdown inoremap ,u +<Space><CR><++><Esc>1k<S-a>
autocmd FileType markdown inoremap ,o 1.<Space><CR><++><Esc>1k<S-a>
autocmd FileType markdown inoremap ,f +@fig:

if !exists('g:vscode')
  call plug#begin('~/local/share/nvim/plugged')
  " Themes
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'tomasiser/vim-code-dark'
  " devicons
  Plug 'kyazdani42/nvim-web-devicons'

  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
  
  " Center text
  Plug 'junegunn/goyo.vim'
  " Code Completion
  " Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Fuzzy find files
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  " This objectively makes vim better
  Plug 'terryma/vim-multiple-cursors'
  " Working with tags
  Plug 'alvan/vim-closetag'
  Plug 'tpope/vim-surround'
  " Commenting
  Plug 'tpope/vim-commentary'
  " Syntax highlighting
  Plug 'yuezk/vim-js'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'HerringtonDarkholme/yats.vim'
	Plug 'rust-lang/rust.vim'
  Plug 'vim-pandoc/vim-pandoc-syntax'
	" Motions
	Plug 'justinmk/vim-sneak'
	" Misc
  Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
  Plug 'voldikss/vim-floaterm'
  Plug 'airblade/vim-gitgutter'
	Plug 'vimwiki/vimwiki'
	Plug 'tpope/vim-repeat'
	" Plug 'dhruvasagar/vim-table-mode'
	Plug 'mattn/emmet-vim'
  Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
  Plug 'kassio/neoterm'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
  " nerdtree
  Plug 'scrooloose/nerdtree'
  Plug 'tsony-tsonev/nerdtree-git-plugin'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'ryanoasis/vim-devicons'
  Plug 'scrooloose/nerdcommenter'

  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path' 
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'

  " For vsnip users.
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'

  " For luasnip users.
  " Plug 'L3MON4D3/LuaSnip'
  " Plug 'saadparwaiz1/cmp_luasnip'

  " For ultisnips users.
  " Plug 'SirVer/ultisnips'
  " Plug 'quangnguyen30192/cmp-nvim-ultisnips'

  " For snippy users.
  " Plug 'dcampos/nvim-snippy'
  " Plug 'dcampos/cmp-snippy'

  call plug#end()
	let g:user_emmet_leader_key='<A-c>'
  " Basic settings
  set mouse=a
  syntax on
  set ignorecase
  set smartcase
  set encoding=utf-8
  set number relativenumber
  " set termguicolors
  let g:codedark_conservative = 1
  colorscheme codedark

  " Tab Settings"
  set shiftwidth=2
  set softtabstop=2
  set tabstop=2

  " Autocompletion
  set wildmode=longest,list,full

  " Fix splitting
  set splitbelow splitright

  " Cursor line
  set cursorline
  set cursorcolumn

	" Table mode
	let g:table_mode_delete_row_map = "<leader>tdr"

	" Git Messenger
	noremap <C-g> :GitMessenger<CR>
	let g:git_messenger_no_default_mappings = v:true

  " Goyo
  noremap <leader>g :Goyo<CR>

  " Float Term
  nnoremap <A-t> :FloatermNew<CR>
  nnoremap <A-r> :FloatermNew lf<CR>

	"let g:floaterm_wintype    = 'normal'
	let g:floaterm_keymap_new    = '<F9>'
	let g:floaterm_keymap_prev   = '<F10>'
	let g:floaterm_keymap_next   = '<F11>'
	let g:floaterm_keymap_toggle = '<F12>'

  " Git Gutter
  highlight GitGutterAdd guifg=#009900 ctermfg=Green
  highlight GitGutterChange guifg=#bbbb00 ctermfg=Yellow
  highlight GitGutterDelete guifg=#ff2222 ctermfg=Red
  nmap ) <Plug>(GitGutterNextHunk)
  nmap ( <Plug>(GitGutterPrevHunk)
  let g:gitgutter_enabled = 1
  let g:gitgutter_map_keys = 0
  let g:gitgutter_highlight_linenrs = 1

  " Vim-airline
  let g:airline#extensions#wordcount#enabled = 1
  let g:airline#extensions#hunks#non_zero_only = 1
  let g:airline_theme = 'codedark'

  " Vim Hexokinase
  let g:Hexokinase_refreshEvents = ['InsertLeave']

  let g:Hexokinase_optInPatterns = [
  \     'full_hex',
  \     'triple_hex',
  \     'rgb',
  \     'rgba',
  \     'hsl',
  \     'hsla',
  \     'colour_names'
  \ ]

  let g:Hexokinase_highlighters = ['backgroundfull']

  " Reenable hexokinase on enter
  " autocmd VimEnter * HexokinaseTurnOn

  " vim fzf
	nnoremap <A-g> :GFiles<CR>
	nnoremap <A-z> :Files<CR>
	" let g:fzf_preview_window = 'right:60%'

	command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--preview', 'preview {}']}, <bang>0)
	command! -bang -nargs=? -complete=dir GFiles
    \ call fzf#vim#gitfiles(<q-args>, {'options': ['--preview', 'preview {}']}, <bang>0)

  " NERDTRee
  " autocmd vimenter * silent! lcd %:p:h
  autocmd VimEnter * NERDTree * silent! lcd %:p:h
  " set autochdir
  autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif
  let g:NERDTreeShowHidden = 1
  let g:NERDTreeMinimalUI = 1
  let g:NERDTreeIgnore = []
  let g:NERDTreeStatusline = ''
  " let g:NERDTreeChDirMode = 2

 " Automaticaly close nvim if NERDTree is only thing left open
 autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

  " Toggle
  autocmd StdinReadPre * let s:std_in=1
  " autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
  " nnoremap <silent> <C-b> :call NERDTreeToggleInCurDir()<CR>
  nnoremap <silent> <C-b> :NERDTreeToggle<CR>

  function! NERDTreeToggleInCurDir()
  " If NERDTree is open in the current buffer
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    exe ":NERDTreeClose"
  else
    if (expand("%:t") != '')
      exe ":NERDTreeFind"
    else
      exe ":NERDTreeToggle"
    endif
  endif
 endfunction

  " open new split panes to right and below
  set splitright
  set splitbelow
  " turn terminal to normal mode with escape
  tnoremap <Esc> <C-\><C-n>
  " start terminal in insert mode
  au BufEnter * if &buftype == 'terminal' | :startinsert | endif
  " open terminal on ctrl+n
  function! OpenTerminal()
    split term://bash
    resize 10
  endfunction
  nnoremap <C-t> :call OpenTerminal()<CR>

  " use alt+hjkl to move between split/vsplit panels
  tnoremap <A-h> <C-\><C-n><C-w>h
  tnoremap <A-j> <C-\><C-n><C-w>j
  tnoremap <A-k> <C-\><C-n><C-w>k
  tnoremap <A-l> <C-\><C-n><C-w>l
  nnoremap <A-h> <C-w>h
  nnoremap <A-j> <C-w>j
  nnoremap <A-k> <C-w>k
  nnoremap <A-l> <C-w>l


  " ------Vim Auto Closetag------
  " filenames like *.xml, *.html, *.xhtml, ...
  " These are the file extensions where this plugin is enabled.
  let g:closetag_filenames = '*.html,*.xhtml,*.jsx,*.js,*.tsx'

  " filenames like *.xml, *.xhtml, ...
  " This will make the list of non-closing tags self-closing in the specified files.
  let g:closetag_xhtml_filenames = '*.xml,*.xhtml,*.jsx,*.js,*.tsx'

  " filetypes like xml, html, xhtml, ...
  " These are the file types where this plugin is enabled.
  let g:closetag_filetypes = 'html,xhtml,jsx,js,tsx'

  " filetypes like xml, xhtml, ...
  " This will make the list of non-closing tags self-closing in the specified files.
  let g:closetag_xhtml_filetypes = 'xml,xhtml,jsx,js,tsx'

  " integer value [0|1]
  " This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
  let g:closetag_emptyTags_caseSensitive = 1

  " Disables auto-close if not in a "valid" region (based on filetype)
  let g:closetag_regions = {
      \ 'typescript.tsx': 'jsxRegion,tsxRegion',
      \ 'javascript.jsx': 'jsxRegion',
      \ }

  " Shortcut for closing tags, default is '>'
  let g:closetag_shortcut = '>'

  " Add > at current position without closing the current tag, default is ''
  let g:closetag_close_shortcut = '<leader>>'


" Find files using Telescope command-line sugar.
 nnoremap <leader>ff <cmd>Telescope find_files<cr>
 nnoremap <leader>fg <cmd>Telescope live_grep<cr>
 nnoremap <leader>fb <cmd>Telescope buffers<cr>
 nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using lua functions
 nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
 nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
 nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
 nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>


  " ------COC SETTINGS------
  " prettier command for coc
  " command! -nargs=0 Prettier :CocCommand prettier.formatFile
  " let g:coc_global_extensions = [
  "  \ 'coc-snippets',
  "  \ 'coc-pairs',
  "  \ 'coc-tsserver',
  "  \ 'coc-html',
  "  \ 'coc-css',
  "  \ 'coc-prettier',
  "  \ 'coc-json',
  "  \ 'coc-angular',
  "  \ 'coc-vimtex',
  "  \ 'coc-python'
  "  \ ]

  " From Coc Readme
  " set updatetime=300

  " Some servers have issues with backup files, see #649
  set nobackup
  set nowritebackup

  " don't give |ins-completion-menu| messages.
  set shortmess+=c

  " always show signcolumns
  set signcolumn=yes

  " Use tab for trigger completion with characters ahead and navigate.
  " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
  " inoremap <silent><expr> <TAB>
  "      \ pumvisible() ? "\<C-n>" :
  "      \ <SID>check_back_space() ? "\<TAB>" :
  "      \ coc#refresh()
  " inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-space> to trigger completion.
  " inoremap <silent><expr> <c-space> coc#refresh()

  " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
  " Coc only does snippet and additional edit on confirm.
  " inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
  " Or use `complete_info` if your vim support it, like:
  " inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

  " Use `[g` and `]g` to navigate diagnostics
  " nmap <silent> [g <Plug>(coc-diagnostic-prev)
  " nmap <silent> ]g <Plug>(coc-diagnostic-next)

  " Remap keys for gotos
  " nmap <silent> gd <Plug>(coc-definition)
  " nmap <silent> gy <Plug>(coc-type-definition)
  " nmap <silent> gi <Plug>(coc-implementation)
  " nmap <silent> gr <Plug>(coc-references)

  " Use D to show documentation in preview window
  " nnoremap <silent> D :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

  " Remap for rename current word
  " nmap <rn> <Plug>(coc-rename)

  " Remap for format selected region
  " xmap <leader>f  <Plug>(coc-format-selected)
  " nmap <leader>f  <Plug>(coc-format-selected)

  " augroup mygroup
  "  autocmd!
    " Setup formatexpr specified filetype(s).
    " autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    " autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  " augroup end

  " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
  " xmap <leader>a  <Plug>(coc-codeaction-selected)
  " nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap for do codeAction of current line
  " nmap <leader>ac  <Plug>(coc-codeaction)
  " Fix autofix problem of current line
  " nmap <leader>qf  <Plug>(coc-fix-current)

  " Create mappings for function text object, requires document symbols feature of languageserver.
  " xmap if <Plug>(coc-funcobj-i)
  " xmap af <Plug>(coc-funcobj-a)
  " omap if <Plug>(coc-funcobj-i)
  " omap af <Plug>(coc-funcobj-a)

  " Use `:Format` to format current buffer
  " command! -nargs=0 Format :call CocAction('format')

  " Use `:Fold` to fold current buffer
  " command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " use `:OR` for organize import of current buffer
  " command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

  " Add status line support, for integration with other plugin, checkout `:h coc-status`
  " set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
endif
set completeopt=menu,menuone,noselect
set guifont=DroidSansMono_Nerd_Font:h11

" ------LSP SETTINGS------
lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright', 'rust_analyzer', 'tsserver' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
EOF

" ------Treesitter SETTINGS------
if has('unix')
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = {"python","c", "rust"},
  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}
EOF
elseif has('win32') || has('win64')
endif
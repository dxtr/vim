set nocompatible
set shell=/bin/zsh
call pathogen#infect()

" Tabs
function! Tabstyle_Tabs()
	set softtabstop=8
	set shiftwidth=8
	set tabstop=8
	set noexpandtab
endfunction
function! Tabstyle_Spaces()
	set softtabstop=8
	set shiftwidth=8
	set tabstop=8
	set expandtab
endfunction

call Tabstyle_Tabs()

let mapleader = ","
set history=1000
set scrolloff=3
set hidden
set t_Co=256
set nostartofline
set virtualedit=block
set switchbuf=usetab,newtab

" Indenting
set ai " Autoindent
set si " Smartindent

" Scrollbars
"set sidescrolloff=2
"set numberwidth=4

" Windows
set equalalways
set splitbelow splitright

" Cursor highlights
set cursorline
" set cursorcolumn

" Searching
set hlsearch " Highlight search
set incsearch " Incremental search. Search as you type.
set ignorecase " Ignore case
set smartcase " Ignore case when searching lowercase

" Colors
set background=dark
syntax on
"colorscheme ir_black
"colorscheme peachpuff
colorscheme neverland-darker
"let g:solarized_termcolors=256
"let g:solarized_termtrans=0
"colorscheme solarized
"colorscheme zenburn
hi Normal ctermbg=none
hi NonText ctermbg=none
" Status line
set showcmd
set ruler

" Line wrapping
set wrap
set linebreak
set textwidth=80
set formatoptions+=t
set wrapmargin=0
map <C-q> {gq}

" Directories
set backupdir=~/.vim/backup
set backup
set directory=~/.vim/swap

" File stuff
filetype plugin indent on
autocmd FileType html :set filetype=xhtml
set wildmode=longest,list,full
set wildmenu
au! BufRead,BufNewFile *.json set filetype=json

" Invisible characters
set listchars=trail:.,tab:>-,eol:$
set nolist
:noremap <Leader>i :set list!<CR> " Toggle invisible characters

" Misc settings
set backspace=indent,eol,start
set number " Show line numbers
set matchpairs+=<:>,[:],{:},(:)
set vb t_vb= " Turn of bell
set nofoldenable " Turn off folding
if has("gui_running")
	set guifont=DejaVu\ Sans\ Mono\ 8
	set guioptions-=m
	set guioptions-=T
	set guioptions-=r
	set guioptions-=R
	set guioptions-=l
	set guioptions-=L
	set guioptions-=b
	set guioptions-=e
	set guioptions-=g
	set guioptions-=i
	augroup vimrc_autocmds
	au!
		autocmd BufRead * highlight OverLength ctermbg=red ctermfg=white guibg=#592929 
		autocmd BufRead * match OverLength /\%81v.*/
	augroup END
endif

" Navigation
" Make cursor move by visual lines instead of file lines. Good when wrapping.
map <up> gk
map k gk
imap <up> <C-o>gk
map <down> gj
map j gj
imap <down> <C-o>gj
map E ge

imap uu _
imap hh =>
imap aa @

" GPG stuff
augroup encrypted
au!
        autocmd BufReadPre,FileReadPre *.gpg set viminfo=
        autocmd BufReadPre,FileReadPre *.gpg set noswapfile
        autocmd BufReadPre,FileReadPre *.gpg set bin
        autocmd BufReadPost,FileReadPost *.gpg set nobin
augroup END

" Plugins
" NERDTree
:noremap <Leader>t :NERDTreeToggle<CR>
let NERDTreeHijackNetrw=0
let NERDTreeMouseMode=1

"" NERD commenter
let NERDCreateDefaultMappings=0
:map <Leader>nc :call NERDComment(0, "toggle")<CR>

"" fuzzyfinder
map <Leader>b :FufBuffer<CR>
let g:fuzzy_ignore = '.o;.obj;.bak;.exe;.dylib;.pyc;.pyo;.DS_Store;.db'

"" autocomplpop
"let g:AutoComplPop_IgnoreCaseOption = 0
"let g:AutoComplPop_BehaviorKeywordLength = 2

let g:session_autoload = 'no'

" VimOrganizer
let g:ft_ignore_pat = '\.org'
filetype plugin indent on
au! BufRead,BufWrite,BufWritePost,BufNewFile *.org
au BufEnter *.org            call org#SetOrgFileType()
" let g:org_capture_file = '~/org_files/mycaptures.org'
command! OrgCapture :call org#CaptureBuffer()
command! OrgCaptureFile :call org#OpenCaptureFile()


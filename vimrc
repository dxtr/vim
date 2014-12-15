set nocompatible
"set shell=/bin/zsh
"call pathogen#infect()
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'L9'
Bundle 'thisivan/vim-bufexplorer'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-endwise'
Bundle 'leshill/vim-json'
"Bundle 'fholgado/minibufexpl.vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'chrisbra/NrrwRgn'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
Bundle 'kien/tabman.vim'
Bundle 'tomtom/tlib_vim'
Bundle 'clones/vim-fuzzyfinder'
Bundle 'rainerborene/vim-pony'
Bundle 'ironcamel/vim-script-runner'
Bundle 'hsitz/VimOrganizer'
Bundle 'sukima/xmledit'
Bundle 'bling/vim-airline'
Bundle 'jnwhiteh/vim-golang'
Bundle 'Lukc/vim-pkgfile'

let running_uname = system("uname")

" Tabs
function! Tabstyle_Tabs()
        set softtabstop=8
        set shiftwidth=8
        set tabstop=8
        set noexpandtab
endfunction
function! Tabstyle_Spaces()
        set softtabstop=4
        set shiftwidth=4
        set tabstop=4
        set expandtab
endfunction

call Tabstyle_Tabs()

let mapleader = "," 
set history=1000
set scrolloff=3
set sidescrolloff=5
set display+=lastline
set hidden
set t_Co=256
set nostartofline
set virtualedit=block
set switchbuf=useopen,split
set showmode
set showmatch
set ttyfast
set lazyredraw
set modeline
set modelines=5
set cm=blowfish
set complete-=i
set smarttab
set shiftround
set nrformats-=octal
set ttimeout
set ttimeoutlen=50
set laststatus=2
set encoding=utf-8
set fileformats+=mac

if &listchars ==# 'eol:$'
	set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
	if !has('win32') && (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8')
		let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
	endif
endif

" Windows
set equalalways
set splitbelow splitright

" Searching
set hlsearch " Highlight search
set incsearch " Incremental search. Search as you type.
set ignorecase " Ignore case
set smartcase " Ignore case when searching lowercase
nnoremap <leader>f :set invhlsearch<CR>

" Colors
set background=dark
syntax on
colorscheme Tomorrow-Night-Bright
hi Normal ctermbg=none
hi NonText ctermbg=none
" Status line
set showcmd
set ruler

" Line wrapping
set wrap
set linebreak
set textwidth=80
set colorcolumn=-1
set formatoptions+=ct
set wrapmargin=1

" Directories
set backupdir=~/.vim/backup
set backup
set directory=~/.vim/swap

" Status line
set showcmd
set ruler

" File stuff
set autoread
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
autocmd FileType html :set filetype=xhtml
set wildmode=longest,list,full
set wildmenu
au! BufRead,BufNewFile *.json set filetype=json

" Invisible characters
set listchars=trail:.,tab:>-,eol:$
set nolist
noremap <Leader>i :set list!<CR> " Toggle invisible characters

" Misc settings
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>s <C-w>s
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
set backspace=indent,eol,start
set number " Show line numbers
set relativenumber " Show relative line numers
set matchpairs+=<:>,[:],{:},(:)
set vb t_vb= " Turn of bell
set nofoldenable " Turn off folding
set foldmethod=indent
let perl_fold = 1
if has("gui_running")
	if has("macunix") " mac-specific settings
		set guifont=Menlo\ Regular:h12
	elseif has("gui_win32") " Windows-specific settings
	elseif has("gui_gtk2") " GTK2-specific settings
		set guifont=GohuFont\ 9
	elseif has("x11") " X11- and GTK1-specific settings
		set guifont=-gohu-gohufont-medium-r-normal--14-100-100-100-c-80-iso10646-1
	else " Everything else.
	endif
	set guioptions-=m
	set guioptions-=T
	set guioptions-=r
	set guioptions-=R
	set guioptions-=l
	set guioptions-=L
	set guioptions-=b
	set guioptions-=e
	set guioptions-=g
	augroup vimrc_autocmds
endif

let c_space_errors=1

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

" Tags
set tags=./tags,tabs,./src/tags,/usr/local/share/ctags/C,/usr/local/share/ctags/sockets,/usr/local/share/ctags/pthreads
nnoremap <silent> <F4> :TlistToggle<CR>
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_right_window = 1
let Tlist_Sort_Type = "order"
let Tlist_Display_Prototype = 0
let Tlist_Compact_Format = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Display_Tag_Scope = 1
let Tlist_Close_on_Select = 1
let Tlist_WinWidth = 40

if match(running_uname, "Linux") == 0
	let Tlist_Ctags_Cmd = "/usr/bin/ctags"
elseif match(running_uname, "OpenBSD") == 0
	let Tlist_Ctags_Cmd = "/usr/local/bin/ectags"
elseif match(running_uname, "FreeBSD") == 0
	let Tlist_Ctags_Cmd = "/usr/local/bin/exctags"
endif

" GPG stuff
augroup encrypted
au!
        autocmd BufReadPre,FileReadPre *.gpg set viminfo=
        autocmd BufReadPre,FileReadPre *.gpg set noswapfile
	autocmd BufReadPre,FileReadPre *.gpg set nobackup
	autocmd BufReadPre,FileReadPre *.gpg set nowritebackup
        autocmd BufReadPre,FileReadPre *.gpg set bin
	autocmd BufReadPre,FileReadPre *.gpg set bufhidden=wipe
	autocmd BufReadPre,FileReadPre *.gpg set modeline
        autocmd BufReadPost,FileReadPost *.gpg set nobin
augroup END

" Plugins
"" NERDTree
:noremap <Leader>t :NERDTreeToggle<CR>
let NERDTreeHijackNetrw=0
let NERDTreeMouseMode=1

"" NERD commenter
let NERDCreateDefaultMappings=0
:map <Leader>nc :call NERDComment(0, "toggle")<CR>

"" BufExplorer
map <Leader>be :BufExplorer<CR>

"" fuzzyfinder
map <Leader>bf :FufBuffer<CR>
let g:fuzzy_ignore = '.o;.obj;.bak;.exe;.dylib;.pyc;.pyo;.DS_Store;.db'

"" autocomplpop
"let g:AutoComplPop_IgnoreCaseOption = 0
"let g:AutoComplPop_BehaviorKeywordLength = 2

let g:session_autoload = 'no'

"" VimOrganizer
let g:ft_ignore_pat = '\.org'
filetype plugin indent on
au! BufRead,BufWrite,BufWritePost,BufNewFile *.org
au BufEnter *.org            call org#SetOrgFileType()
" let g:org_capture_file = '~/org_files/mycaptures.org'
command! OrgCapture :call org#CaptureBuffer()
command! OrgCaptureFile :call org#OpenCaptureFile()

"" minibufexplorer
"let g:miniBufExplTabWrap =  1
"let g:miniBufExplModSelTarget = 1
"let g:miniBufExplUseSingleClick = 1
"let g:miniBufExplSplitBelow=0
"let g:miniBufExplorerMoreThanOne=2
"let g:miniBufExplMapWindowNavVim=1
"let g:miniBufExplForceSyntaxEnable=1

"" fugitive
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gc :Gcommit<CR>
nmap <Leader>gb :Gblame<CR>
nmap <Leader>gg :Ggrep<CR>
nmap <Leader>gr :Gread<CR>
nmap <Leader>gl :Glog<CR>
nmap <Leader>gd :Gdiff<CR>

"" SVN
nmap <Leader>vs :VCSStatus<CR>
nmap <Leader>vc :VCSCommit<CR>
nmap <Leader>vb :VCSBlame<CR>
nmap <Leader>vd :VCSDiff<CR>
nmap <Leader>vi :VCSInfo<CR>
nmap <Leader>vu :VCSUpdate<CR>

"" Omnifunc
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

nn <F5> :%!xxd -g 1<CR>
nn <F6> :%!xxd -g 1 -r<CR>

source $VIMRUNTIME/ftplugin/man.vim

" backspace
imap ^? ^H

" markdown
let g:vim_markdown_folding_disabled=1

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='murmur'

" pkgfile
au BufNewFile,BufRead *Pkgfile set filetype=pkgfile
au BufNewFile,BufRead *Pkgfile-* set filetype=pkgfile

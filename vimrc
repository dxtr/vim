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
set cursorcolumn

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
"colorscheme neverland2-darker
"let g:solarized_termcolors=16
"let g:solarized_termtrans=0
"let g:solarized_italic=0
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

" Status line
set showcmd
set ruler

" Line wrapping
set wrap
set linebreak
set textwidth=79
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
	if has("macunix")
		" Mac-specific settings
		"set guifont=Inconsolata:h14
		set guifont=GohuFont:h14
	elseif has("gui_win32")
		" Windows-specific settings
	elseif has("gui_gtk2")
		" GTK2-specific settings
		"set guifont=erusfont\ 7
		set guifont=GohuFont\ 14
	elseif has("x11")
		" X11- and GTk1-specific settings
		set guifont=-gohu-gohufont-medium-r-normal--14-100-100-100-c-80-iso10646-1
	else
		" Everything else. If there are such things..
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

" Tags
set tags=./tags;./src/tags;/usr/local/share/ctags/C;/usr/local/share/ctags/sockets;/usr/local/share/ctags/pthreads
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

"" VimOrganizer
let g:ft_ignore_pat = '\.org'
filetype plugin indent on
au! BufRead,BufWrite,BufWritePost,BufNewFile *.org
au BufEnter *.org            call org#SetOrgFileType()
" let g:org_capture_file = '~/org_files/mycaptures.org'
command! OrgCapture :call org#CaptureBuffer()
command! OrgCaptureFile :call org#OpenCaptureFile()

"" minibufexplorer
let g:miniBufExplTabWrap =  1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplSplitBelow=0
let g:miniBufExplorerMoreThanOne=2
let g:miniBufExplMapWindowNavVim=1
"let g:miniBufExplForceSyntaxEnable=1

"" fugitive
map <Leader>gs :Gstatus
map <Leader>gc :Gcommit
map <Leader>gb :Gblame
map <Leader>gg :Ggrep
map <Leader>gr :Gread
map <Leader>gl :Glog

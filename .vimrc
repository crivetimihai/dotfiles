" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Performance
set ttyfast
set lazyredraw
" set showmatch " show matching brackets (SLOOOW)
let loaded_matchparen = 1 " Fix slowness?
"let g:loaded_matchparen = 1 " Fix slowness?


" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Sane defaults
set history=50      " keep 50 lines of command line history

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

filetype plugin indent on

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif

" Set colorscheme
set t_Co=256
" colorscheme tir_black
" colorscheme desert
" colorscheme inkpot
colorscheme torte
" colorscheme 256_jungle
" You can use :SCROLLCOLOR to get an idea...

" Set UTF-8 encoding
set encoding=utf-8

" Set font
" set guifont=ter-u20n
"set guifont=Terminus\ 12
" set guifont=Consolas\ 14
"set guifont=Envy\ Code\ R\ 12
"set guifont=Menlo\ 16
set guifont=Anonymous\ Pro\ for\ Powerline\ 18

 " Tabs
set expandtab                   " no real tabs please!
set shiftround                  " when at 3 spaces, and I hit > ... go to 4, not 5
set shiftwidth=4                " auto-indent amount when using cindent,
" >>, << and stuff like that
set softtabstop=4               " when hitting tab or backspace, how many spaces
"should a tab be (see expandtab)
set tabstop=8                   " real tabs should be 8, and they will show with set list on

" Tab completion
set wildmenu                    "nice tab-completion on the command line
set wildmode=list:longest,full  " nicer tab-completion on the command line
set wildignore=*.o,*.obj,*.bak,*.exe " Ignore stuff we don't care about
set hidden                      " side effect: undo list is not lost on C-^
set browsedir=buffer            " :browse e starts in %:h, not in $PWD
set autoread                    " automatically reload files changed on disk
set history=1000                " remember more lines of cmdline history
set switchbuf=useopen           " quickfix reuses open windows

" Presentatation
set laststatus=2                " always show a status line
" set cmdheight=2               " avoid 'Press ENTER to continue'
set guioptions-=L               " disable left scrollbar in GUI
set showcmd                     " show partial commands in status line
set ruler                       " show cursor position in status line
set list                        " show tabs and spaces at end of line:
set listchars=tab:>-,trail:.,extends:>
" let &sbr = nr2char(8618).' '  " Show ↪ at the beginning of wrapped lines
set hlsearch                    " highlight search matches
if has("extra_search")
    nohlsearch                  " but not initially
endif

if v:version >= 600
    set listchars+=precedes:<
    set splitright
endif

if v:version >= 700
    set diffopt+=vertical       " split diffs vertically
    set spelllang=en            ",ro spell-check two languages at once
    set nospell                   " To get suggestions, z=
    set spellsuggest=5
endif

" Movement
set incsearch                   " incremental searching
set scrolloff=2                 " always keep cursor 2 lines from screen edge
set nostartofline               " don't jump to start of line


" Silence
set noerrorbells                " don't beep!
set visualbell                  " don't beep!
set t_vb=                       " don't beep! (but also see below)

" <F5> decrease version viewed in VersDiff window
" <F6> increase version viewed in VersDiff window
" <F7> do VersDiff with cvs version of current file
" <F8> cancel VersDiff window
nmap <silent> <F5> :VersDiff -<cr>
nmap <silent> <F6> :VersDiff +<cr>
nmap <silent> <F7> :VersDiff -cvs<cr>
nmap <silent> <F8> :VersDiff -c<cr>
" Use Purge and VersDiff commands.

" Editing
set backspace=indent,eol,start  " sane backspacing
set nowrap                      " do not wrap long lines
set shiftwidth=4                " more-or-less sane indents
set softtabstop=4               " make the <tab> key more useful
set tabstop=8                   " anything else is heresy
set expandtab                   " sane default
set noshiftround                " do NOT enforce the indent
set autoindent                  " automatic indent
set nosmartindent               " but no smart indent (ain't smart enough)
" set isfname-=\=                 " fix filename completion in VAR=/path

" Editing code
set path+=**                    " let :find do recursive searches
set tags-=./TAGS                " ignore emacs tags to prevent duplicates
set tags-=TAGS                  " ignore emacs tags to prevent duplicates
set tags+=tags;$HOME            " look for tags in parent dirs
set suffixes+=.class            " ignore Java class files
set suffixes+=.pyc,.pyo         " ignore compiled Python files

if v:version >= 700
    set complete-=i             " don't autocomplete from included files (too slow)
    " The following doesn't seem to do what I want it to do -- i.e. let me
    " complete common phrases with ^X^L.  Should I look for a snippet plugin?
    set complete+=k~/.vim/python-snippets
endif

" Shell scripts
let g:is_posix = 1              " /bin/sh is POSIX, not ancient Bourne shell

" Ignore case
set ignorecase                  " Case insensitive search
set infercase                   " case inferred by default
set wrapscan                    " Wrap over end of file

" Fullscreen
" http://vim.wikia.com/wiki/Hide_toolbar_or_menus_to_see_more_text
" map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
nnoremap <C-F2> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
nnoremap <C-F3> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>
" map <F5> i{<ESC>ea}<ESC>

" Remove toolbars
:set guioptions-=m              "remove menu bar
:set guioptions-=T              "remove toolbar
:set guioptions-=r              "remove right-hand scroll bar

" To remove the cursor completly :set guicursor=n::

" Set up the gui cursor to look nice
"highlight Cursor guifg=white guibg=black
highlight Cursor guifg=white guibg=steelblue
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor-blinkon0
set guicursor+=ve:ver35-Cursor
set guicursor+=o:hor50-Cursor
set guicursor+=i-ci:ver25-Cursor
set guicursor+=r-cr:hor20-Cursor
set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" More options
set mousehide                   " Hide mouse while typing
set linespace=0                 " Don't insert extra pixel between lines
set laststatus=2                " always show the status line
" set matchtime=5                 " Blink matching braces for 5 seconds
" set list                      " Show tabs
" set listchars=tab:>-,trail:-  " show tabs and trailing space
set nostartofline               " leave my cursor where it was
" set shortmess=aOstT           " shortens messages to avoid press any key prompt
set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
" set sidescroll=10             " Always see at least 10 characters

set number
set numberwidth=3
" set lbr! " Linebreak!
set showmode

" Don't hide stuff in the last line. See :help 'display'
set display=lastline
set scroll=1                    " Don't jump around...

" Keystrokes
" Navigate wrapped lines with Alt + arrow keys (to jump down to actual line
" show in vim window, not wrapped line.
map <A-DOWN> gj
map <A-UP> gk
imap <A-UP> <ESC>gki
imap <A-DOWN> <ESC>gji

" Reload vimrc easily
nmap <Leader>s :source $MYVIMRC
nmap <Leader>e :e $MYVIMRC
"(<Leader> is \ by default, so those commands can be invoked by doing \e and \s in normal mode)

set nocursorline
set nocursorcolumn

" Set cursor line to easily follow cursor
highlight CursorLine guibg=Grey10
highlight LineNr guibg=Grey5 guifg=Grey64


" Map formatted paste
nnoremap p p=`]
nnoremap <c-p> p
" It maps Ctrl-p to what p normally did (past with no formatting) and then maps p to the new paste with automatic formatting.

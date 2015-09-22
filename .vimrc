" Shaw Yu's vimrc file
" Updated 2015-02-08

" Pathogen
  execute pathogen#infect()
"
" Environment {
"   Basics {
    set nocompatible                        " must be first line
    set background=dark                     " Assume a dark background
    set t_Co=256
"   }
"   Windows Compatible {
"   On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
"   across (heterogeneous) systems easier.
    if has('win32') || has('win64')
      set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
    endif
"   }
" }
" General {
  if !has('win32') && !has('win64')
    set term=$TERM                          " Make arrow and other keys work
  endif
" filetype plugin indent on                 " Automatically detect file types.
  syntax on                                 " syntax highlighting
  set mouse=a                               " automatically enable mouse usage
" set autochdir                             " always switch to the current file directory.. Messes with some plugins, best left commented out
" Not every vim is compiled with this, use the following line instead
" if you use command-t plugin, it conflicts with this, comment it out.
" autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
  scriptencoding utf-8

" set autowrite                             " automatically write a file when leaving a modified buffer
" set shortmess+=filmnrxoOtT                " abbrev. of messages (avoids 'hit enter')
  set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
  set virtualedit=onemore                   " allow for cursor beyond last character
  set history=1000                          " Store a ton of history (default is 20)
  set wildmenu                              " better filename completion
  set wildmode=longest:list,full            " complete longest string and show match list on first <Tab> then <Tab> again opens wild menu
"   Setting up the directories {
    set backup                              " backups are nice
    set undofile                            " so is persistent undo
    set undolevels=1000                     " maximum number of changes that can be undone
    set undoreload=10000                    " maximum number lines to save for undo on a buffer reload
"   Nice clean swap, undo, and backup files
    set undodir=~/.vim/.undo//
    set backupdir=~/.vim/.backup//
    set directory=~/.vim/.swp//
"   }
" }
" Vim UI {
"  color wombat256                           " load a colorscheme
  color solarized                           " load a colorscheme
  set tabpagemax=15                         " only show 15 tabs
  set showmode                              " display the current mode
  set cursorline                            " highlight current line

  hi cursorline guibg=#333333               " highlight bg color of current line
  hi CursorColumn guibg=#333333             " highlight cursor

  set cc=80                                 " show vertical highlight at col 80

  if has('cmdline_info')
    set ruler                               " show the ruler
" A ruler on steroids
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
    set showcmd                             " show partial commands in status line and
                                            " selected characters/lines in visual mode
  endif

  if has('statusline')
    set laststatus=2
" Broken down into easily includeable segments
    set statusline=%<%f\                    " Filename
    set statusline+=%w%h%m%r                " Options
    set statusline+=\ [%{&ff}/%Y]           " filetype
    set statusline+=\ [%{getcwd()}]         " current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%% " Right aligned file nav info
  endif

  set backspace=indent,eol,start            " backspace for dummys
  set linespace=0                           " No extra spaces between rows
  set nu                                    " Line numbers on
  set showmatch                             " show matching brackets/parenthesis
  set incsearch                             " find as you type search
  set hlsearch                              " highlight search terms
  set winminheight=0                        " windows can be 0 line high 
  set ignorecase                            " case insensitive search
  set smartcase                             " case sensitive when uc present
  set whichwrap=b,s,h,l,<,>,[,]             " backspace and cursor keys wrap to
  set scrolljump=5                          " lines to scroll when cursor leaves screen
  set scrolloff=3                           " minimum lines to keep above and below cursor
  set foldenable                            " auto fold code
  set gdefault                              " the /g flag on :s substitutions by default
  set list
" Highlight problematic whitespace
  set listchars=tab:▸\ ,trail:▫,extends:#,eol:¬
" }
" Formatting {
  set wrap                                " wrap long lines
  set autoindent                            " indent at the same level of the previous line
  set shiftwidth=2                          " use indents of 4 spaces
  set expandtab                             " tabs are spaces, not tabs
  set tabstop=2                             " an indentation every four columns
  set softtabstop=2                         " let backspace delete indent
  set pastetoggle=<F12>                     " pastetoggle (sane indentation on pastes)
" set comments=sl:/*,mb:*,elx:*/            " auto format comment blocks
" Remove trailing whitespaces and ^M chars
"  autocmd FileType c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
" }

" Clearing highlighted search
  nmap <silent> <leader>/ :nohlsearch<CR>
" Shortcuts
" Change Working Directory to that of the current file
  cmap cwd lcd %:p:h
  cmap cd. lcd %:p:h
" Visual shifting (does not exit Visual mode)
  vnoremap < <gv
  vnoremap > >gv
" Fix home and end keybindings for screen, particularly on mac
" - for some reason this fixes the arrow keys too. huh.
  map  mapmgpudo.. Really Write the file.
  cmap w!! w !sudo tee % >/dev/null
" }
" GUI Settings {
" GVIM- (here instead of .gvimrc)
  if has('gui_running')
    set guioptions-=T                       " remove the toolbar
    set lines=40                            " 40 lines of text instead of 24,
  else
    set term=$TERM                          " Make arrow and other keys work
  endif
" }
" Use local vimrc if available {
  if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
  endif
" }

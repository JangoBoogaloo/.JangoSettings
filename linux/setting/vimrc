" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd    " Show (partial) command in status line.
"set ignorecase   " Do case insensitive matching
"set smartcase    " Do smart case matching
"set incsearch    " Incremental search
"set autowrite    " Automatically save before commands like :next and :make
"set hidden   " Hide buffers when they are abandoned

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

"------------------ Jango Setting ------------------------

set nocompatible  " Use Vim defaults instead of 100% vi compatibility
set backspace=2   " more powerful backspacing
" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup

set fdm=syntax 															"folding method
highlight Folded ctermbg=Grey

set hlsearch
nnoremap <CR> :noh<CR><CR>

set noswapfile
set nu
set ruler
set autoindent
set showcmd
set showmatch   													 	" Show matching brackets.
set shiftwidth=2
set tabstop=2

filetype on
filetype plugin on

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" use highlight and 'K' for loading man page "
runtime! ftplugin/man.vim

map <C-Z> :undo<CR>
map <C-Y> :redo<CR>
map <F5> :!make run<CR>
map <C-F5> :!make clean<CR><CR> :!make run<CR>
map <F4> :!make clean<CR><CR> :!make<CR><CR>
map <C-F4> :!make<CR><CR>
map <C-N> :n<CR>
map <C-P> :prev<CR>
map <S-K> :Man <cword><CR>

"Ctrl+R to replace word under cursor"
nnoremap <C-R> :%s/<c-r><c-w>/N/g 

"highlight keyword->hit f: Search for selected text in file, forwards or backwards.
vnoremap <silent> f :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

"move cursor to keyword->ctrl+f: Global search for word
map <C-F> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

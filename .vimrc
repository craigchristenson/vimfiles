"==========================================================================
" Main / Behavior                                                       {{{
"==========================================================================

set nocompatible

" Pathogen initialization
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
call pathogen#infect()

syntax on
filetype plugin indent on

"-- Files & Directories ---------------------------------------------------
" Tell vim to remember certain things when we exit
"           +-> Remember marks for up to # previously edited files
"           |   +-> Remember global marks
"           |   |  +-> Save up to # lines for each register
"           |   |  |    +-> Remember up to # lines of command-line history
"           |   |  |    |   +-> Number of lines to save from the input line history
"           |   |  |    |   |   +-> Number of lines to save from the search history
"           |   |  |    |   |   |   +-> Disable 'hlsearch' highlighting when starting
"           |   |  |    |   |   |   | +-> Where to save the viminfo files
set viminfo='10,f1,<100,:20,@20,/20,h,n~/.vim/.viminfo
" set autochdir            " automatically change working directory
set directory=~/.vim/tmp " store swap files in a single directory
set nobackup             " do not make backups
set tags+=tags;          " search recursively upwards for tags file
if version >= 703        " check for version 7.3 or higher
  set undodir=~/.vim/tmp " list of directory names for undo files
  set undofile           " automatically saves undo history to a file
else
  let g:gundo_disable=1  " disable Gundo plugin
endif

"-- Indenting -------------------------------------------------------------
set expandtab            " use spaces instead of tabs
set shiftround           " round indent to multiple of 'shiftwidth'
set shiftwidth=2         " match shifting to indenting
set softtabstop=2        " indent two spaces by default
set autoindent
set smartindent

"-- Searching -------------------------------------------------------------
set hlsearch             " highlight search results
set ignorecase           " case-insensitive searching by default
set incsearch            " search as I type
set smartcase            " case-sensitive if I use a capital letter
set wrapscan             " wrap around the file when searching

"-- Folding ---------------------------------------------------------------
set foldenable           " enable folding...
set foldmethod=manual    " ...but don't do it automatically

"-- Wildmenu --------------------------------------------------------------
set wildmenu
set wildmode=longest:list

"-- Scrolling -------------------------------------------------------------
set scrolloff=2
set sidescrolloff=10

"-- Wrapping --------------------------------------------------------------
"                 +-> Auto-wrap comments using textwidth
"                 |+-> Automatically insert the comment leader after <Enter>
"                 ||+-> Allow formatting of comments with 'gq'.
set formatoptions=crq
set textwidth=78
set nowrap
set linebreak

"-- Other / Unsorted ------------------------------------------------------
set backspace=indent,eol,start
set fileformats=unix,dos
set hidden
set history=100
set laststatus=2
set matchtime=5
set mousehide
set noerrorbells
set nostartofline
set novisualbell
set report=0
set ruler
set shellslash
set shortmess+=I
set showcmd
set showmatch
set autoread
set ttyfast

" RGrep
set grepprg=grep\ -nrI\ --exclude-dir=target\ --exclude-dir=tmp\ --exclude-dir=log\ --exclude="*.min.js"\ --exclude="*.log"\ $*\ /dev/null


vnoremap <C-X> "+D
vnoremap <C-C> "+Y
nnoremap <C-V> "+P

"}}}
"==========================================================================
" Appearance                                                            {{{
"==========================================================================

"-- Color Scheme ----------------------------------------------------------
let g:solarized_termcolors=256

if !exists("g:colors_name")
  syntax enable
  set background=dark
  colorscheme solarized
endif

"-- GUI Options -----------------------------------------------------------
if has("gui_running")
" Clobber all GUI settings except for one...
"                +-> Use console-style drop-downs
  set guioptions=c
endif

"-- Line Numbers ----------------------------------------------------------
set number
set numberwidth=4

"-- Status Line -----------------------------------------------------------

"               +-> Relative file path
"               |   +-> Help buffer flag
"               |   | +-> Filetype
"               |   | | +-> Readonly flag
"               |   | | | +-> Modified flag
"               |   | | | | +-> Left/right alignment separator
set statusline=%f\ %h%y%r%m%=

" Warn on syntax errors
set statusline+=%#warningmsg#%{SyntasticStatuslineFlag()}%*

" Warn if fileformat isn't Unix
set statusline+=%#warningmsg#%{&ff!='unix'?'['.&ff.']':''}%*

" Warn if file encoding isn't UTF-8
set statusline+=%#warningmsg#%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}%*

" Warn if expandtab is wrong or there is mixed indenting
set statusline+=%#warningmsg#%{StatuslineTabWarning()}%*
set statusline+=%#warningmsg#%{StatuslineTrailingSpaceWarning()}%*

" Warn if paste is enabled
set statusline+=%#warningmsg#%{&paste?'[paste]':''}%*

"                  +-> Column number
"                  |  +-> Line number
"                  |  |   +-> Percentage through file
set statusline+=\ %c,%l\ %P

"}}}
"==========================================================================
" Plugin Options                                                        {{{
"==========================================================================

"-- Gist ------------------------------------------------------------------
let g:gist_detect_filetype=1

"-- NERDTree --------------------------------------------------------------
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1

"-- SnipMate --------------------------------------------------------------


"-- Syntastic -------------------------------------------------------------
let g:syntastic_enable_signs=0
let g:syntastic_auto_jump=1
let g:syntastic_auto_loc_list=1
let g:syntastic_stl_format='[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'

"}}}
"==========================================================================
" Key Mapping                                                           {{{
"==========================================================================

"-- Leader Key ------------------------------------------------------------
" I don't actually use <leader> in my mappings, but I thought it'd be a
" good idea to explicitly declare it anyway.
nnoremap \ ,
vnoremap \ ,
let mapleader=","

"-- Misc. Non-Leader Mappings ---------------------------------------------
map <Space> :

" Make Y behave consistently with D and C
map Y y$

" Re-select visual area after indenting
vmap > >gv
vmap < <gv

" Easier window/tab navigation
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
map <m-l> gt
map <m-h> gT

"-- Mappings for Plugins --------------------------------------------------
map <F3> :RGrep<CR>
map <silent> <F4> :NERDTreeToggle<CR>
map <silent> <F5> :GundoToggle<CR>
map <silent> <F8> :TlistToggle<CR>
map <CR> <Plug>SmartSpaceNext
map <BS> <Plug>SmartSpacePrev

map <silent> <F6> :cnext<CR>
map <silent> <F7> :cprev<CR>
map <silent> <F12> :cclose<CR>

" Emacs style movement on command line. <C-n> and <C-p> wipe out my command
" line cycling for things like the wildmenu, but it's well worth it
" (especially since I primarily use FuzzyFinder).
cmap <c-b> <Left>
cmap <c-f> <Right>
cmap <c-p> <Up>
cmap <c-n> <Down>
cmap <m-b> <S-Left>
cmap <m-f> <S-Right>
cmap <c-a> <Home>
cmap <c-e> <End>

"-- Misc. Leader Mappings -------------------------------------------------
nmap <silent> ,v :ed $MYVIMRC<CR>
nmap <silent> ,V :so $MYVIMRC<CR>

nnoremap <silent> ,cd :lcd %:h<CR>
nnoremap <silent> ,md :!mkdir -p %:p:h<CR>

" Un-highlight last search
nnoremap <silent> ,hl :silent nohlsearch<CR>

"-- FuzzyFinder -----------------------------------------------------------
nnoremap <silent> ,fb :FufBuffer<CR>
nnoremap <silent> ,fc :FufCoverageFile<CR>
nnoremap <silent> ,ff :FufFile<CR>
nnoremap <silent> ,fh :FufHelp<CR>
nnoremap <silent> ,ft :FufTag<CR>
nnoremap <silent> ,fd :FufDir<CR>
nnoremap <silent> ,fr :FufRenewCache<CR>
"-- Fugitive   (Git) --------------------------------------------------------
nnoremap <silent> ,gb :Gblame<CR>
nnoremap <silent> ,gc :Gcommit<CR>
nnoremap <silent> ,gd :Gdiff<CR>
nnoremap <silent> ,gl :Glog<CR>
nnoremap <silent> ,gs :Gstatus<CR>

"}}}
"==========================================================================
" Autocommands                                                          {{{
"==========================================================================

augroup ResetStatuslineWarnings
  au!
  " Recalculate the trailing whitespace warning when idle and after saving
  autocmd CursorHold,BufWritePost * unlet! b:statusline_trailing_space_warning
  " Recalculate the tab warning flag when idle and after writing
  autocmd CursorHold,BufWritePost * unlet! b:statusline_tab_warning
  " Recalculate the long line warning when idle and after saving
  autocmd CursorHold,BufWritePost * unlet! b:statusline_long_line_warning
augroup END

augroup Miscellaneous
  au!
  " Remove trailing whitespace on save. Using an autocommand to create an
  " autocommand like this is probably a bit redundant when I'm doing it to all
  " filetypes, but it'll allow me to limit it down the road if need be.
  autocmd FileType * autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
  " Cucumber (The ft detection in the plugin doesn't seem to work for me)
  autocmd BufNewFile,BufReadPost *.feature,*.story setfiletype cucumber
  " Change PHP indenting (I just can't get used to two spaces with all of
  " those brackets).
  autocmd Filetype php setlocal sts=4 sw=4
  " Restore cursor to last known position when opening a previously edited
  " file.
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"}}}
"==========================================================================
" Functions                                                             {{{
"==========================================================================

function! StatuslineTrailingSpaceWarning()
  if !exists("b:statusline_trailing_space_warning")
    if search('\s\+$', 'nw') != 0
      let b:statusline_trailing_space_warning = '[trail]'
    else
      let b:statusline_trailing_space_warning = ''
    endif
  endif

  return b:statusline_trailing_space_warning
endfunction

function! StatuslineTabWarning()
  if !exists("b:statusline_tab_warning")
    let tabs = search('^\t', 'nw') != 0
    let spaces = search('^ ', 'nw') != 0

    if tabs && spaces
      let b:statusline_tab_warning = '[mixed-indenting]'
    elseif (spaces && !&et)
      let b:statusline_tab_warning = '[expandtab]'
    elseif (tabs && &et)
      let b:statusline_tab_warning = '[noexpandtab]'
    else
      let b:statusline_tab_warning = ''
    endif
  endif

  return b:statusline_tab_warning
endfunction

"}}}
"==========================================================================
" Acknowledgements                                                      {{{
"==========================================================================
"
" Derek Wyatt for Vim and .vimrc tips
" - http://derekwyatt.org/vim/the-vimrc-file/my-vimrc-file
"
" Scrooloose for status line stuff
" - http://github.com/scrooloose/vimfiles/blob/3cc6832ef77515f76d8d/vimrc
"
" Column-comment style and various settings
" - http://vi-improved.org/vimrc.php
"
" Takeshi Nishida (FuzzyFinder) for section folding inspi.vimrc
" - http://www.vim.org/scripts/script.php?script_id=1984
"
"}}}
"==========================================================================
" Scared by folding? Use 'zR' to open everything up.
" vim:et:sts=2:sw=2:tw=78:fdm=marker:
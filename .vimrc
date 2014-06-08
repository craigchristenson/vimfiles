"-- Main --------------------------------------------------------------
set nocompatible

" Pathogen initialization
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
call pathogen#infect()

syntax on    			" display syntax highlighting

"-- Indenting --------------------------------------------------------------
filetype plugin indent on    	" allow indenting
set noswapfile     		" do not use swapfile
set nobackup     		" do not create backups
set expandtab    		" use spaces instead of tabs
set shiftround           	" round indent to multiple of 'shiftwidth'
set shiftwidth=4		" match shifting to indenting
set tabstop=4			" indent two spaces by default
set autoindent			" match indent on new lines
set smartindent                 " auto indent text
set backspace=2

"-- Searching --------------------------------------------------------------
set nohlsearch                  " do not highlight search results
set ignorecase			" case-insensitive searching by default
set incsearch			" search as I type
set smartcase			" case-sensitive if I use an uppercase letter
set wrapscan			" wrap around the file when searching

"-- Scrolling --------------------------------------------------------------
set scrolloff=2
set sidescrolloff=10

"-- Wrapping --------------------------------------------------------------
set wrap
set linebreak

"-- Line Numbers ----------------------------------------------------------
set number
set numberwidth=4

"-- Other --------------------------------------------------------------
set hidden
set noerrorbells
set ruler
set showcmd
set showmatch
set autoread
set ttyfast

" RGrep
set grepprg=grep\ -nrI\ --exclude-dir=target\ --exclude-dir=tmp\ --exclude-dir=log\ --exclude="*.min.js"\ --exclude="*.log"\ $*\ /dev/null


vnoremap <C-X> "+D
vnoremap <C-C> "+Y
nnoremap <C-V> "+P

"-- Theme --------------------------------------------------------------
syntax enable
colorscheme jellybeans

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
let g:syntastic_enable_perl_checker = 1
let g:syntastic_quiet_messages = { "type": "style" }
let g:syntastic_quiet_messages = { "type": "tidy" }

"-- Key Mapping --------------------------------------------------------------
nnoremap <C-f> :bnext<CR>	" buffer next
nnoremap <C-b> :bprevious<CR>	" buffer prev
nnoremap <silent> ,hl :silent nohlsearch<CR>  " Un-highlight last search
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
map <F2> :ScratchOpen<CR>
map <F3> :RGrep<CR>
map <silent> <F4> :NERDTreeToggle<CR>
map <silent> <F5> :GundoToggle<CR>
map <silent> <F8> :TlistToggle<CR>
map <silent> <F6> :cnext<CR>
map <silent> <F7> :cprev<CR>
map <silent> <F12> :cclose<CR>

" Emacs style movement on command line. <C-n> and <C-p> wipe out my command
" " line cycling for things like the wildmenu, but it's well worth it
" " (especially since I primarily use FuzzyFinder).
cmap <c-b> <Left>
cmap <c-f> <Right>
cmap <c-p> <Up>
cmap <c-n> <Down>
cmap <m-b> <S-Left>
cmap <m-f> <S-Right>
cmap <c-a> <Home>
cmap <c-e> <End>

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
nnoremap <silent> ,ga :Gadd<CR>
nnoremap <silent> ,gg :Gstatus <C-R><C-W><CR>

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
  " Change Ruby indenting
  autocmd Filetype rb setlocal sts=2 sw=2
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

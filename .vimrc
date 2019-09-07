set encoding=utf-8
set fileencoding=utf-8
set shell=/bin/bash " http://stackoverflow.com/a/12231417
set diffopt+=iwhite,vertical
set pastetoggle=<F8>
set scrolloff=3
set switchbuf+=usetab,split
set startofline
set splitbelow
set lazyredraw
set nobackup
if !has('nvim') && &compatible
  set nocompatible
endif
set nofoldenable
set noshowmode
set noswapfile
set nowrap

" History
if has("persistent_undo")
	" mkdir -p ~/.vim/undodir
	let vimdir = '$HOME/.vim'
	let vimundodir = expand(vimdir . '/undodir')
	call system('mkdir ' . vimdir)
	call system('mkdir ' . vimundodir)
	
	let &undodir = vimundodir
	set undofile
endif

" Indentation
set cindent
set autoindent
set smartindent

" Tab
set softtabstop=4
set shiftwidth=4
set noexpandtab

" Searching
set incsearch
set ignorecase
set smartcase
set hlsearch | nohlsearch
set nowrapscan

" Line number column
set number
set cursorline
" 80th column color
set textwidth=80
set formatoptions-=t
if v:version >= 703
	set colorcolumn=+1,+2,+3
endif
set list
set wildmode=longest,full

" Easy newline insert
function! CustomEnter()
if &modifiable
	normal! o
	else
	" Exception for quickfix buffer and other unmodifiable buffers.
	" See https://vi.stackexchange.com/a/3129
	execute "normal! \<CR>"
	endif
endfunction
nnoremap <CR> :call CustomEnter()<CR>

autocmd Filetype gitcommit setlocal spell textwidth=72

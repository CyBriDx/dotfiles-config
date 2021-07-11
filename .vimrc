"NeoBundle Scripts-----------------------------

	if &compatible
	  set nocompatible               " Be iMproved
	endif

	" Required:
	set runtimepath+=/home/cybrid/.vim/bundle/neobundle.vim/

	" Required:
	call neobundle#begin(expand('/home/cybrid/.vim/bundle'))

	" Let NeoBundle manage NeoBundle
	" Required:
	NeoBundleFetch 'Shougo/neobundle.vim'

	" Add or remove your Bundles here:
	NeoBundle 'Shougo/neosnippet.vim'
	NeoBundle 'Shougo/neosnippet-snippets'
	NeoBundle 'tpope/vim-fugitive'
	NeoBundle 'ctrlpvim/ctrlp.vim'
	NeoBundle 'flazz/vim-colorschemes'
	NeoBundle 'dhruvasagar/vim-table-mode'
	NeoBundle 'preservim/nerdtree'
	NeoBundle 'vim-airline/vim-airline'
	NeoBundle 'vim-airline/vim-airline-themes'
	NeoBundle 'kaicataldo/material.vim', { 'branch': 'main' }
	NeoBundle 'ryanoasis/vim-devicons'
	NeoBundle 'tiagofumo/vim-nerdtree-syntax-highlight'
	NeoBundle 'prettier/vim-prettier'



	" Required:
	call neobundle#end()

	" Required:
	filetype plugin indent on

	" If there are uninstalled bundles found on startup,
	" this will conveniently prompt you to install them.
	NeoBundleCheck

"End NeoBundle Scripts-------------------------


"Miscellaneous---------------------------------
	
	:set number
	set encoding=UTF-8
	:silent !<command>

"End Miscellaneous-----------------------------



"NerdTree--------------------------------------

	let g:NERDTreeNodeDelimiter = "\u00a0"
	nnoremap <C-n> :NERDTreeMirror<CR>:NERDTreeFocus<CR>
	" Exit Vim if NERDTree is the only window left.
	autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"End NerdTree----------------------------------


"Prettier--------------------------------------

	let g:prettier#autoformat_config_present = 1
	let g:prettier#autoformat_config_files = ['.prettierrc']
	let g:prettier#autoformat_require_pragma = 0

"End Prettier----------------------------------

"Table Mode------------------------------------

	function! s:isAtStartOfLine(mapping)
	  let text_before_cursor = getline('.')[0 : col('.')-1]
	  let mapping_pattern = '\V' . escape(a:mapping, '\')
	  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
	  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
	endfunction

	inoreabbrev <expr> <bar><bar>
	          \ <SID>isAtStartOfLine('\|\|') ?
	          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
	inoreabbrev <expr> __
	          \ <SID>isAtStartOfLine('__') ?
	          \ '<c-o>:silent! TableModeDisable<cr>' : '__'

"End Table Mode--------------------------------

"Airline---------------------------------------

	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#tabline#left_sep = ' '
	let g:airline#extensions#tabline#left_alt_sep = '|'
	let g:airline_powerline_fonts = 1

"End Airline-----------------------------------


"Color Scheme----------------------------------
	
	"let g:material_terminal_italics = 1
	"let g:material_theme_style = 'dark'
	"colorscheme material

"End Color Scheme------------------------------

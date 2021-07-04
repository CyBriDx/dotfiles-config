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

	" Required:
	call neobundle#end()

	" Required:
	filetype plugin indent on

	" If there are uninstalled bundles found on startup,
	" this will conveniently prompt you to install them.
	NeoBundleCheck

"End NeoBundle Scripts-------------------------


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

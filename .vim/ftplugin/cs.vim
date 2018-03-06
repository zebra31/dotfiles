" setlocal tabstop=4
setlocal shiftwidth=4

" 空白文字ではなくてタブ文字を使用する
" setlocal noexpandtab

" Log
nnoremap gl yiwoDebug.Log("p:" + p);
vnoremap gl yoDebug.Log("p:" + p);
nnoremap gL yiwoDebug.Log("call p");
vnoremap gL yoDebug.Log("call p");

" null
nnoremap gN yiwoif(p == null){Debug.Log("p is null");}
vnoremap gN yoif(p == null){Debug.Log("p is null");}

" Assert
nnoremap ga yiwoDebug.Assert(p != null, "" + p);
vnoremap ga yoDebug.Assert(p != null, "" + p);

nnoremap <Leader>r :QuickRunCS<CR>
function! QuickRunCS() abort
  silent execute "!mcs %"
  let exeFile = "%:r".".exe"
  silent execute "!mono ".exeFile
  silent execute "!rm ".exeFile
endfunction
command! -bar QuickRunCS call QuickRunCS()

augroup cs_groupe
    autocmd!
    autocmd FileType cs set omnifunc=OmniSharp#Complete
augroup END

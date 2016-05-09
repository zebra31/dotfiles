let mapleader = "\<Space>"

" 分割したファイルの読み込み(view)
"-------------------------
" set runtimepath+=~/.vim/
" runtime! userautoload/*.vim
source ~/.vim/userautoload/neobundle.vim
source ~/.vim/userautoload/view.vim
source ~/.vim/userautoload/cpp.vim
source ~/.vim/userautoload/swift.vim
source ~/.vim/userautoload/go.vim
"-------------------------

au BufRead,BufNewFile *.md set filetype=markdown
" 入力完了を待たずに検索
set incsearch
" コマンドラインモードでtab保管
set wildmenu wildmode=list:full
nnoremap<ESC><ESC> :nohlsearch<CR>:args<CR>
set laststatus=2
set statusline=%F%r%h%=
" 検索時大文字小文字を区別しない
set ignorecase
" カーソルを行頭、行末で止まらないようにする
" set whichwrap=b,s,h,l,<,>,[,]
" buffer切り替え時ファイルを保存しなくてもよい
set hidden
set noswapfile
" macでクリップボード使用
set clipboard=unnamed,autoselect
" set clipboard+=unnamed
" ~(バックアップ)ファイル作成しない
set nobackup
" 挿入モードで移動できない問題解決
imap <ESC>OA <Up>
imap <ESC>OB <Down>
imap <ESC>OC <Right>
imap <ESC>OD <Left>
" 挿入モードで文字消せない問題解決
set backspace=indent,eol,start
" オリジナルヤンク
noremap yu 0wv$hy
" 単語をヤンクレジスタで置換
nnoremap <silent> cy ce<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
vnoremap <silent> cy c<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
nnoremap <silent> ciy ciw<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
" ペースト直後に選択
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'
" Insertモードのときカーソルの形状を変更
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
inoremap <Esc> <Esc>
inoremap jj <ESC><ESC><ESC> 
noremap j gj
noremap k gk
" Insertモードで日本語の時色変更
if has('multi_byte_ime') || has('xim') 
   highlight Cursor guifg=#000d18 guibg=#8faf9f gui=bold
   highlight CursorIM guifg=NONE guibg=#ecbcbc
endif
"検索語が画面の真ん中に来るようにする
" nmap n nzz 
"nmap N Nzz 
" nmap * *zz 
" nmap # #zz 
" nmap g* g*zz 
" nmap g# g#zz
" Visual line やりやすく
" nmap vv V
" nmap vb viw
" v押す度拡大
" vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
" 矩形をブロックにする
set virtualedit=block
" 履歴数増量
set history=200
" ディレクトリを手早く展開
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
" 貼り付けたらテキストの末尾へ
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
" メモ取りやすくする
inoremap <S-Tab> <Left><Left><backspace><backspace><backspace><backspace><Right><Right>
inoremap g<Tab> <Left><Left><tab><Right><Right>
inoremap <Tab> <tab>
" カレンダー
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
" diffすぐ出す
nnoremap diff :vertical diffsplit f
" 全選択
nnoremap g0 ggVG
" 全インデント揃える
nnoremap gi ggVG=''zz
" 対応する括弧へ移動しやすく
nmap <Tab> %
vmap <Tab> %
" Screen split key mappings
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>o
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>
nnoremap s% :%s ///g

nnoremap gst :Gstatus<Cr>
nnoremap gad :Gwrite<Cr>
nnoremap gcm :Gcommit<Cr>
nnoremap gco :Gread<Cr>
nnoremap gbl :Gblame<Cr>
nnoremap glg :Glog<Cr>
nnoremap gdf :Gdiff<Cr>
nnoremap gfc :Gfetch<Cr>
nnoremap gpu :Gpush<Cr>
nnoremap gr :Ggrep 

nnoremap <leader>ma :marks<CR>
nnoremap <leader>d :vertical diffsplit 
nnoremap <leader>u :Unite source<CR>
nnoremap <leader>f :VimFiler -split -simple -winwidth=25 -no-quit<CR>
nnoremap <leader>ml :DoShowMarks!<CR>
nnoremap <leader>md :NoShowMarks!<CR>
nnoremap <leader>r :QuickRun<CR>
nnoremap <leader>v :VimShell<CR>
nnoremap <leader>c :Calendar<CR>
nnoremap gt :Calendar -view=clock<CR>
autocmd FileType markdown nnoremap <Space>r :PrevimOpen<CR>
autocmd FileType html nnoremap <Space>r :!open %<CR>
autocmd FileType tex nnoremap <Space>r :QuickRun<CR>:!latexmk -c<CR>
nnoremap <Leader>o :Unite file<CR>
nnoremap <Leader>a :VimFiler -split -simple -winwidth=25 -no-quit<CR>:TagbarToggle<CR>
nnoremap <Leader>l <Space>
nnoremap <Leader>go :!open .<CR><CR>

rv! " 履歴共有
" save and close
nnoremap <leader>w :w<Cr>
nnoremap <leader>q :q<Cr>
nnoremap <leader>2 :wq<Cr>
nnoremap <leader>! :q!<Cr>
cnoreabbrev wq!! w !sudo tee > /dev/null %<CR>:q!<CR>
cnoreabbrev w!! w !sudo tee > /dev/null %

call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')

""""""""""""""""""""""""""""""
" 2度押しで囲む
""""""""""""""""""""""""""""""
noremap {{ wbi{<Esc>f<Space>i}<Esc><Cr>
noremap g[[ wbi[<Esc>f<Space>i]<Esc><Cr>
noremap (( wbi(<Esc>f<Space>i)<Esc><Cr>
noremap g<< wbi<<Esc>f<Space>i><Esc><Cr>
noremap ~~ wbi~~<Esc>f<Space>i~~<Esc><Cr>
noremap "" wbi"<Esc>f<Space>i"<Esc><Cr>
""""""""""""""""""""""""""""""
" 最後のカーソル位置を復元する
""""""""""""""""""""""""""""""
if has("autocmd")
   autocmd BufReadPost *
            \ if line("'\"") > 0 && line ("'\"") <= line("$") |
            \   exe "normal! g'\"" |
            \ endif
endif
""""""""""""""""""""""""""""""
" grepをQuickFixで開く
""""""""""""""""""""""""""""""
augroup grepopen
    " autocmd!
    " autocmd QuickfixCmdPost vimprep cw
    autocmd QuickFixCmdPost *grep* cwindow
augroup END
"""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" マーク周りの改善
""""""""""""""""""""""""""""""
noremap ' `
" 最初からマークを表示する
aug show-marks-sync
   au!
   au BufReadPost * sil! DoShowMarks
aug END
nnoremap mm :NoShowMarks!<CR>:DoShowMarks!<CR>

" 選択してもそのまま貼り付けられるようにする----------
vnoremap <silent> p "0p<CR>

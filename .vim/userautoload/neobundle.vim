"---------------------------
" Start Neobundle Settings.
"---------------------------
" NeoBundle が無ければインストール
if !isdirectory(expand('$HOME/.vim/bundle'))
    call system('mkdir -p $HOME/.vim/bundle')
    call system('git clone https://github.com/Shougo/neobundle.vim.git $HOME/.vim/bundle/neobundle.vim')
    source $HOME/.vimrc
    NeoBundleInstall
    q
endif

" Vim 起動時のみ実行
if has('vim_starting')
    if &compatible
        set nocompatible               " Be iMproved
    endif
    set runtimepath+=~/.vim/bundle/neobundle.vim/
    call neobundle#begin(expand('~/.vim/bundle/'))

    "--------------------------------------------"
    " Let NeoBundle manage NeoBundle
    "--------------------------------------------"

    " NeoBundle 自体を NeoBundle で管理
    NeoBundleFetch 'Shougo/neobundle.vim'
    " Vim上でデータを操作するためのインターフェース
    NeoBundle 'Shougo/unite.vim'
    " カレンダー
    NeoBundle 'itchyny/calendar.vim'
    NeoBundle 'flazz/vim-colorschemes'
    " 非同期コンパイル (OmniSharpのローカルサーバの起動管理を自動化するのに必要)
    NeoBundle 'tpope/vim-dispatch'
    " Uniteを利用してカラースキーム一覧表示を行う(:Unite colorscheme -auto-preview)
    NeoBundle 'ujihisa/unite-colorscheme'
    NeoBundle 'lervag/vimtex' " Vim上でtexの部分コンパイルをする
    " 単語の前後に入力(Clipboardコピーできなくなる?)
    " NeoBundle 'tpope/vim-surround'
    " macのClipboardと連携(嘘)
    " NeoBundle 'kana/vim-fakeclip'
    NeoBundle 'fuenor/vim-wordcount'
    NeoBundle 'AndrewRadev/switch.vim' " true/false toggleするやつ, 自分で定義もできるっぽい
    " 一括置換(まだ使いこなせてない)
    NeoBundle 'osyo-manga/vim-over'
    " URL開く
    NeoBundle 'tyru/open-browser.vim'
    let g:netrw_nogx = 1 " disable netrw's gx mapping.
    nmap gx <Plug>(openbrowser-smart-search)
    vmap gx <Plug>(openbrowser-smart-search)
    "" over.vim {{{
    " over.vimの起動
    nnoremap <silent> <Leader>m :OverCommandLine<CR>
    " カーソル下の単語をハイライト付きで置換
    nnoremap sub :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>
    " コピーした文字列をハイライト付きで置換
    nnoremap subp y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>
    " 対応括弧を自動入力
    NeoBundle 'jiangmiao/auto-pairs'
    " }}}
    " ヤンク履歴をペーストの後変更できる
    " NeoBundle 'YankRing.vim'
    " NeoBundle 'LeafCage/yankround.vim'
    " NeoBundle 'kien/ctrlp.vim'
    " yankround.vim {{{
    "" キーマップ
    " nmap p <Plug>(yankround-p)
    " nmap P <Plug>(yankround-P)
    " nmap <C-p> <Plug>(yankround-prev)
    " nmap <C-n> <Plug>(yankround-next)
    "" 履歴取得数
    " let g:yankround_max_history = 50
    ""履歴一覧(kien/ctrlp.vim)
    " nnoremap <silent>g<C-p> :<C-u>CtrlPYankRound<CR>
    " }}}
    " putした後履歴選択
    " NeoBundle 'LeafCage/yankround.vim'
    " let g:yankround_max_history = 35
    " nmap p <Plug>(yankround-p)
    " nmap P <Plug>(yankround-P)
    " nmap gp <Plug>(yankround-gp)
    " nmap gP <Plug>(yankround-gP)
    " nmap <C-p> <Plug>(yankround-prev)
    " nmap <C-n> <Plug>(yankround-next)
    " Vim上でtexの部分コンパイルをする
    " vimから実行する
    NeoBundle 'thinca/vim-quickrun'
    let g:quickrun_config = get(g:, 'quickrun_config', {})
    let g:quickrun_config._ = {
                \ 'runner'    : 'vimproc',
                \ 'runner/vimproc/updatetime' : 60,
                \ 'outputter' : 'error',
                \ 'outputter/error/success' : 'buffer',
                \ 'outputter/error/error'   : 'quickfix',
                \ 'outputter/buffer/split'  : ':rightbelow 5sp',
                \ 'outputter/buffer/close_on_empty' : 1,
                \ }
    " texファイルをQuickRunでコンパイルする際の設定
    let g:quickrun_config['tex'] = {
                \ 'command' : 'latexmk',
                \ 'outputter' : 'error',
                \ 'outputter/error/success' : 'buffer',
                \ 'outputter/error/error' : 'quickfix',
                \ 'srcfile' : expand("%"),
                \ 'cmdopt': '-pdfdvi',
                \ 'hook/sweep/files' : [
                \ '%S:p:r.aux',
                \ '%S:p:r.bbl',
                \ '%S:p:r.blg',
                \ '%S:p:r.dvi',
                \ '%S:p:r.fdb_latexmk',
                \ '%S:p:r.fls',
                \ '%S:p:r.log',
                \ '%S:p:r.out',
                \ '%S:p:r.synctex.gz',
                \ ],
                \ 'exec': ['%c %o %a %s']
                \ }

    " <C-c> で実行を強制終了させる
    " quickrun.vim が実行していない場合には <C-c> を呼び出す
    nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
    " 入力補完
    if has('lua')
        " luaインタプリタがある場合はNeoCompleteがインストールされるよ
        " NeoCompleteはNeoComplcacheの新しいバージョンだよ
        " NeoComplcacheと比較して高速化等がなされてるらしいよ
        NeoBundle 'Shougo/neocomplete.vim', {
                    \ 'depends' : 'Shougo/vimproc.vim',
                    \ 'autoload' : { 'insert' : 1,}
                    \ }
    else
        " luaインタプリタが無い場合はNeoComplcacheがインストールされるよ
        " NeoComplcacheはNeoCompleteの古いバージョンだよ
        NeoBundle 'Shougo/neocomplcache.vim'
    endif
    " swift
    if has("mac")
        NeoBundle 'toyamarinyon/vim-swift'
        let g:quickrun_config['swift'] = {
                    \ 'command': 'xcrun',
                    \ 'cmdopt': 'swift',
                    \ 'exec': '%c %o %s',
                    \}
        NeoBundle 'keith/sourcekittendaemon.vim'
    endif
    " VimScriptで作ってあるshell
    " 導入にはvimprocが必要で、加えてunite.vimとneocomplcacheまたはneocompleteがないと、一部の拡張機能が使えない。
    " vimprocはmakeしないとダメ
    " ~/.vim/bundle/vimproc/make
    NeoBundle 'Shougo/vimshell.vim'
    " VimShellでssh
    NeoBundle 'ujihisa/vimshell-ssh'
    NeoBundle 'Shougo/vimfiler.vim'
    NeoBundle 'kana/vim-submode'
    " Vimproc（非同期処理を実現するプラグイン：重たい処理実施時にVimがフリーズしない様にします）
    NeoBundle 'Shougo/vimproc.vim', {
                \ 'build' : {
                \ 'windows' : 'tools\\update-dll-mingw',
                \ 'cygwin' : 'make -f make_cygwin.mak',
                \ 'mac' : 'make -f make_mac.mak',
                \ 'linux' : 'make',
                \ 'unix' : 'gmake',
                \ },
                \ }
    " markdown preview
    NeoBundle 'plasticboy/vim-markdown' " シンタックスハイライト,自動折り畳み
    NeoBundle 'kannokanno/previm'
    NeoBundle 'tyru/open-browser.vim'
    " snippet
    NeoBundle 'Shougo/neosnippet'
    NeoBundle "Shougo/neosnippet-snippets"
    NeoBundle "honza/vim-snippets"
    let g:neosnippet#snippets_directory='~/.vim/snippets/'
    au BufRead,BufNewFile *.md set filetype=markdown
    let g:previm_open_cmd = 'open -a Safari'
    " Python用入力補完
    " NeoBundle 'davidhalter/jedi-vim'
    " Goのなにか
    NeoBundle 'fatih/vim-go'
    " Git
    NeoBundle 'tpope/vim-fugitive'
    " 選択範囲拡大
    NeoBundle "terryma/vim-expand-region"
    " コメントアウト
    NeoBundle 'tomtom/tcomment_vim'
    " 検索爆速
    NeoBundle 'haya14busa/vim-easymotion'
    " ctags (brew install ctagsしておく必要がある)
    NeoBundle 'soramugi/auto-ctags.vim'
    " ctagsのタグリスト一覧
    NeoBundleLazy "majutsushi/tagbar", {
                \ "autoload": { "commands": ["TagbarToggle"] }}
    if ! empty(neobundle#get("tagbar"))
        " Width (default 40)
        let g:tagbar_width = 20
        " Map for toggle
        nnoremap <silent> <Leader>t :TagbarToggle<CR>
    endif
    " 構文チェック
    NeoBundle 'scrooloose/sYntastic.git'
    " マークを可視化
    NeoBundle 'jacquesbh/vim-showmarks'
    " NeoBundle 'vim-scripts/ShowMarks'
    " インデントに色を付けて見やすくする
    NeoBundle 'nathanaelkane/vim-indent-guides'
    " undoをツリーで可視化
    NeoBundle 'sjl/gundo.vim'
    nmap U :<C-u>GundoToggle<CR>
    " Visualモードで*使える
    NeoBundle 'thinca/vim-visualstar'
    " ローマ字で日本語検索(g/)(brew install cmigemo)(gvim限定)
    NeoBundle 'haya14busa/vim-migemo'
    " html爆速
    NeoBundle 'mattn/emmet-vim'
    " kotlin
    NeoBundle 'udalov/kotlin-vim'
    " c++
    NeoBundle 'justmao945/vim-clang'
    " include系?
    NeoBundle 'Shougo/neoinclude.vim'
    let g:clang_c_options = '-std=c11'
    let g:clang_cpp_options = '-std=c++1z -stdlib=libc++ --pedantic-errors'
    " vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
    let g:indent_guides_enable_on_vim_startup=1
    let g:indent_guides_start_level=2
    let g:indent_guides_auto_colors=0
    " タブ色
    " autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=240
    " autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=239
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=239
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=238
    let g:indent_guides_color_change_percent = 30
    let g:indent_guides_guide_size = 1
    " Cppシンタックスハイライト
    NeoBundleLazy 'vim-jp/cpp-vim', {
                \ 'autoload' : {'filetypes' : 'cpp'}
                \ }
    " ヘッダファイルとソースファイル切り替え
    NeoBundle 'kana/vim-altr'
    nmap <Leader>a <Plug>(altr-forward)
    " includeファイルのパス
    augroup cpp-path
        autocmd!
        autocmd FileType cpp setlocal path=.,/usr/include,/usr/local/include,/usr/lib/c++/v1
    augroup END
    " 文脈を考慮した補完
    if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
    endif
    let g:neocomplete#force_omni_input_patterns.cpp =
                \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
    " 補完候補生成
    NeoBundleLazy 'osyo-manga/vim-marching', {
                \ 'depends' : ['Shougo/vimproc.vim', 'osyo-manga/vim-reunions'],
                \ 'autoload' : {'filetypes' : ['c', 'cpp']}
                \ }
    let g:marching_enable_neocomplete = 1

    call neobundle#end()
endif

"--------
"go
NeoBundleLazy 'fatih/vim-go', {
            \ 'autoload' : { 'filetypes' : 'go'  }
            \ }
"--------


"--------
"TNaky 補完,ctags
"--------
" 入力補完設定
if neobundle#is_installed('neocomplete.vim')
    " NeoComplete用設定
    " Neocompleteを有効化
    let g:neocomplete#enable_at_startup = 1
    " 補完が自動で開始される文字数
    let g:neocomplete#auto_completion_start_length = 2
    " Smart caseを有効化（大文字が入力されるまで，大文字小文字の区別を考慮しない）
    let g:neocomplete#enable_smart_case = 1
    " camle caseを有効化（大文字を区切りとしたワイルドカードのように振る舞う）
    let g:neocomplete#enable_camel_case_completion = 1
    " アンダーバー区切りの補完を有効化
    let g:neocomplete#enable_underbar_completion = 1
    " シンタックスをキャッシュするときの最大文字長を25に設定
    let g:neocomplete#min_syntax_length = 25
    " neocomplete を自動的にロックするバッファ名のパターン
    let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
    " 日本語入力時、無効化
    let g:neocomplete#lock_iminsert = 1
    " ハイフンの入力による候補番号の標示
    let g:neocomplete#enable_quick_match = 1
    " 提示される候補の最大数（初期値：100）
    let g:neocomplete#max_list = 30
    " 補完候補提示の際に先頭を選択状態へ
    let g:neocomplete#enable_auto_select = 1
    " 補完（小文字を無視して検索）
    let g:neocomplete#enable_refresh_always = 1
    " 辞書ファイルの定義
    let g:neocomplete#sources#dictionary#dictionaries = {
                \ 'default' : '',
                \ }
    " キーワードの定義
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns._ = '\h\w*'
    " jedi-vimの設定(omni補完の自動補完に必要)
    autocm FileType python setlocal omnifunc=jedi#completions completeopt-=preview
    let g:jedi#completions_enabled = 0
    let g:jedi#auto_vim_configuration = 0

    if !exists('g:neocomplete#sources#omni#input_patterns')
        let g:neocomplete#sources#omni#input_patterns = {}
    endif
    let g:neocomplete#sources#omni#input_patterns.cs = '.*[^=\);]'

    " ローカルサーバ?と通信してC#の補完をしてくれる
    NeoBundleLazy 'OmniSharp/omnisharp-vim', {
                \   'autoload': { 'filetypes': [ 'cs', 'csi', 'csx' ] },
                \   'build': {
                \     'windows' : 'msbuild server/OmniSharp.sln',
                \     'mac': 'xbuild server/OmniSharp.sln',
                \     'unix': 'xbuild server/OmniSharp.sln',
                \   },
                \ }
    inoremap <expr> <CR>    pumvisible() ? "\<C-y>" : "\<CR>"
    inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
    " ポップアップ削除
    inoremap <expr><C-h> neocomplcache#smart_close_popup().”\<C-h>”

elseif neobundle#is_installed('neocomplcache')
    " NeoComplcache用設定
    let g:neocomplcache_enable_at_startup = 1
    let g:neocomplcache_enable_ignore_case = 1
    let g:neocomplcache_enable_smart_case = 1
    if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}e*
    endif
    let g:neocomplcache_keyword_patterns._ = '\h\w*'
    let g:neocomplcache_enable_camel_case_completion = 1
    let g:neocomplcache_enable_underbar_completion = 1
    " 日本語入力時、無効化
    let g:neocomplcache#lock_iminsert = 1

endif

" タグジャンプについての設定
" 保存時tags生成
let g:auto_ctags = 1
" 保存場所指定
let g:auto_ctags_directory_list = ['.git', '.svn']
" タグファイルの場所
set tags+=.git/tags
" ctagsのオプションを設定してるよ(これやると生成されない)
" let g:auto_ctags_tags_args = '--tag-relative --recurse --sort=yes --edit_action'
" 拡張子毎に作成(これやると生成されない)
" let g:auto_ctags_filetype_mode = 1

" vim-easymotion {{{
" nmap g/ <Plug>(easymotion-s)
" xmap g/ <Plug>(easymotion-s)
" nmap g/ <Plug>(easymotion-sn)
" xmap g/ <Plug>(easymotion-sn)
" omap g/ <Plug>(easymotion-tn)
" let g:EasyMotion_smartcase = 1
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>l <Plug>(easymotion-w)
map <Leader>h <Plug>(easymotion-b)
let g:EasyMotion_startofline = 0
" let g:EasyMotion_use_upper = 1
" let g:EasyMotion_enter_jump_first = 1
" let g:EasyMotion_space_jump_first = 1
" hi EasyMotionTarget guifg=#80a0ff ctermfg=81
" }}}

" Undo ツリー
function! MyFugitive()
    try
        if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
            let _ = fugitive#head()
            return strlen(_) ? '⭠ '._ : ''
        endif
    catch
    endtry
    return ''
endfunction

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"-------------------------
" End Neobundle Settings.
"-------------------------

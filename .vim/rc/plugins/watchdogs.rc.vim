let g:quickrun_config = get(g:, 'quickrun_config', {})
let g:quickrun_config['watchdogs_checker/_'] = {'outputter/quickfix/open_cmd': ''}
" ファイルの保存時にチェックを行う
let g:watchdogs_check_BufWritePost_enable = 1
let g:watchdogs_check_BufWritePost_enables = {'vim': 0}
let g:watchdogs_check_CursorHold_enable    = 1
let g:watchdogs_check_CursorHold_enables   = {'vim': 0}

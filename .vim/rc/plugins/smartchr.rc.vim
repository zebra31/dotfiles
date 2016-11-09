inoremap <buffer> <expr> = smartchr#loop('=', '==', '+=', '-=')
inoremap <buffer> <expr> + smartchr#loop('+', '++', '+=')
inoremap <buffer> <expr> - smartchr#loop('-', '--', '-=')
inoremap <buffer> <expr> * smartchr#loop('*', '**')
inoremap <buffer> <expr> , smartchr#loop(', ', '←', '↓', '↑', '→')
inoremap <buffer> <expr> : smartchr#loop(': ', '::')
inoremap <buffer> <expr> ! smartchr#loop('!', '!=', '!!')
inoremap <buffer> <expr> ) smartchr#loop(')', ')<Left>')
inoremap <buffer> <expr> ] smartchr#loop(']', ']<Left>')
inoremap <buffer> <expr> " smartchr#loop('"', '""', '""<Left>')
inoremap <buffer> <expr> ' smartchr#loop("'", "''", "''<Left>")
inoremap <buffer> <expr> { smartchr#loop('{', ' {<Cr>}<Left><Cr><Up><Tab>')
inoremap <buffer> <expr> . smartchr#loop('.', '->', '...')
inoremap <buffer> <expr> ; smartchr#loop(';', '->', ';;;')
inoremap <buffer> <expr> @ search('^\(#.\+\)\?\%#','bcn')? smartchr#loop('#define', '#include', '#ifdef', '#endif', '@'): '@'
inoremap <buffer> <expr> - search('^\(#.\+\)\?\%#','bcn')? smartchr#loop('- ', '-'): '-'
inoremap <buffer> <expr> * search('^\(#.\+\)\?\%#','bcn')? smartchr#loop('* ', '*'): '*'
" autocmd FileType markdown inoremap <buffer> <expr> - smartchr#loop('- ', '-')
" autocmd FileType markdown inoremap <buffer> <expr> * smartchr#loop('* ', '*')

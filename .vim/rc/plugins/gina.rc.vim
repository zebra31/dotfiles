call gina#custom#mapping#nmap('status', '<F12>', ':<C-u>call gina#action#call(''toggle'')<CR>', {'noremap': 1, 'silent': 1})
call gina#custom#mapping#nmap('status', 'dd', ':<C-u>call gina#action#call(''toggle'')<CR>', {'noremap': 1, 'silent': 1})
call gina#custom#mapping#nmap('status', 'cc', ':<C-u>Gina commit -v<CR>', {'noremap': 1, 'silent': 1})
call gina#custom#mapping#nmap('branch', 'yy', '<Plug>(gina-yank-rev)')
call gina#custom#mapping#nmap('branch', 'cc', '<Plug>(gina-branch-new)')
call gina#custom#mapping#nmap('branch', 'dd', '<Plug>(gina-branch-delete)')
call gina#custom#mapping#nmap('branch', 'DD', '<Plug>(gina-branch-delete-force)')
call gina#custom#mapping#nmap('branch', 'mm', '<Plug>(gina-branch-move)')
call gina#custom#mapping#nmap('branch', 'MM', '<Plug>(gina-branch-move-force)')
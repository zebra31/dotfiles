function! AutoMethodMakeMacro() abort
  normal 0wms"my$gg/class
endfunction
command -bar AutoMethodMakeMacro call AutoMethodMakeMacro()

" _xxxYYY to mXxxYYY
function! ChangeUnderToM() abort
  normal mz/_
endfunction
command! -bar ChangeUnderToM call ChangeUnderToM()
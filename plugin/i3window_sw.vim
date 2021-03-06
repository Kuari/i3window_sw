" --------------------------------
" Add our plugin to the path
" --------------------------------
if !(has('python3') || has('python'))
    echo "Error: Required vim compiled with +python or +python3"
    finish
endif

python3 import sys
python3 import vim
python3 sys.path.append(vim.eval('expand("<sfile>:h")'))

" --------------------------------
"  Function(s)
" --------------------------------
function! Separate()
python3 << endOfPython
from i3window_sw import separate
try:
    terminal = vim.eval("g:i3window_sw_terminal='xfce4-terminal'")

    separate(terminal)
except:
    separate()

endOfPython
endfunction

function! Merge()
python3 << endOfPython

from i3window_sw import merge
merge()

endOfPython
endfunction

" --------------------------------
"  Expose our commands to the user
" --------------------------------
command! Separate call Separate()
command! Merge call Merge()

function! s:Visual()
    return visualmode() == 'V'
endfunction

function! user_defined#visual_movement#move_up() abort range
    let l:at_top=a:firstline == 1
    if s:Visual() && !l:at_top
        '<,'>move '<-2
        call feedkeys('gv=', 'n')
    endif
    call feedkeys('gv', 'n')
endfunction


function! user_defined#visual_movement#move_down() abort range
    let l:at_bottom=a:firstline == line('$')
    if s:Visual() && !l:at_bottom
        '<,'>move '>+1
        call feedkeys('gv=', 'n')
    endif
    call feedkeys('gv', 'n')
endfunction

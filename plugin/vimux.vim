if exists('g:loaded_vimux_plugin')
	finish
endif
let g:loaded_vimux_plugin = 1

if !has('terminal')
	throw 'this version of vim does not support +terminal'
endif

" By default, use termwinkey of tmux <C-b>.
if !exists('g:vimux_termwinkey')
	let g:vimux_termwinkey = '<C-b>'
endif

" By default, split right / below.
if !exists('g:vimux_no_split_right_below')
	set splitright
	set splitbelow
endif

function! s:term_init() abort
           " C-b         Send the prefix key (C-b) through to the application.
	let &l:termwinkey=g:vimux_termwinkey

	" Window Management
           " c           Create a new window.
	tnoremap <silent> <buffer> <C-b>c <C-b>:tabe | term ++curwin
           " n           Change to the next window.
	tnoremap <silent> <buffer> <C-b>n <C-b>:tabnext
           " p           Change to the previous window.
	tnoremap <silent> <buffer> <C-b>p <C-b>:tabprev
           " 0 to 9      Select windows 0 to 9.
	tnoremap <silent> <buffer> <C-b>0 <C-b>:tabnext 1
	tnoremap <silent> <buffer> <C-b>1 <C-b>:tabnext 2
	tnoremap <silent> <buffer> <C-b>2 <C-b>:tabnext 3
	tnoremap <silent> <buffer> <C-b>3 <C-b>:tabnext 4
	tnoremap <silent> <buffer> <C-b>4 <C-b>:tabnext 5
	tnoremap <silent> <buffer> <C-b>5 <C-b>:tabnext 6
	tnoremap <silent> <buffer> <C-b>6 <C-b>:tabnext 7
	tnoremap <silent> <buffer> <C-b>7 <C-b>:tabnext 8
	tnoremap <silent> <buffer> <C-b>8 <C-b>:tabnext 9
	tnoremap <silent> <buffer> <C-b>9 <C-b>:tabnext 10

	" Pane Management
           " %           Split the current pane into two, left and right.
	tnoremap <silent> <buffer> <C-b>% <C-b>:vert new | term ++curwin
           " "           Split the current pane into two, top and bottom.
	tnoremap <silent> <buffer> <C-b>" <C-b>:term
           " C-o         Rotate the panes in the current window forwards.
	tnoremap <silent> <buffer> <C-b><C-o> <C-b>R
           " M-o         Rotate the panes in the current window backwards.
	tnoremap <silent> <buffer> <C-b><M-o> <C-b>R
           " !           Break the current pane out of the window.
	tnoremap <silent> <buffer> <C-b>! <C-b>T
           " x           Kill the current pane.
	tnoremap <silent> <buffer> <C-b>x <C-b><C-c>
           " ;           Move to the previously active pane.
	tnoremap <silent> <buffer> <C-b>; <C-b>p
           " o           Select the next pane in the current window.
	tnoremap <silent> <buffer> <C-b>o <C-b>w
           " {           Swap the current pane with the previous pane.
	tnoremap <silent> <buffer> <C-b>{ <C-b>k<C-b>x
           " }           Swap the current pane with the next pane.
	tnoremap <silent> <buffer> <C-b>} <C-b>x
           " C-Up, C-Down
           " C-Left, C-Right
           "             Resize the current pane in steps of one cell.
	tnoremap <silent> <buffer> <C-b><C-Up> <C-b>+
	tnoremap <silent> <buffer> <C-b><C-Down> <C-b>-
	tnoremap <silent> <buffer> <C-b><C-Left> <C-b><
	tnoremap <silent> <buffer> <C-b><C-Right> <C-b>>
           " M-Up, M-Down
           " M-Left, M-Right
           "             Resize the current pane in steps of five cells.
	tnoremap <silent> <buffer> <C-b><M-Up> <C-b>:resize +5
	tnoremap <silent> <buffer> <C-b><M-Down> <C-b>:resize -5
	tnoremap <silent> <buffer> <C-b><M-Left> <C-b>:vertical resize -5
	tnoremap <silent> <buffer> <C-b><M-Right> <C-b>:vertical resize +5

	" Scrolling
           " Page Up     Enter copy mode and scroll one page up.
	tnoremap <silent> <buffer> <C-b><PageUp> <C-b>N<PageUp>

	" Housekeeping
           " C-z         Suspend the tmux client.
	tnoremap <silent> <buffer> <C-z> <C-b>N<C-z>
           " t           Show the time.
	tnoremap <silent> <buffer> <C-b>t <C-b>:echo strftime('%c')
           " ?           List all key bindings.
	tnoremap <silent> <buffer> <C-b>? <C-b>:tmap

           " #           List all paste buffers.
           " $           Rename the current session.
           " &           Kill the current window.
           " '           Prompt for a window index to select.
           " (           Switch the attached client to the previous session.
           " )           Switch the attached client to the next session.
           " -           Delete the most recently copied buffer of text.
           " .           Prompt for an index to move the current window.
           " =           Choose which buffer to paste interactively from a list.
           " D           Choose a client to detach.
           " L           Switch the attached client back to the last session.
           " [           Enter copy mode to copy text or view the history.
           " ]           Paste the most recently copied buffer of text.
           " ,           Rename the current window.
           " d           Detach the current client.
           " f           Prompt to search for text in open windows.
           " i           Display some information about the current window.
           " m           Mark the current pane (see select-pane -m).
           " M           Clear the marked pane.
           " q           Briefly display pane indexes.
           " r           Force redraw of the attached client.
           " s           Select a new session for the attached client interactively.
           " w           Choose the current window interactively.
           " z           Toggle zoom state of the current pane.
           " ~           Show previous messages from tmux, if any.
           " M-1 to M-5  Arrange panes in one of the five preset layouts: even-horizontal, even-vertical, main-hori‐
           "             zontal, main-vertical, or tiled.
           " Space       Arrange the current window in the next preset layout.
           " M-n         Move to the next window with a bell or activity marker.
           " M-p         Move to the previous window with a bell or activity marker.

	" implicitly supported
           " :           Enter the tmux command prompt.
           " Up, Down
           " Left, Right
           "             Change to the pane above, below, to the left, or to the right of the current pane.
endfunction

augroup multiplexer_vim
	autocmd!
	autocmd TerminalWinOpen * call s:term_init()
augroup END

command! Vimux term ++curwin


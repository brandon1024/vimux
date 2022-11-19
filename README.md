# Vimux

A vim-based terminal multiplexer that feels a bit like tmux. Because why the
hell not.

Vim 8.1 introduced the ability to run a terminal with the `:term` command. This
plugin takes this functionality and combines it with Vim's window and tab
management to create an environment that feels a lot like tmux. That's pretty
much it.

Vimux supports a good chunk of the default tmux bindings out of the box. See
the `notes` section for mappings that aren't implemented.

## How do I install vimux?

With your favourite plugin manager!

With [vim-plug](https://github.com/junegunn/vim-plug):

```
Plug 'brandon1024/vimux'
```

## Usage

### From Vim

Simple.

```
:Vimux
```

<sup>Careful running Vimux in an existing vim session, it'll overwrite some
settings and mappings. Consider running Vimux in a new session, or see "From
Terminal" below.</sup>

### From Terminal

Also simple.

```
$ vim -c :Vimux
```

Or better yet.

```
$ alias vimux='vim -c :Vimux'
$ vimux
```

## Notes

### Supported Mappings

The following list summarizes all of the mappings that have been implemented.

- `C-b`         Send the prefix key (C-b) through to the application.
- `c`           Create a new window.
- `n`           Change to the next window.
- `p`           Change to the previous window.
- `0 to 9`      Select windows 0 to 9.
- `%`           Split the current pane into two, left and right.
- `"`           Split the current pane into two, top and bottom.
- `C-o`         Rotate the panes in the current window forwards.
- `M-o`         Rotate the panes in the current window backwards.
- `!`           Break the current pane out of the window.
- `x`           Kill the current pane.
- `;`           Move to the previously active pane.
- `o`           Select the next pane in the current window.
- `{`           Swap the current pane with the previous pane.
- `}`           Swap the current pane with the next pane.
- `C-Up`, `C-Down`, `C-Left`, `C-Right` Resize the current pane in steps of one cell.
- `M-Up`, `M-Down`, `M-Left`, `M-Right` Resize the current pane in steps of five cells.
- `Page Up`     Enter copy mode and scroll one page up.
- `C-z`         Suspend the tmux client.
- `t`           Show the time.
- `?`           List all key bindings.
- `:`           Enter the tmux command prompt.
- `Up`, `Down`, `Left`, `Right` Change to the pane above, below, to the left, or to the right of the current pane.

### Unsupported Mappings

The following list summarizes all of the mappings that have not been
implemented. Some of these mappings don't correlate to vim concepts, while
others (e.g. `l`) make window navigation a bit annoying.

- `#`           List all paste buffers.
- `$`           Rename the current session.
- `&`           Kill the current window.
- `'`           Prompt for a window index to select.
- `(`           Switch the attached client to the previous session.
- `)`           Switch the attached client to the next session.
- `-`           Delete the most recently copied buffer of text.
- `.`           Prompt for an index to move the current window.
- `=`           Choose which buffer to paste interactively from a list.
- `D`           Choose a client to detach.
- `L`           Switch the attached client back to the last session.
- `[`           Enter copy mode to copy text or view the history.
- `]`           Paste the most recently copied buffer of text.
- `,`           Rename the current window.
- `d`           Detach the current client.
- `f`           Prompt to search for text in open windows.
- `i`           Display some information about the current window.
- `m`           Mark the current pane (see select-pane -m).
- `M`           Clear the marked pane.
- `q`           Briefly display pane indexes.
- `r`           Force redraw of the attached client.
- `s`           Select a new session for the attached client interactively.
- `w`           Choose the current window interactively.
- `z`           Toggle zoom state of the current pane.
- `~`           Show previous messages from tmux, if any.
- `l`           Move to the previously selected window.
- `M-1` to `M-5`  Arrange panes in one of the five preset layouts: even-horizontal, even-vertical, main-hori‐zontal, main-vertical, or tiled.
- `Space`       Arrange the current window in the next preset layout.
- `M-n`         Move to the next window with a bell or activity marker.
- `M-p`         Move to the previous window with a bell or activity marker.

## License

This project is free software and is available under the [Vim
License](https://github.com/vim/vim/blob/master/LICENSE).


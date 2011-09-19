## Setup

* https://github.com/carlhuda/janus (yehuda's sensible defaults)
* brew install ctags

## Help

* http://yehudakatz.com/2010/07/29/everyone-who-tried-to-convince-me-to-use-vim-was-wrong/
* http://fprintf.net/vimCheatSheet.html
* http://walking-without-crutches.heroku.com/
* https://github.com/carlhuda/janus (janus)
* https://github.com/tpope/vim-fugitive (git fugitive)
* vim golf
* <ESC> :help [term]

## Navigation
 
by character:

* use arrow keys, or h(left), j(down), k(up), l(right)

by word:

* forward to beginning of word (w)
* backwards to beginning of word (b)
* forward to end of word (e)
* forward 3 words (3w)

by line:

* beginning of line (0)
* end of line ($)
* next line: (j)
* previous line: (k)
* get line number: (ctrl-g)
* go to line: (23G)
* first line: (gg)
* last line: (G)

## Insert/Append/Replace mode

* insert chars at cursor: (i)
* append chars after cursor: (a)
* append chars to end of line: (A)
* replace typed chars: (R)
* replace one typed char: (r)

## Insert ("open")

* add text to line below cursor (o)
* add text to line above cursor (O)

## Copy ("yank")

* "yank"/copy text (y)
* copy this line (Y)

## Paste ("put")

* put previously copied text after the cursor (p)

## Change

(delete a word and enter insert mode)

* change a word to the end: (ce)
* change a line to the end: (C or c$)
* change contents inside quotes (ci")

## Delete

by character:

* delete a char (x)

by word:

* delete a word (dw) - to start of next word
* delete a word (de) - to end of current word
* delete two words (2dw)

by line:

* delete to end of line (d$)
* delete a line (dd)
* delete 3 lines (3dd)

by delimiter/block:

* delete everything inside parens (di right-parens)

## Undo/redo

* undo (u)
* redo (ctrl-r)

## Search

in current file

* search for a word (/) then your word
* find word again (n)
* find in opposite direction (N)
* ignore case (:set ic, :set noic)
* ignore case for one search (/something\c)
* highlight search results (:set hls, :set :nohls)
* incremental search, show partial matches (:set is)

by filename (Command-T plugin)

* find consults/index.html (cmd-t con/ind)

in project (Ack.vim plugin)

* find search terms in a subdir (cmd-shift-f "search terms" app/models)


## Select (visual mode)

* enter "visual"/select mode (v)
* select everything inside parens (vi right-parens)
* select all lines (ggVG)

## File navigation

* change directory (:cd ~/code/whatever)
* open nerdtree (\n)
* open directory (o)
* recursively open directory (O)
* recursively close directory (X)
* change tree root to selected dir (C)
* jump to current node's parent (p)

## File open/save

* close (:q)
* close, no save (:q!)
* close, save (:wq)
* save to new file (:w filename.txt)
* insert contents of file (:r filename.txt)

## Windows

* get help (:help ctrl-w)

split

* split window horizontally (ctrl-w s)
* split window vertically (ctrl-w v)
* split window horizontally and open new file (:sp file.txt)
* split window vertically and open new file (:vsp file.txt)

resize

* make window taller/shorter (ctrl-w + or -)
* equalize window sizes (ctrl-w =)
* maximize current window (ctrl-w _)
* zoom current window in/out (ctrl-w o)

navigate

* cycle through open windows (ctrl-w w)
* go to window on left/down/up/right (ctrl-w hjkl)
* close everything but current window (:only)

move

* move current window to a new tab (ctrl-w T)
* move current window left/down/up/right (ctrl-w HJKL)

## Tabs



## Tags/ctags

* get help (:help ctags)
* update tags (\rt)
* jump to a tag (:tag some_method)
* jump to source of a selected method/class/etc (ctrl-])
* jump back to previous location (ctrl-t)

## Git

* git status (:Gstatus)
* show diff for current file (:Gdiff)


## Formatting

* align on commas, etc ()

## Indentation

auto-indent selection

* 1. select lines using visual mode (v, j)
* 2. indent selection (=)

manually indent selection

* 1. select lines using visual mode (v, j)
* 2. to indent once (>)
* 3a. to indent again, repeat last command (.)
* 3b. to outdent, undo last command (u)

indent entire file

* 1. go to top of file (gg)
* 2. indent to end of file using motion "G" (=G)

## VIM command line

* show all commands that start with a char (ctrl-d)
* command completion (tab)

## External commands

* run a shell command (:!)
* insert results of a command (:r !ls)


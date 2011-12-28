## Setup

* https://github.com/carlhuda/janus (yehuda's sensible defaults)
* brew install ctags

## Help

* http://hea-www.harvard.edu/~fine/Tech/vi.html
* http://www.brezeale.com/technical_notes/vim_notes.shtml
* http://yehudakatz.com/2010/07/29/everyone-who-tried-to-convince-me-to-use-vim-was-wrong/
* http://fprintf.net/vimCheatSheet.html
* http://walking-without-crutches.heroku.com/
* http://www.derekwyatt.org/vim/vim-tutorial-videos/
* https://github.com/carlhuda/janus (janus)
* https://github.com/tpope/vim-fugitive (git fugitive)
* vim golf
* <ESC> :help [term]

## Navigation
 
by character:

* use arrow keys, or h(left), j(down), k(up), l(right)
* forward to next "s": (fs)
* repeat last [fFtT] command: (;)
* backwards to previous "s": (Fs)

by word:

* forward to beginning of word (w), ignoring punc (W)
* backwards to beginning of word (b), ignoring punc (B)
* forward to end of word (e), ignoring punc (E)
* forward 3 words (3w)

by line:

* beginning of line (0)
* end of line ($)
* next line: (j)
* next line, ignore whitespace: ()
* previous line: (k)
* get line number: (ctrl-g)
* go to line: (23G)
* first line: (gg)
* last line: (G)

by sentence/paragraph:

* next/previous sentence ()
* next/previous paragraph {}

matching parens:

* find matching parens (%)

bookmarks:

* mark this as bookmark a (ma)
* go to bookmark a ('a)



## Insert/Append/Replace mode

* insert chars at cursor: (i)
* append chars after cursor: (a)
* append chars to end of line: (A)
* append chars to line below cursor (o)
* append chars to line above cursor (O)
* replace typed chars: (R)
* replace one typed char: (r)

## Cut

* cut a line into register a ("add)
* paste register a into the next line ("ap)


## Copy ("yank")

* "yank"/copy text (y)
* copy this line (Y)


## Paste ("put")

* put previously copied text after the cursor (p)


## Delete

by character:

* delete a char at cursor (x)
* delete a char before cursor (X)

by word:

* delete a word (dw) - from cursor to start of next word
* delete a word (de) - from cursor to end of current word
* delete a word surrounding cursor (daw) - "a word"
* delete a word surrounding cursor, not including whitespace (diw) = "inner word"
* delete two words (2dw)

by line:

* delete to end of line (d$) or (D)
* delete a line and newline (dd)
* delete 3 lines (3dd)
* delete from line 50 to 57 (:50,57d)
* delete from here to line 57 (:,57d)

by delimiter/block:

* delete everything inside parens (di right-parens)
* delete whole block/sentence, including whitespace (das)
* delete whole block/sentence, not including whitespace (dis)


## Change (delete and enter insert mode)

* change a word to the end: (ce)
* change a line to the end: (C or c$)
* change current line at same indent: (cc)
* change contents inside quotes (ci")


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


## Substitute (replace)

* substitute all matches on this line, no confirm (:s/old/new/g)
* substitute all matches on all lines, confirm each (:%s/old/new/gc)


## Select (visual mode)

* enter "visual"/select mode (v)
* select everything inside parens (vi right-parens)
* select all lines (ggVG)


## File navigation

* change directory (:cd ~/code/whatever)
* close (:q)
* close, no save (:q!)
* close, save (:wq)
* save to new file (:w filename.txt)
* insert contents of file (:r filename.txt)


## File navigation (nerdtree)

* open nerdtree (\n)
* open directory (o)
* recursively open directory (O)
* recursively close directory (X)
* change tree root to selected dir (C)
* jump to current node's parent (p)


## Windows

* get help (:help ctrl-w)

split

* split window horizontally (ctrl-w s)
* split window vertically (ctrl-w v)
* split window horizontally and open new file (:sp file.txt)
* split window vertically and open new file (:vs file.txt)

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

## Sessions

* save current session (:mksession yoursession.vim)
* open a session (:so yoursession.vim)

## Buffers

* list all buffers (:buffers or :ls)
* switch to an open buffer by name (:b somefile.txt)
* switch to an open buffer by autocomplete name (\tb somefile)
* switch to last edited buffer (:b# or ctrl-6)
* delete (close) a buffer (:bdelete somefile.txt or :bd)


## Tags/ctags

* open a tag pane (:Tlist)
* update tags (\rt)
* jump to a tag (:tag some_method)
* jump to source of a selected method/class/etc (ctrl-])
* jump back to previous location (ctrl-t)
* get help (:help ctags)


## Git

* git status (:Gstatus)
* show diff for current file (:Gdiff)


## Formatting

* align on colons from here to line 18 (:,18 :Align :)


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

select current indent level

* select inner indent level (vi i)
* indent current indent level (vi i>)


## VIM command line

* show all commands that start with a char (ctrl-d)
* command completion (tab)


## External commands

* run a shell command (:!)
* insert results of a command (:r !ls)


## Color Themes

* download a theme, such as blackboard.vim
* Put it into ~/.vim/colors, then :color blackboard

# NeoVim-Config

## Setting up
Install Plug, then run :PlugInstall and you are ready for editing.

## Cheat Sheet

Cheat sheet with the commands I'm acquainted with. The packages I have on my *init.vim* have gazillions of options but I try to learn them slowly so here are the ones I use noww.

### FZF
- :Buffers has been mapped to `;`. It will list all your open buffers and enable fuzzy searching.
- :Files has been mapped to `,t`. Fuzzy seaching of the files on a folder which by default is you pwd.
- To quit fzf: `<control>-c`

### Nerd Commenter
- Toogle comments with: `,c<space>`. Also works in visual mode and accepts a count argument in front.
- Yank a line and then comment: `,cy`

### Splitting windows
- Vertical Split with `:vs`
- Horizontal Split with `:split`

### EasyMotion and moving around
- Jump to line below: `,j`
- Jump to line above: `,k`
- Jump to word starting with 2 characters: `s<char1><char2>`
- Jump to word on line: `,w`

### Searching for text
- `/` to search
- Hit enter in Normal mode to clear search.
- `*` search forward for word you have the cursor on.
- `#` idem but backwards.
- `n` and `N` to jump to next forwards/backwards.

### Cut/Copy/Paste
Use the named registers to avoid your cut text from being overriden by a rando delete. Register "0 always holds your last yanked text and "+ is the system clipboard register.

### Undo/Redo
- `u` and `<control>-R`

### Vim-Surround
- Surround text in visual mode by selecting a block and then `S)`
- Surround whole line: `yss)`
- Surround until end of line: `ys$)`
- In general type of action, s, motion and delimiter

### Indent Code
In visual mode select code then `<` or `>`. You can repeat with `.`

### Other
- Open a terminal with: `:terminal`
- Insert in block mode: C-v to take you to block v-mode. Select the first column, shift-I to go to insert mode. Add space then ESC


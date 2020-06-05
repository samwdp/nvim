# Nvim

This is my personal config for NVIM. You will find 2 init files.
Re-name the file that correspods to your OS to **init.vim**

This will ensure that you have the correct source locaitons for each
OS. For installation instructions please follow the one for your OS.

## Linux/OSX

Clone this repo to your .config directory.

```bash
git clone https://github.com/samwdp/nvim.git ~/.config
```

## Windows

Clone this reop to your user settings Local folder

```bash
git clone https://github.com/samwdp/nvim.git ~\AppData\Local
```

All apsects of the config have been broken into separate places

```bash
general
|-> functions.vim         # Any User created funcitons
|-> keybinds.vim          # Any global keybids or re-maps
|-> settings.vim          # Any global settings
plugin
   |-> settings           # Plugin related settings
      |-> coc.vim
      |-> fugitive.vim
      |-> fzf.vim
      |-> polyglot.vim
      |-> quickscope.vim
      |-> rainbow.vim
      |-> tabline.vim
      |-> undotree.vim
      |-> vimagit.vim
   |-> plugin.vim         # Where all the plugins get put
coc-settings.json
init.vim.linux
init.vim.windows
```

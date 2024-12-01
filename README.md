# Vim

This repository contains my personal Vim configuration files. Feel free to fork, clone, or use any part of it for your own setup.

## Vim Plugged

To install the plugins, run the following commands in Vim:

```vim
:source %
:PlugInstall
```

## Config

### Plugins

- **'scrooloose/nerdtree'**: A file system explorer that allows you to browse your filesystem and open files.
- **'majutsushi/tagbar'**: A plugin that displays tags of the current file in a sidebar, making it easier to navigate code.
- **'vim-airline/vim-airline'**: A status line plugin that provides a sleek and customizable status line.
- **'vim-airline/vim-airline-themes'**: A collection of themes for vim-airline.
- **'scrooloose/nerdcommenter'**: A plugin that allows you to easily comment and uncomment code.
- **'rrethy/vim-illuminate'**: A plugin that highlights other uses of the word under the cursor.
- **'Yggdroot/indentLine'**: A plugin that displays indentation levels with thin vertical lines.
- **'schmich/vim-guifont'**: A plugin that allows you to change the GUI font size in Vim.
- **'Valloric/YouCompleteMe'**: A fast, as-you-type, semantic-based code completion engine.
- **'plasticboy/vim-markdown'**: A plugin that provides syntax highlighting and other features for Markdown files.
- **'octol/vim-cpp-enhanced-highlight'**: A plugin that enhances syntax highlighting for C++ code.
- **'scrooloose/syntastic'**: A syntax checking plugin that integrates with many linters.
- **'907th/vim-auto-save'**: A plugin that automatically saves your files at regular intervals.

## Usage

### Basic Commands

- Open Vim:

    ```sh
    vim
    ```

- Edit a file:

    ```sh
    vim filename
    ```

- Install a new plugin (using Vim-Plug):

    ```sh
    vim +PlugInstall +qall
    ```

### Custom Key Mappings

- `<leader>e`: Open file explorer.
- `<leader>f`: Find files.
- `<leader>g`: Find text in files.

---

Happy coding with Vim!

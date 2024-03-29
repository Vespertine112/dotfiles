# dotfiles/nvim

<a href="https://dotfyle.com/Vespertine112/dotfiles-nvim"><img src="https://dotfyle.com/Vespertine112/dotfiles-nvim/badges/plugins?style=flat" /></a>
<a href="https://dotfyle.com/Vespertine112/dotfiles-nvim"><img src="https://dotfyle.com/Vespertine112/dotfiles-nvim/badges/leaderkey?style=flat" /></a>
<a href="https://dotfyle.com/Vespertine112/dotfiles-nvim"><img src="https://dotfyle.com/Vespertine112/dotfiles-nvim/badges/plugin-manager?style=flat" /></a>

## Install Instructions

> Install requires Neovim 0.9+, and Ripgrep. Always review the code before installing a configuration.

Clone the repository and install the plugins:

```sh
git clone git@github.com:Vespertine112/dotfiles ~/.config/Vespertine112/dotfiles
```

Open Neovim with this config:

```sh
NVIM_APPNAME=Vespertine112/dotfiles/nvim nvim
```

## Plugins

### bars-and-lines

-   [SmiteshP/nvim-navic](https://dotfyle.com/plugins/SmiteshP/nvim-navic)
-   [utilyre/barbecue.nvim](https://dotfyle.com/plugins/utilyre/barbecue.nvim)

### colorscheme

-   [catppuccin/nvim](https://dotfyle.com/plugins/catppuccin/nvim)

### completion

-   [hrsh7th/nvim-cmp](https://dotfyle.com/plugins/hrsh7th/nvim-cmp)

### cursorline

-   [RRethy/vim-illuminate](https://dotfyle.com/plugins/RRethy/vim-illuminate)

### editing-support

-   [echasnovski/mini.pairs](https://dotfyle.com/plugins/echasnovski/mini.pairs)

### file-explorer

-   [stevearc/oil.nvim](https://dotfyle.com/plugins/stevearc/oil.nvim)

### formatting

-   [mhartington/formatter.nvim](https://dotfyle.com/plugins/mhartington/formatter.nvim)

### fuzzy-finder

-   [nvim-telescope/telescope.nvim](https://dotfyle.com/plugins/nvim-telescope/telescope.nvim)

### git

-   [lewis6991/gitsigns.nvim](https://dotfyle.com/plugins/lewis6991/gitsigns.nvim)

### indent

-   [echasnovski/mini.indentscope](https://dotfyle.com/plugins/echasnovski/mini.indentscope)
-   [lukas-reineke/indent-blankline.nvim](https://dotfyle.com/plugins/lukas-reineke/indent-blankline.nvim)

### keybinding

-   [folke/which-key.nvim](https://dotfyle.com/plugins/folke/which-key.nvim)

### lsp

-   [onsails/lspkind.nvim](https://dotfyle.com/plugins/onsails/lspkind.nvim)
-   [smjonas/inc-rename.nvim](https://dotfyle.com/plugins/smjonas/inc-rename.nvim)
-   [neovim/nvim-lspconfig](https://dotfyle.com/plugins/neovim/nvim-lspconfig)
-   [VonHeikemen/lsp-zero.nvim](https://dotfyle.com/plugins/VonHeikemen/lsp-zero.nvim)

### lsp-installer

-   [williamboman/mason.nvim](https://dotfyle.com/plugins/williamboman/mason.nvim)

### marks

-   [ThePrimeagen/harpoon](https://dotfyle.com/plugins/ThePrimeagen/harpoon)

### media

-   [edluffy/hologram.nvim](https://dotfyle.com/plugins/edluffy/hologram.nvim)

### motion

-   [folke/flash.nvim](https://dotfyle.com/plugins/folke/flash.nvim)

### nvim-dev

-   [nvim-lua/plenary.nvim](https://dotfyle.com/plugins/nvim-lua/plenary.nvim)
-   [MunifTanjim/nui.nvim](https://dotfyle.com/plugins/MunifTanjim/nui.nvim)
-   [folke/neodev.nvim](https://dotfyle.com/plugins/folke/neodev.nvim)

### plugin-manager

-   [folke/lazy.nvim](https://dotfyle.com/plugins/folke/lazy.nvim)

### scrollbar

-   [gorbit99/codewindow.nvim](https://dotfyle.com/plugins/gorbit99/codewindow.nvim)

### scrolling

-   [declancm/cinnamon.nvim](https://dotfyle.com/plugins/declancm/cinnamon.nvim)

### snippet

-   [rafamadriz/friendly-snippets](https://dotfyle.com/plugins/rafamadriz/friendly-snippets)
-   [L3MON4D3/LuaSnip](https://dotfyle.com/plugins/L3MON4D3/LuaSnip)

### statusline

-   [nvim-lualine/lualine.nvim](https://dotfyle.com/plugins/nvim-lualine/lualine.nvim)

### syntax

-   [nvim-treesitter/nvim-treesitter](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter)
-   [echasnovski/mini.surround](https://dotfyle.com/plugins/echasnovski/mini.surround)

### tabline

-   [akinsho/bufferline.nvim](https://dotfyle.com/plugins/akinsho/bufferline.nvim)

### utility

-   [rcarriga/nvim-notify](https://dotfyle.com/plugins/rcarriga/nvim-notify)
-   [folke/noice.nvim](https://dotfyle.com/plugins/folke/noice.nvim)

## Language Servers

-   html
-   svelte

This readme was generated by [Dotfyle](https://dotfyle.com)

# Useful Command Chains

-   "S" fires flash, select the correct letter block, then "gsa" or some other
    mini.surround, to change the blocking
-   [normal] "K" lsp hover (shows declaration)
-   [normal] "gi" lsp implementation
-   [normal] "gd" lsp definition
-   [normal] "gD" lsp declaration
-   [normal] "gr" lsp list references
-   [normal] pre+"<C-j>" opens that terminal
-   [normal] "[t" next todo
-   [normal] "]t" prev todo
-   [normal] "f{char}" standard motion, but repeated 'f' is next char. "F" goes to previous
-   [normal] <C-/> - Toggles the current line using linewise comment
-   [normal] gbc - Toggles the current line using blockwise comment
-   [normal] [count]<C-/> - Toggles the number of lines given as a prefix-count using linewise
-   [normal] [count]gbc - Toggles the number of lines given as a prefix-count using blockwise
-   [normal] gc[count]{motion} - (Op-pending) Toggles the region using linewise comment
-   [normal] gb[count]{motion} - (Op-pending) Toggles the region using blockwise comment
-   [visual] gc - Toggles the region using linewise comment
-   [visual] gb - Toggles the region using blockwise comment
-   [visual] S + <leader>S - Opens a flash menu which allows massive block
    selection by type searching

-- `:TodoQuickFix`
-- `:TodoLocList`
-- `:TodoTelescope`

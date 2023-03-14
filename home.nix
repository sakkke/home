{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "sakkke";
  home.homeDirectory = "/home/sakkke";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.sessionVariables = {
    NIX_PATH = "nixpkgs=/home/sakkke/.nix-defexpr/channels/nixpkgs:home-manager=/home/sakkke/.nix-defexpr/channels/home-manager";
  };

  home.packages = [
    pkgs.tmux
    pkgs.ungoogled-chromium
  ];

  programs.bash = {
    enable = true;
    bashrcExtra = ''
      # Disable $SSH_ASKPASS
      unset SSH_ASKPASS

      eval "$(starship init bash)"
    '';
  };

  programs.exa = {
    enable = true;
  };

  programs.fzf = {
    enable = true;
  };

  programs.git = {
    enable = true;
    userEmail = "w32w64@gmail.com";
    userName = "sakkke";
    extraConfig = {
      credential = {
        helper = "store";
      };
      init = {
        defaultBranch = "main";
      };
    };
  };

  programs.gitui = {
    enable = true;
    theme = ''
      (
        selected_tab: Reset,
        command_fg: Rgb(202, 211, 245),
        selection_bg: Rgb(91, 96, 120),
        selection_fg: Rgb(202, 211, 245),
        cmdbar_bg: Rgb(30, 32, 48),
        cmdbar_extra_lines_bg: Rgb(30, 32, 48),
        disabled_fg: Rgb(128, 135, 162),
        diff_line_add: Rgb(166, 218, 149),
        diff_line_delete: Rgb(237, 135, 150),
        diff_file_added: Rgb(238, 212, 159),
        diff_file_removed: Rgb(238, 153, 160),
        diff_file_moved: Rgb(198, 160, 246),
        diff_file_modified: Rgb(245, 169, 127),
        commit_hash: Rgb(183, 189, 248),
        commit_time: Rgb(184, 192, 224),
        commit_author: Rgb(125, 196, 228),
        danger_fg: Rgb(237, 135, 150),
        push_gauge_bg: Rgb(138, 173, 244),
        push_gauge_fg: Rgb(36, 39, 58),
        tag_fg: Rgb(244, 219, 214),
        branch_fg: Rgb(139, 213, 202)
      )
    '';
  };

  programs.lazygit = {
    enable = true;
  };

  programs.neovim = {
    enable = true;
    extraConfig = ''
      set list
      set number
      set relativenumber
      set shell=zsh
      set termguicolors
      set timeoutlen=500

      call plug#begin()

      Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }
        Plug 'kyazdani42/nvim-web-devicons'
      Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
      Plug 'editorconfig/editorconfig-vim'
      Plug 'lewis6991/gitsigns.nvim'
      Plug 'liuchengxu/vim-better-default'
      Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
      Plug 'lukas-reineke/indent-blankline.nvim'
      Plug 'nvim-lualine/lualine.nvim'
        Plug 'kyazdani42/nvim-web-devicons'
      Plug 'nvim-tree/nvim-tree.lua'
      Plug 'sheerun/vim-polyglot'
      Plug 'voldikss/vim-floaterm'
      Plug 'windwp/nvim-autopairs'

      call plug#end()

      let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
      if empty(glob(data_dir . '/autoload/plug.vim'))
        silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
      endif

      lua << /lua
      require('bufferline').setup()
      require('catppuccin').setup({
        flavour = 'macchiato',
        transparent_background = true,
      })
      require('gitsigns').setup()
      require('indent_blankline').setup({})
      require('lualine').setup()
      require('nvim-autopairs').setup({})
      require('nvim-tree').setup({})
      /lua

      colorscheme catppuccin

      let g:mapleader = "\<Space>"
      let g:maplocalleader = ','

      let g:floaterm_height = 0.9
      let g:floaterm_width = 0.9

      let g:floaterm_keymap_new = '<F8>'
      let g:floaterm_keymap_prev = '<F9>'
      let g:floaterm_keymap_next = '<F10>'
      let g:floaterm_keymap_toggle = '<F12>'

      nnoremap <silent> <Leader> :<C-u>WhichKey '<Space>'<CR>
      nnoremap <silent> <LocalLeader> :<C-u>WhichKey ','<CR>

      nnoremap <silent> <Leader><Space> :w<CR>
      nnoremap <silent> <Leader>e <Cmd>NvimTreeToggle<CR>
      nnoremap <silent> <Leader>gg <Cmd>FloatermNew gitui<CR>
      nnoremap <silent> <Leader>pi <Cmd>PlugInstall<CR>
    '';
  };

  programs.starship = {
    enable = true;
    settings = {};
  };

  programs.wezterm = {
    enable = true;
    extraConfig = ''
      return {
        color_scheme = 'Catppuccin Macchiato',
        default_prog = {'zsh', '-l'},
        enable_tab_bar = false,
        keys = {
          {
            key = 'F11',
            action = wezterm.action.ToggleFullScreen,
          },
        },
        window_background_image = '/home/sakkke/home/waves_right_colored.png',
        window_background_image_hsb = {
          brightness = 0.3,
        },
        window_padding = {
          left = 0,
          right = 0,
          top = 0,
          bottom = 0,
        },
      }
    '';
  };

  programs.zsh = {
    enable = true;
    zplug = {
      enable = true;
      plugins = [
        { name = "hlissner/zsh-autopair"; }
        { name = "marlonrichert/zsh-autocomplete"; }
        { name = "zsh-users/zsh-autosuggestions"; }

        # Lazy loading
        { name = "zsh-users/zsh-syntax-highlighting"; }
      ];
    };
    initExtra = ''
      fzf-z() {
        temp="$(mktemp --suffix=fzf-z)"
        jobs -l > "$temp"
        list="$(< "$temp")"
        rm "$temp"
        pid="$(printf %s "$list" \
          | fzf -0 -1 \
          | tr -d '[]')"

        if [ -z "$pid" ]; then
          return
        fi

        %"$pid"
      }

      nvim-sh() {
        while :; do
          printf 'Press press enter to launch Neovim. Or press C-c to exit.'
          read
          nvim "$@"
        done
      }

      zle -N fzf-z

      bindkey '^Z' fzf-z
    '';
    shellAliases = {
      hs = "home-manager switch";
    };
  };
}

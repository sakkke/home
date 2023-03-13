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

  programs.neovim = {
    enable = true;
    extraConfig = ''
      set number
      set relativenumber
      set termguicolors

      call plug#begin()

      Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }
        Plug 'kyazdani42/nvim-web-devicons'
      Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
      Plug 'editorconfig/editorconfig-vim'
      Plug 'nvim-lualine/lualine.nvim'
        Plug 'kyazdani42/nvim-web-devicons'
      Plug 'sheerun/vim-polyglot'

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
      })
      require('lualine').setup()
      /lua

      colorscheme catppuccin
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
        window_padding = {
          left = 0,
          right = 0,
          top = 0,
          bottom = 0,
        },
      }
    '';
  };
}

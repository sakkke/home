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
      }
    '';
  };
}

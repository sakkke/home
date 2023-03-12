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

  home.packages = [
    pkgs.git
    pkgs.neovim
    pkgs.ungoogled-chromium
  ];

  programs.bash = {
    enable = true;
    bashrcExtra = ''
      eval "$(starship init bash)"
    '';
  };

  programs.git = {
    enable = true;
    userEmail = "w32w64@gmail.com";
    userName = "sakkke";
  };

  programs.starship = {
    enable = true;
    settings = {};
  };
}

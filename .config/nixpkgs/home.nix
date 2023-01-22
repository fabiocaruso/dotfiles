{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "fabio";
  home.homeDirectory = "/home/fabio";
  fonts.fontconfig.enable = true;
  home.sessionVariables = {
    EDITOR = "nvim";
  };
  xsession.enable = true;

  nixpkgs.config.allowUnfree = true;
  #services.gnome-keyring.enable = true;
  home.packages = with pkgs; [
    gcc
    rsync
    neovim
    fzf
    silver-searcher
    ripgrep
    bat
    figlet
    translate-shell
    tmux
    xclip
    unzip
    delta
    python39Full
    python39Packages.pip
    python39Packages.pynvim
    nodejs-16_x
    nerdfonts
    steam
    gnome.gnome-keyring
    keeweb
    cider
    cargo
    rustc
    vlc
    rnix-lsp
    deadnix
    statix
    alejandra
    sumneko-lua-language-server
    stylua
    vulnix
    vscode-with-extensions
    vscode-extensions.matklad.rust-analyzer
    vscode-extensions.vadimcn.vscode-lldb
  ];

  programs.kitty = {
    enable = true;
    font = {
      name = "FiraCode Nerd Font";
      size = 15;
    };
  };

  programs.git = {
    enable = true;
    userName = "Fabio Caruso";
    userEmail = "fabio.caruso@hotmail.com";
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

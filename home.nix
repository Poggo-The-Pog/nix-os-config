#App config

{ config, pkgs, ... }: {

  home.username = "poggo";
  home.homeDirectory = "/home/poggo";
  home.stateVersion = "25.11";
  
  # Zsh
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history.size = 10000;
    history.path = "$HOME/.zsh_history";

    shellAliases = {
      upd = "cd /etc/nixos && nix flake update && sudo nixos-rebuild switch --flake .";
    };
  };

  home.packages = with pkgs; [
    #Games
    steam
    wineWowPackages.stable
    winetricks
    #Gnome extensions
    gnomeExtensions.hot-edge
    gnomeExtensions.appindicator
    gnomeExtensions.caffeine
    gnomeExtensions.user-themes

    # ts
    gnome-tweaks
  ];

home.sessionVariables.GTK_THEME = "gruvbox-gtk-theme-grey-standard+black";
  gtk = {
    enable = true;
    theme = {
      name = "gruvbox-gtk-theme-grey-standard+black";
      package = pkgs.gruvbox-gtk-theme;
    };

    iconTheme = {
      name = "gruvbox-plus-icons";
      package = pkgs.gruvbox-plus-icons;
    };

    cursorTheme = {
      name = "Posy-Cursors";
      package = pkgs.posy-cursors;
    };

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };

}

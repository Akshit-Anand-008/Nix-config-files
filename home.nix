{ config, pkgs, inputs, ... }:

{
  imports = [ inputs.noctalia.homeModules.default ];
  home.username = "akshit";
  home.homeDirectory = "/home/akshit";
  home.stateVersion =  "26.05";
  home.packages = with pkgs; [
    # Neovim
    neovim
    nil clang-tools lua-language-server
    tree-sitter

    # Shell
    alacritty foot
    zsh
    starship zsh-vi-mode

    # Desktop
    niri
    fuzzel
    brightnessctl playerctl libnotify
    wayland-utils wev wl-clipboard xwayland-satellite
    bibata-cursors

    # Development
    gcc gdb
    python3
    iverilog

    # CLI Utilities
    (nnn.override { withNerdIcons = true; })
    bc eza bat tealdeer
    fd fzf file ripgrep
    unzip zip
    gzip jq curl stow
    taskwarrior3 btop tmux
    cmake gnumake

    # Others
    (texliveBasic.withPackages (ps: with ps; [ latexmk ]))
    pdfarranger
    zathura
    kdePackages.okular
    mpv
  ];

  programs.noctalia-shell.enable = true;
}

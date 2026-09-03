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
    alacritty
    zsh
    zsh-vi-mode
    starship

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
    fd file ripgrep
    unzip zip gzip
    jq curl 
    cmake gnumake
    stow fzf tmux
    taskwarrior3 btop

    # Others
    thunderbird
    mpv
    (texliveBasic.withPackages (ps: with ps; [ latexmk ]))
    libreoffice pdfarranger
    zathura kdePackages.okular
  ];

  programs.noctalia-shell.enable = true;
}

{ config, pkgs, inputs, ... }:

{
  imports = [ inputs.noctalia.homeModules.default ];
  home.username = "akshit";
  home.homeDirectory = "/home/akshit";
  home.stateVersion =  "26.05";
  home.packages = with pkgs; [
    alacritty niri
    neovim tree-sitter
    lua-language-server clang-tools nil
    bat tealdeer eza
    thunderbird libreoffice
    pdftricks inkscape
    zsh zsh-vi-mode starship
    taskwarrior3 btop
    tmux stow fuzzel libnotify
    zathura mpv
    nodejs python3
    bc jq curl
    fzf fd ripgrep file
    gnumake cmake gcc gdb stdenv.cc
    gzip zip unzip
    xwayland-satellite wayland-utils wev wl-clipboard
    playerctl brightnessctl
    bibata-cursors
    (texliveBasic.withPackages (ps: with ps;[latexmk]))
    (nnn.override { withNerdIcons = true; })
    iverilog
  ];

  programs.noctalia-shell.enable = true;
}

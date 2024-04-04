starship init fish | source
eval (gdircolors -c ~/.config/zsh/dircolors.ansi-dark)

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

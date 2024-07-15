set PATH $PATH /opt/homebrew/bin

if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source
eval (gdircolors -c ~/.config/zsh/dircolors.ansi-dark)

# Created by `pipx` on 2024-05-22 20:23:23
set PATH $PATH /home/corey/.local/bin
set PATH $PATH /home/corey/.garden/bin
  
# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

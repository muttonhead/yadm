set PATH $PATH /opt/homebrew/bin

if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source
eval (gdircolors -c ~/.config/zsh/dircolors.ansi-dark)

# asdf
source /opt/homebrew/opt/asdf/libexec/asdf.fish
source ~/.asdf/plugins/golang/set-env.fish

# local
if test -d ~/.local/bin
  fish_add_path -a ~/.local/bin
end

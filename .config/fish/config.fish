set PATH $PATH /opt/homebrew/bin

if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source
eval (gdircolors -c ~/.config/zsh/dircolors.ansi-dark)

# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims

# asdf
# source /opt/homebrew/opt/asdf/libexec/asdf.fish
source ~/.asdf/plugins/golang/set-env.fish

# local
if test -d ~/.local/bin
  fish_add_path -a ~/.local/bin
end

# zoxide
zoxide init fish | source

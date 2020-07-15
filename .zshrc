export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH

export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then 
  . $HOME/.nix-profile/etc/profile.d/nix.sh; 
fi # added by Nix installer


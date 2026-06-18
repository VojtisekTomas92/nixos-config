ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"


zinit load nix-community/nix-zsh-completions
zinit load zsh-users/zsh-autosuggestions
zinit load zsh-users/zsh-syntax-highlighting
zinit load MichaelAquilina/zsh-you-should-use
zinit load fdellwing/zsh-bat
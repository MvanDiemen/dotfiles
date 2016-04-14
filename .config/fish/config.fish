# Path to Oh My Fish install.
set -gx OMF_PATH "/Users/michael/.local/share/omf"

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG "/Users/michael/.config/omf"

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

source /usr/local/share/chruby/chruby.fish
source /usr/local/share/chruby/auto.fish
source $HOME/.config/fish/private.fish

source config.1457688028.fish

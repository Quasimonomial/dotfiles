#-----------------------------------------------------------------------------#
# General                                                                     #
#-----------------------------------------------------------------------------#

# Decrease the Delay, this program is still pretty finicky
defaults write com.mediaatelier.CheatSheet delay 0.5

# Rebuild some compliled ZSH stuff for the zsh - based completion scripts
rm -f ~/.zcompdump; compinit

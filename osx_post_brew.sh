#-----------------------------------------------------------------------------#
# General                                                                     #
#-----------------------------------------------------------------------------#


# Services
brew services start mongodb-community
brew services start postgresql

# Decrease the Delay, this program is still pretty finicky
defaults write com.mediaatelier.CheatSheet delay 0.5

# Rebuild some compliled ZSH stuff for the zsh - based completion scripts
rm -f ~/.zcompdump; compinit

# Install plugins for iterm 2
brew install zsh-syntax-highlighting

# Install rvm
gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable
rvm pkg install openssl

# Install a dockerized version of zoom which is hopefully less terrible
# https://hub.docker.com/r/mdouchement/zoom-us
docker pull mdouchement/zoom-us:latest

#-----------------------------------------------------------------------------#
# Install App Store Apss                                                      #
#-----------------------------------------------------------------------------#

mas install 1091189122 # installs bear (note taking app)

#-----------------------------------------------------------------------------#
# Python                                                                      #
#-----------------------------------------------------------------------------#

# Add pyenv initializer to shell startup script.
echo -e '\nif command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi' >> ~/.bash_profile

echo -e '\nif command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi' >> ~/.zshrc

# Install poetry
# See https://blog.jayway.com/2019/12/28/pyenv-poetry-saviours-in-the-python-chaos/
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python
export PATH="$HOME/.poetry/bin:$PATH"
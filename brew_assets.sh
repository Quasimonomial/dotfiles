# Command Line Tools
brew install \
  bower \
  git \
  gource \
  gpg2 \
  heroku/brew/heroku \
  node \
  nvm \
  pyenv \
  sqlite \
  tree \
  yarn \
  youtube-dl \
  zlib

# My Personal Apps
brew cask install \
  activitywatch \
  alfred \
  android-file-transfer \
  android-messages \
  appcleaner \
  anki \
  atom \
  caprine \
  cheatsheet \
  chromium \
  discord \
  docker \
  dropbox \
  evernote \
  firefox \
  flux \
  gpodder \
  google-chrome \
  homebrew/cask-drivers/logitech-options \
  karabiner-elements \
  keka \
  licecap \
  obs \
  postgres \
  psequel \
  rectangle \
  scrivener \
  skim \
  skype \
  slack \
  sloth \
  spectacle \
  spotify \
  spotify-now-playing \
  steam \
  suspicious-package \
  teamviewer \
  telegram \
  transmission \
  whatsapp \
  valentina-studio \
  visual-studio-code \
  vlc \
  zoomus

# quicklook packages
brew cask install \
  qlcolorcode \
  qlstephen \
  qlmarkdown \
  quicklook-json \
  qlprettypatch \
  quicklook-csv

# Terminal
brew cask install \
  iterm2 \
  zsh

# You need this font for iterm2 setup step
brew tap homebrew/cask-fonts && brew cask install font-source-code-pro

# Completion packages
brew install \
  bash-completion \
  bundler-completion \
  django-completion \
  docker-completion \
  docker-compose-completion \
  gem-completion \
  pip-completion \
  rails-completion \
  ruby-completion \
  yarn-completion \
  zsh-autosuggestions \
  zsh-completion \

# Config
brew services start postgresql
 
# Install Mongodb
tap mongodb/brew
brew install mongodb-community
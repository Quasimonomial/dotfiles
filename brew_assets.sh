# From my previous install
brew install \
  git \
  heroku/brew/heroku \
  node \
  nvm \
  sqlite \
  yarn \
  youtube-dl

# quicklook packages
brew cask install \
  qlcolorcode \
  qlstephen \
  qlmarkdown \
  quicklook-json \
  qlprettypatch \
  quicklook-csv \

# install other guide apps
brew cask install \
  alfred \
  android-file-transfer \
  appcleaner \
  cheatsheet \
  docker \
  dropbox \
  google-chrome \
  flux \
  rectangle \
  suspicious-package \
  transmission \
  valentina-studio \
  vlc

# My Personal Apps
brew cask install \
  activitywatch \
  android-messages \
  anki \
  atom \
  chromium \
  deluge \
  discord \
  evernote \
  firefox \
  homebrew/cask-drivers/logitech-options \
  karabiner-elements \
  keka \
  licecap \
  obs \
  postgres \
  psequel \
  scrivener \
  skype \
  slack \
  sloth \
  spectacle \
  spotify \
  spotify-now-playing \
  steam \
  teamviewer \
  telegram \
  whatsapp \
  visual-studio-code \
  zoom

# Terminal
brew cask install \
  iterm2 \
  zsh

# Command Line Tools
brew install \
  bash-completion \
  gource \
  tree

# You need this font for iterm2 setup step
brew tap homebrew/cask-fonts && brew cask install font-source-code-pro

# Config
brew services start postgresql

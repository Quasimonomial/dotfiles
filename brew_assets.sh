# Command Line Tools
brew install \
  bash-completion \
  git \
  gource \
  heroku/brew/heroku \
  node \
  nvm \
  sqlite \
  tree \
  yarn \
  youtube-dl

# My Personal Apps
brew cask install \
  activitywatch \
  alfred \
  android-file-transfer \
  android-messages \
  appcleaner \
  anki \
  atom \
  cheatsheet \
  chromium \
  discord \
  docker \
  dropbox \
  evernote \
  firefox \
  flux \
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
  zoom

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

# Config
brew services start postgresql

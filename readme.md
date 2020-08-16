## Quasi's Mac Osx Setup

### Instructions

1. Update the operating system
  * `sudo softwareupdate --install --all --restart`
2. Install the xcode tools
  * `xcode-select —install`
3. Set osx preferences
  * `sh .osx.sh`
4. Set up Brew and install packages
  * `sh brew_setup.sh` -> This installs brew and sets up the path properly
  * You will need a new terminal session for brew to work
  * Then run `sh brew_assets.sh` --> this installs all of my preferred programs
5. Install these separately, as they do not have brew installs
  * [bear](https://bear.app/)
6. Set up Mouse and Keyboard with Logitech Options and Karabiner
7. Set up iterm2
  * use `iterm_quasi.json` and import the profile and set it as default
  * additional color schemes [here](https://github.com/mbadolato/iTerm2-Color-Schemes)
  * run `curl -L https://iterm2.com/shell_integration/install_shell_integration.sh | bash` to enable [shell integration](https://www.iterm2.com/documentation-shell-integration.html)
  * run `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"` to install [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh)
    * this can be uninstalled with `uninstall_oh_my_zsh`
  * Faff about with your `ohmyzsh` settings for about an hour
8. Set up git
  * Set up SSH
  * run `cp ./.gitconfig ~/.gitconfig` for aliases and config
  * run `cp ./.gitignore ~/.gitignore` for ignoring various system files by default
9. Go through installed apps and configure them / log in / grant permissions / etc

Loosely Following [this](https://sourabhbajaj.com/mac-setup/) Guide


### Reference
Useful Dot File Links
* [Medium Article on Dotfiles for Osx](https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789/ )
* [pawelgrzybek's explanation of dotfiles and how to map settings to defaults key](https://pawelgrzybek.com/change-macos-user-preferences-via-command-line/ )
* [Mathias Byrens' setup, which most of this script is based off of](https://github.com/mathiasbynens/dotfiles/blob/main/.macos)
* [Wilson Mar's Dotfile's Index](https://wilsonmar.github.io/dotfiles/)
* [Man Page on `defaults`](https://ss64.com/osx/defaults.html)
* [Man Page on `systemsetup`](https://ss64.com/osx/systemsetup.html)

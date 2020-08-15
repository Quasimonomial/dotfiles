#!/usr/bin/env bash

# Based off of
# ~/.macos — https://mths.be/macos

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# Shown osx System Preferences                                                #
###############################################################################

#-----------------------------------------------------------------------------#
# General                                                                     #
#-----------------------------------------------------------------------------#

# Use Dark Style
defaults write "Apple Global Domain" AppleInterfaceStyle -string "Dark"

# Always show scrollbars
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
# Possible values: `WhenScrolling`, `Automatic` and `Always`

# Click in Scrollbar to
# 0 - Jump to the Next Page
# 1 - Jump to the Spot that is clicked
defaults write NSGlobalDomain AppleScrollerPagingBehavior 1

# Disables Handoff
# From https://superuser.com/questions/1420107/how-can-i-toggle-handoff-continuity-in-terminal-on-macos
sudo -u $(whoami) defaults write "$HOME/Library/Preferences/ByHost/com.apple.coreservices.useractivityd.plist" ActivityAdvertisingAllowed -bool no
sudo -u $(whoami) defaults write "$HOME/Library/Preferences/ByHost/com.apple.coreservices.useractivityd.plist" ActivityReceivingAllowed -bool no

#-----------------------------------------------------------------------------#
# Dock                                                                        #
#-----------------------------------------------------------------------------#

defaults write com.apple.dock orientation -string "left"
defaults write com.apple.dock tilesize -int 36

#-----------------------------------------------------------------------------#
# Spotlight                                                                   #
#-----------------------------------------------------------------------------#

defaults write com.apple.spotlight orderedItems -array \
	'{"enabled" = 1;"name" = "APPLICATIONS";}' \
	'{"enabled" = 1;"name" = "MENU_SPOTLIGHT_SUGGESTIONS";}' \
	'{"enabled" = 1;"name" = "MENU_CONVERSION";}' \
	'{"enabled" = 0;"name" = "MENU_EXPRESSION";}' \
	'{"enabled" = 0;"name" = "MENU_DEFINITION";}' \
	'{"enabled" = 1;"name" = "SYSTEM_PREFS";}' \
	'{"enabled" = 1;"name" = "DOCUMENTS";}' \
	'{"enabled" = 1;"name" = "DIRECTORIES";}' \
	'{"enabled" = 0;"name" = "PRESENTATIONS";}' \
	'{"enabled" = 0;"name" = "SPREADSHEETS";}' \
	'{"enabled" = 1;"name" = "PDF";}' \
	'{"enabled" = 0;"name" = "MESSAGES";}' \
	'{"enabled" = 0;"name" = "CONTACT";}' \
	'{"enabled" = 0;"name" = "EVENT_TODO";}' \
	'{"enabled" = 1;"name" = "IMAGES";}' \
	'{"enabled" = 0;"name" = "BOOKMARKS";}' \
	'{"enabled" = 0;"name" = "MUSIC";}' \
	'{"enabled" = 0;"name" = "MOVIES";}' \
	'{"enabled" = 0;"name" = "FONTS";}'
	'{"enabled" = 0;"name" = MENU_OTHER";}'

#-----------------------------------------------------------------------------#
# Language and Region                                                         #
#-----------------------------------------------------------------------------#

# Sets First Day of the Week to Sunday
defaults write "Apple Global Domain" AppleFirstWeekday '{gregorian = 1;}'

#-----------------------------------------------------------------------------#
# Trackpad                                                                    #
#-----------------------------------------------------------------------------#

# Disable “natural” (False Mac Heathen) scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Sets bottom left of the trackpad to be a left click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 1

# Turn off Smart Zoom
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadTwoFingerDoubleTapGesture -int 0

#-----------------------------------------------------------------------------#
# Mouse                                                                       #
#-----------------------------------------------------------------------------#

#-----------------------------------------------------------------------------#
# Energy Saver                                                                #
#-----------------------------------------------------------------------------#

sudo systemsetup -setsleep 10

#-----------------------------------------------------------------------------#
# Sharing                                                                     #
#-----------------------------------------------------------------------------#

# Set computer name (as done via System Preferences → Sharing)
sudo systemsetup -setcomputername "Aquarius Dreamscape"

#-----------------------------------------------------------------------------#
# Time Machine                                                                #
#-----------------------------------------------------------------------------#

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Disable local Time Machine backups
# This is updated from the command I found and may require additional privileges
hash tmutil &> /dev/null && sudo tmutil disable

###############################################################################
# Top Menu                                                                    #
###############################################################################

# Sets the desired top menu widgets
defaults write com.apple.systemuiserver menuExtras -array \
"/System/Library/CoreServices/Menu Extras/AirPort.menu" \
"/System/Library/CoreServices/Menu Extras/Battery.menu" \
"/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
"/System/Library/CoreServices/Menu Extras/Clock.menu" \
"/System/Library/CoreServices/Menu Extras/Displays.menu" \
"/System/Library/CoreServices/Menu Extras/Volume.menu"

# Show the battery percent
defaults write com.apple.menuextra.battery ShowPercent YES




###############################################################################
# Misc Settings                                                               #
###############################################################################

# Adds a Quit command to the finder menu
defaults write com.apple.finder QuitMenuItem -bool TRUE && killall Finder

# Adds a save as button to everything
defaults write -g NSUserKeyEquivalents -dict-add 'Save As...' '@$S'

###############################################################################
# Mathias Bynens' Settings                                                    #
# https://github.com/mathiasbynens/dotfiles                                   #
###############################################################################

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Reveal IP address, hostname, OS version, etc. when clicking the clock
# in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Increase sound quality for Bluetooth headphones/headsets
# I really have no idea what this one means
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# Stop iTunes from responding to the keyboard media keys
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null


#-----------------------------------------------------------------------------#
# Safari                                                                      #
#-----------------------------------------------------------------------------#

# Privacy: don’t send search queries to Apple
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# Enable “Do Not Track”
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

#-----------------------------------------------------------------------------#
# Finder                                                                      #
#-----------------------------------------------------------------------------#

# Set Desktop as the default location for new Finder windows
# For other paths, use `PfLo` and `file:///full/path/here/`
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/"

# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Show the ~/Library folder
chflags nohidden ~/Library && xattr -d com.apple.FinderInfo ~/Library

#-----------------------------------------------------------------------------#
# Screenshots                                                                 #
#-----------------------------------------------------------------------------#

# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true



# Wipe all (default) app icons from the Dock
# This is only really useful when setting up a new Mac, or if you don’t use
# the Dock to launch apps.
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#defaults write com.apple.dock persistent-apps -array


###############################################################################
# Kill affected applications                                                  #
###############################################################################

for app in "Activity Monitor" \
	"cfprefsd" \
	"Contacts" \
	"Dock" \
	"Finder" \
	"Safari" \
	"SizeUp" \
	"SystemUIServer" \
	"Terminal"; do
	killall "${app}" &> /dev/null
done
echo "Done. Note that some of these changes require a logout/restart to take effect."

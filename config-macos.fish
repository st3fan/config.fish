# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/

if status is-interactive
  alias macos-desktop-hide "defaults write com.apple.finder CreateDesktop -bool false and killall Finder"
  alias macos-desktop-show "defaults write com.apple.finder CreateDesktop -bool true and killall Finder"

  # Really not sure if I like this prompt
  #if type -q starship
  #  export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
  #  starship init fish | source
  #end
  
  if test -d /opt/homebrew/bin
    set -gx PATH /opt/homebrew/bin $PATH
  end

  # Because Homebrew defaults to Python 3.9?
  if test -d /opt/homebrew/opt/python@3.11/libexec/bin
    set -gx PATH /opt/homebrew/opt/python@3.11/libexec/bin $PATH
  end

  if test -d /opt/homebrew/opt/openjdk@17/bin
    set -gx PATH /opt/homebrew/opt/openjdk@17/bin $PATH
  end

  if test -d /opt/homebrew/opt/ruby/bin
    set -gx PATH /opt/homebrew/opt/ruby/bin $PATH
  end

  if test -d /opt/homebrew/lib/ruby/gems/3.1.0/bin
    set -gx PATH /opt/homebrew/lib/ruby/gems/3.1.0/bin $PATH
  end

  # No automatic clean up after install
  export HOMEBREW_NO_INSTALL_CLEANUP=1

  # Do not automatically upgrade anything
  export HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=1

  if command -sq /Applications/Tailscale.app/Contents/MacOS/Tailscale
    alias tailscale=/Applications/Tailscale.app/Contents/MacOS/Tailscale
  end
end


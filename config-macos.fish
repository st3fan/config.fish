# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/


if status is-interactive
  alias macos-desktop-hide "defaults write com.apple.finder CreateDesktop -bool false and killall Finder"
  alias macos-desktop-show "defaults write com.apple.finder CreateDesktop -bool true and killall Finder"

  if type -q starship
    export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
    starship init fish | source
  end
end


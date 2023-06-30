# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/

set -U fish_greeting

if status is-interactive
  set -gx PATH $PATH /usr/local/bin
  set -gx PATH $PATH /usr/local/sbin

  if test -d /usr/local/go
    set -gx PATH /usr/local/go/bin $PATH
  end

  if test -d $HOME/go/bin
    set -gx PATH $HOME/go/bin $PATH
  end

  if test -d $HOME/.cargo/bin
    set -gx PATH $HOME/.cargo/bin $PATH
  end

  if test -d $HOME/.emacs.d/bin
    set -gx PATH $HOME/.emacs.d/bin $PATH
  end

  if test -d $HOME/.poetry/bin
    set -gx PATH $HOME/.poetry/bin $PATH
  end

  if test -d $HOME/.deta/bin
    set -gx PATH $HOME/.deta/bin $PATH
  end

  if test -d $HOME/.local/bin
    set -gx PATH $HOME/.local/bin $PATH
  end

  # Prefer Neovim if it is installed
  if type -q nvim
    export VISUAL="nvim"
    alias vi=nvim
    alias vim=nvim
  end

  # Bat is cool
  if type -q bat
    export BAT_THEME="Catppuccin-mocha"
  end

  if type -q rbenv
    status --is-interactive; and rbenv init - fish | source
  end

  # Make sure the gpg-agent can find our terminal
  set -gx GPG_TTY (tty)

  # Source in 1Password plugins
  if test -f ~/.config/op/plugins.sh
    source ~/.config/op/plugins.sh
  end

  # Source in OS specific config
  switch (uname)
    case Darwin
        source (dirname (status --current-filename))/config-macos.fish
    case Linux
        source (dirname (status --current-filename))/config-linux.fish
  end
end

# Disable AWS SAM CLI Telemetry
export SAM_CLI_TELEMETRY=0


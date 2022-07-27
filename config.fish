# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/

set -U fish_greeting

if status is-interactive
  set -gx PATH $PATH /usr/local/bin
  set -gx PATH $PATH /usr/local/sbin

  if test -d /opt/homebrew/bin
    set -gx PATH /opt/homebrew/bin $PATH
  end

  # Because Homebrew defaults to Python 3.9
  if test -d /opt/homebrew/opt/python@3.10/bin
    set -gx PATH /opt/homebrew/opt/python@3.10/bin $PATH
  end

  if test -d /opt/homebrew/opt/ruby/bin
    set -gx PATH /opt/homebrew/opt/ruby/bin $PATH
  end

  if test -d /opt/homebrew/lib/ruby/gems/3.1.0/bin
    set -gx PATH /opt/homebrew/lib/ruby/gems/3.1.0/bin $PATH
  end

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

  # Prefer Neovim if it is installed
  if type -q nvim
    export VISUAL="nvim"
    alias vi=nvim
    alias vim=nvim
  end

  # Do not automatically upgrade anything
  export HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=1

  # Make sure the gpg-agent can find our terminal
  set -gx GPG_TTY (tty)

  # Source in OS specific config
  switch (uname)
    case Darwin
        source (dirname (status --current-filename))/config-macos.fish
    case Linux
        source (dirname (status --current-filename))/config-linux.fish
  end
end


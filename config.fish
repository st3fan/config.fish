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

    # Source in OS specific config
    switch (uname)
        case Darwin
            if test -f (dirname (status --current-filename))/config-macos.fish
                source (dirname (status --current-filename))/config-macos.fish
            end
            for file in (dirname (status --current-filename))/config-macos.d/*.fish
                if test -f $file
                    source $file
                end
            end
        case Linux
            if test -f (dirname (status --current-filename))/config-linux.fish
                source (dirname (status --current-filename))/config-linux.fish
            end
            for file in (dirname (status --current-filename))/config-linux.d/*.fish
                if test -f $file
                    source $file
                end
            end
    end

    # Source in common configs
    for file in (dirname (status --current-filename))/config.d/*.fish
        if test -f $file
            source $file
        end
    end

    # Source in machine local config
    if test -f (dirname (status --current-filename))/config-local.fish
        source (dirname (status --current-filename))/config-local.fish
    end
end

# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/

if status is-interactive
    if type -q pip
        pip completion --fish | source
    end

    #if type -q pipx
    #  register-python-argcomplete --shell fish pipx | source
    #end

    # Why does this need to be here? Is this not done first in config.fish?
    if test -d $HOME/.local/bin
        set -gx PATH $HOME/.local/bin $PATH
    end

    if type -q poetry
        poetry completions fish | source
    end
end

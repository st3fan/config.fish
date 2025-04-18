# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/

if status is-interactive
    if set -q SSH_AUTH_SOCK and set -q XDG_RUNTIME_DIR
        if test -e "$XDG_RUNTIME_DIR/.ssh-agent.socket"
            set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/.ssh-agent.socket"
        end
    end
end

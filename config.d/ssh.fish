# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/

if status is-interactive
  if set -q SSH_AUTH_SOCK
    if test -f ~/.ssh-agent.socket
      export SSH_AUTH_SOCK=~/.ssh-agent.socket
    end
  end
end

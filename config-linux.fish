# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/


if status is-interactive
  if test "$LC_TERMINAL" = "iTerm2"
    export TERM=xterm-24bit
  end
end

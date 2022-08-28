# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/

function venv
  if test -d .venv
    set EXISTING "\033[0;31mexisting\033[0m"
    echo -e "Sourcing $EXISTING .venv/bin/activate.fish"
    source .venv/bin/activate.fish
  else
    python3 -m venv --upgrade-deps --prompt "🐍" .venv
    if test $status = 0
      set NEW "\033[0;31mnew\033[0m"
      echo -e "Sourcing $NEW .venv/bin/activate.fish"
      source .venv/bin/activate.fish
    end
  end
end

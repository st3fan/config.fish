# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/

function venv
  if test -d .env
    set EXISTING "\033[0;31mexisting\033[0m"
    echo -e "Sourcing $EXISTING .env/bin/activate.fish"
    source .env/bin/activate.fish
  else
    python3 -m venv --upgrade-deps --prompt "🐍" .env
    if test $status = 0
      set NEW "\033[0;31mnew\033[0m"
      echo -e "Sourcing $NEW .env/bin/activate.fish"
      source .env/bin/activate.fish
    end
  end
end

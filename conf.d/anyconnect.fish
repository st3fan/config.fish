# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/

# Assumes a 1Password item called "VPN" with "host", "username", "password",
# "group" and "otp" fields. Requires 1Password CLI 2.19 or newer.

if test -d /opt/cisco/anyconnect
  if type -q op
    function anyconnect-up
      printf "$(op read op://Private/VPN/group)\n$(op read op://Private/VPN/username)\n$(op read op://Private/VPN/password)\n$(op read 'op://Private/VPN/otp?attribute=otp')\n" \
        | /opt/cisco/anyconnect/bin/vpn -s connect $(op read op://Private/VPN/host)
    end

    function anyconnect-down
      /opt/cisco/anyconnect/bin/vpn disconnect
    end
  end
end

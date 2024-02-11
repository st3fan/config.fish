# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/

if status is-interactive
  function sateh-psql-postgres
    set -lx PGPASSWORD $(op read "op://Sateh/fiebbmppo7c3cmi6234ctehl5y/password")
    psql --host=postgres.sateh.systems --username=postgres template1
  end

  function sateh-psql-wwmi
    set -lx PGPASSWORD $(op read "op://Sateh/77st5ejr2gwamlxozzz4si4yni/password")
    psql --host=postgres.sateh.systems --username=wwmi wwmi
  end

  function sateh-nomad
    set -lx NOMAD_TOKEN "op://Sateh/Nomad Management Token/SecretID"
    set -lx NOMAD_ADDR http://nomad1.sateh.systems:4646
    op run -- nomad $argv
  end
end

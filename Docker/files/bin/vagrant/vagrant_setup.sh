#!/bin/bash

create_ssh_hostfile () {
  cat <<_EOD_ > ~/.ssh/config.d/owaspbwa
Host owaspbwa
    HostName 192.168.1.90
    User     root
    IdentityFile ~/.ssh/id_owaspbwa
    StrictHostKeyChecking no
    UserKnownHostsFile /dev/null
    AddKeysToAgent yes
    UseKeyChain yes
_EOD_

}

set -x
ls ~/.ssh/id_owaspbwa || ssh-keygen -f ~/.ssh/id_owaspbwa && ssh-copy-id -i ~/.ssh/id_owaspbwa
ls ~/.ssh/config.d/owaspbwa || create_ssh_hostfile
scp ~/.ssh/id_owaspbwa.pub owaspbwa:.ssh/authorized_keys
scp ./useradd_vagrant.sh owaspbwa:useradd_vagrant.sh
ssh owaspbwa "chmod u+x ./useradd_vagrant.sh && ./useradd_vagrant.sh"
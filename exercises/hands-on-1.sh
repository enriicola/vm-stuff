#!/bin/bash

# Configure Vagrant to automatically enable SSH access using your personal key generate ssh key on the host machine (or use your personal one)
    # generate ssh key on the host machine (or use your personal one)
    # use a file provisioner to copy the public key on /tmp/id.pub
    # use a script provisioner (setup_pubkey.sh) to append the above key on the authorized_keys of the user vagrant
    # use a configuration variable KEY_FILE to specify the file containing the public key
    # check if the key already exists in the authorized_keys before adding it
    # test whether it works with an ssh client and vscode

# for loop to create file 1 to 10
for i in {1..10}
do
    touch file$i.txt
done


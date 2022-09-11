# Github Action VM 

## Overview

This repo is for a hyperv VM for running local Action Runners. This runner has Kubectl installed so that Github Actions can deploy into 
my pi cluster..


## Encrypted Vaules
Within buildAgent/files there is a .kube config. For saftey, it is encrypted with AES 256 and the ./vault_password is excluded from the repository to avoid leaking the config.

If you have checked out this repository without retaining the vault_password file then you will need to replace the .kube/config directory. Once you've done that you can reencrypt with a new password file.
To encrypt a new folder, run the following command:

```
cd ./provision/buildAgent/.kube
find . -type f -printf "%h/\"%f\" " | xargs ansible-vault encrypt --vault-password-file  /home/dan/vault_password 
```

## Adding action listeners to the repositroy

The agent is installed in /opt/actions-runner.
for each Github repository, you will need too add a new action file. Take the existing one as an example if you want to be able to install the service.


## Author
Dan Foulkes 
11/09/2022
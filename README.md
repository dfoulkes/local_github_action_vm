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

## Current Repos


| Repo              | Description                                                                                                                                                          | Source                                                                                             | Deployment Type |
| ----------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- |----------------------------------------------------------------------------------------------------|-----------------|
| Pi Hole           | A fork of the popular [MoJo2600/pihole-kubernetes](https://github.com/MoJo2600/pihole-kubernetes). with custom deploy scripts  that deploy via this VM using helm3.  | [https://github.com/dfoulkes/pihole-kubernetes](https://github.com/dfoulkes/pihole-kubernetes)     |      helm3      |
| Kubenetes Monitor | A fork of the popular [carlosedp/cluster-monitoring](https://github.com/carlosedp/cluster-monitoring). with customisations for speedtest deployed using jsonlet      | [https://github.com/carlosedp/cluster-monitoring](https://github.com/carlosedp/cluster-monitoring) |     jsonlet     |   
| Personal Blog     | A technical blog that uses Jykll to build a static website, helm to deploy on k3s with cloudflare on the edge for cyber protection                                   | [https://github.com/dfoulkes/personal-blog](https://github.com/dfoulkes/personal-blog)             |      helm3      |   


### Pi Hole


#### Description
A fork of the popular [MoJo2600/pihole-kubernetes](https://github.com/MoJo2600/pihole-kubernetes). with custom deploy scripts  that deploy via this VM using helm3.

#### Source
[https://github.com/dfoulkes/pihole-kubernetes](https://github.com/dfoulkes/pihole-kubernetes).

## Author
Dan Foulkes 
11/09/2022
# ansible-base
Use Ansible to solve more problems as much as possible

## Role: oracle_database_rac.yml
This role is used to install Oracle Database RAC on RHEL-like Linux.

Before using this role, you need to following the steps below:
1. Prepare the Operating System: RHEL 7.9 or 8.10
2. Check below configration is ready:
  - hostname
  - ip address: same subnet must with the same nic name between all nodes
  - ssh-keygen and ssh-copy-id
  - selinux is disabled
  - firewalld is disabled
  - storage
  - multipath
  - ntp
  - timedatectl
  - python2 or python3
  - if you have network
    yum: repo files
  - if you don't have network
    yum: createrepo.rpm

# ansible-base
Use Ansible to solve more problems as much as possible

## 版本控制 / Version Control

| 时间 | 事项 | 备注 |
| ---- | ---- | ---- |
| 2024-09-26 | 新增：剧本「oracle_database_rac.yml」 | 用于 Oracle Database 19c RAC 的一键部署 |
| 2024-10-13 | 新增：剧本「oracle_database_dataguard.yml」 | 用于 Oracle Database 19c Data Guard 的一键部署 |
| 2024-10-14 | 新增：角色「os-microsoft-windows」 | 用于 对 Microsoft Windows 操作系统 的一键配置 |

## Playbook: oracle_database_rac.yml
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

## Playbook: oracle_database_dataguard.yml

same as oracle_database_rac.yml

## Role: os-microsoft-windows
安装前，请确保完成了以下准备工作：

Ansible 受控端：
1. 安装好操作系统
2. 配置好网卡（IP / NETMAST / GATEWAY / DNS）
3. 关闭防火墙
4. 安装Python3
5. 运行「ms_windows__prepare_for_ansible.py」

Ansible 服务器：
1. PIP依赖包「pywinrm」
查看PIP依赖
```
pip list | grep winrm
pip3 list | grep winrm
```
安装PIP依赖
```
pip install pywinrm
pip3 install pywinrm
```

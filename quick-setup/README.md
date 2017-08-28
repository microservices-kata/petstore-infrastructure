# Ansible script to setup development environment

We assume you have at least TWO remote machines (could be in any cloud or datacenter, they just need to have accessible IP and user account). Most Linux distribution with Linux kernel 3.10 or above would be fine, and Ubuntu is prefered.

Nodes will be separate to different roles:

- **pipeline node**: a Jenkins service, a Docker registry and other public services would run on this node.
- **deployment node**: the whole pet store applictions and its dependencies (database, message queue, service discovery, etc) would run on this node. 

There should be just one `pipeline node` and at least one `deployment nodes`. The `deployment nodes` in real situation will used for each delivery stage. E.g. `DEV` for developers , `UAT` for user acceptance testing , `PROD` for online services, etc.

## 0. Have ansible installed

Install [ansible](https://www.ansible.com/) on your laptop. It's surely necessary !!

## 1. Build trust to remote machines

Add local ssh public key to remote machines.

This step is suggested but could be optional, see step 4 for workaround if you don't like having ssh trust.

## 2. Install python and pip on remote machine

Python v3 is prefered.

Ubuntu:

```
$ sudo apt install -y python3 python3-pip
```

RHEL/CentOS:

```
$ sudo yum install -y https://centos7.iuscommunity.org/ius-release.rpm
$ sudo yum install -y python36u python36u-pip
```

## 3. Configure node information

Update `hosts` and `ansible.cfg` file in this repo.

Some basic Ansible knowledge about this two files, check [intro_inventory](http://docs.ansible.com/ansible/intro_inventory.html) and [intro_configuration](http://docs.ansible.com/ansible/intro_configuration.html) docs.

## 4. Test connection

```
$ ansible all -i hosts.dev -m ping
$ ansible all -i hosts.prod -m ping
```

You should see green `SUCCESS` for each node configured in inventory files. If any thing goes wrong, fix them before continue.

> If you didn't put ssh key to the remote machines in step 1, you should add `--ask-pass` parameter, ansible will prompt input password when executing.

## 5. Install ansible docker role

Just run below command at this folder.

```
$ ansible-galaxy install -p roles git+https://github.com/avinetworks/ansible-role-docker,master
```

## 6. Provision

Trigger and wait all node become ready. If anything goes wrong in this step, you may consider raising an issue on this repo.

```
$ ansible-playbook -i hosts.dev init.yml
$ ansible-playbook -i hosts.dev pipeline.yml
$ ansible-playbook -i hosts.dev deployment.yml

$ ansible-playbook -i hosts.prod init.yml
$ ansible-playbook -i hosts.prod deployment.yml
```

> Again, put a `--ask-pass` parameter if you didn't have ssh key added to remote machines in step 1.

## Congratulation

Visit the `8000` port on pipeline node, there should have a runing Jenkins service waiting for you.
Change the pipeline settings according to you need.

Now grab a keyboard and you could just start coding from there.

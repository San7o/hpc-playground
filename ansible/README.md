# Ansible

Ansible is an open source, command-line IT automation software application written in Python. It can configure systems, deploy software, and orchestrate advanced workflows to support application deployment, system updates, and more.

# Create an inventory
An inventory contains all your hosts

`Inventory.ini`
```ini
[myhosts]
10.196.176.5
```

Test your inventory:
```bash
ansible myhosts -m ping -i inventory.ini -k
```
- You need `sshpass` installed if you have an ssh connection with password


# Run a module
```bash
ansible -i inventory.ini all -m ansible.builtin.setup
```

# Create a playbook

a playbook is a list of plys that define the order in which Ansible performs operations, from top to bottom. A play is a list of tasks on a certain node, a task is a reference to a single module that defines some operations.

`playbook.yaml`
```yaml
- name: My first Play
  hosts: myhosts
  tasks:
    - name: Ping my hosts
      ansible.builtin.ping:

    - name: Print message
      ansible.builtin.debug:
        msg: Hello World
```

```bash
ansible-playbook -i inventory.ini playbook.yaml -k
```

# Use become
Become let's you use sudo user, look at this example

```yaml
- name: NixOS manager
  hosts: pc
  become: true
  tasks:
  - name: system build
    ansible.builtin.command: nixos-rebuild test --flake /home/lanto/.config/nixos/flake.nix#lanto@hp --impure
```
```bash
ansible-playbook -i inventory.ini build-nixos.yaml --ask-become-pass
```

# When
The when keyword let's you run tasks conditionally
```yaml
- name: install apache2 package
  apt:
    name: apache2
    state: latest
  when: ansible_distribution == "CentOS"
```

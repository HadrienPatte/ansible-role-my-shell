# Ansible Role: My Shell

[![Build Status](https://travis-ci.com/HadrienPatte/ansible-role-my-shell.svg?branch=master)](https://travis-ci.com/HadrienPatte/ansible-role-my-shell)

An Ansible Role that installs shell utilities and deploy various dotfiles on
Ubuntu 18.04.

## Requirements

None.

## Role Variables

### Git Variables

* `my_shell_git_username`: the name used to author your commits
* `my_shell_git_email`: the email used to author your commits
* `my_shell_git_key_fingerprint`: the fingerpring of the GPG key used to sign
  your commits (can be left undefined)

See the `my_shell_git_config` variable in `defaults/main.yml` to further
configure git.
### GPG variables

* `my_shell_gpg_keygrip`: if defined, gpg-agent will be configured to use the
  associated GPG key as a SSH key (the public key can be obtained with
  `ssh-add -L`)

### Ansible Variables

* `my_shell_ansible_forks`: number of forks ansible should use
* `my_shell_ansible_callback_whitelist`: callback plugins to whitelist
* `my_shell_ansible_cows`: set this to `false` to prevent ansible to render its
output throught `cowsay` when it is installed
* `my_shell_ansible_pipelining`: set this to `true` to enable ansible pipelining

See the `my_shell_ansible_config` variable in `defaults/main.yml` to further
configure ansible.

### Hosts file Variables

* `my_shell_add_hosts_from_inventory`: set this to `true` to automatically add
  hosts from your inventory file to your `/etc/hosts` file. Your inventory file
  should have a structure similar to this:

```yaml
---
all:
  hosts:
    my_host_1:
      ansible_host: 10.0.0.1
    my_host_2:
      ansible_host: 10.0.0.2
```

### SSH Variables

* `my_shell_ssh_user`: your username when login on remote servers by SSH
* `my_shell_ssh_key`: location of your main SSH key (optional, defaults to
  `~/.ssh/id_rsa`)

# Dependencies

None.

# Example Playbook

```yaml
- name: Install shell utilities and deploy various dotfiles
  hosts: all
  roles:
    - hadrienpatte.my_shell
```

## License

MIT

## Author Information

Hadrien Patte [![PGP 0xFB500BB0](https://peegeepee.com/badge/orange/FB500BB0.svg)](https://peegeepee.com/FB500BB0)

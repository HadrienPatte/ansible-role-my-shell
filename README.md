# Ansible Role: My Shell

[![Build Status](https://travis-ci.com/HadrienPatte/ansible-role-my-shell.svg?branch=master)](https://travis-ci.com/HadrienPatte/ansible-role-my-shell)

An Ansible Role that installs shell utilities and deploys various dotfiles on
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

### Bash variables

* `my_shell_bash_aliases`: list of bash aliases (check the syntax and default
  values in `defaults/main.yml`)
* `my_shell_additional_bash_aliases`: list of additional bash aliases in case
  you do not want to overload `my_shell_bash_aliases`
* `my_shell_command_complete`: list of completion scripts for commands (check
  the syntax and default values in `defaults/main.yml`)

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

### Applications version Variables

* `my_shell_stern_version`: stern version
* `my_shell_k9s_version`: k9s version
* `my_shell_helm_version`: helm version
* `my_shell_oc_version`: oc version
* `my_shell_oc_version_hash`: oc version hash


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

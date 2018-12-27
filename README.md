# Ansible Role: My Shell

An Ansible Role that installs shell utilities and deploy various dotfiles on
Ubuntu 18.04.

## Requirements

None.

## Role Variables

* `my_shell_git_username`: the name used to author your commits
* `my_shell_git_email`: the email used to author your commits
* `my_shell_git_key_fingerprint`: the fingerpring of the GPG key used to sign
your commits (can be left undefined)

See the `my_shell_git_config` variable in `defaults/main.yml` to further
configure git.


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

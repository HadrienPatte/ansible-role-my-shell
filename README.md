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

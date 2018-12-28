import testinfra.utils.ansible_runner

import os

import pytest

import yaml

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('all')

with open('../../defaults/main.yml') as vars_yml:
    vars = yaml.load(vars_yml)

with open('playbook.yml') as playbook_yml:
    playbook = yaml.load(playbook_yml)

vars.update(playbook[0]['vars'])


@pytest.mark.parametrize('name', [
    ('git'),
    ('vim'),
    ('htop'),
    ('ncdu'),
    ('nmap'),
    ('sshuttle'),
    ('p7zip-full'),
    ('gnupg2'),
    ('unrar'),
    ('sl'),
    ('cmatrix'),
    ('cowsay'),
    ('traceroute'),
    ('autojump'),
    ('python3-dev'),
    ('python-setuptools'),
    ('undistract-me'),
])
def test_apt_package_is_installed(host, name):
    package = host.package(name)
    assert package.is_installed


@pytest.mark.parametrize('name', [
    ('pip'),
    ('pipenv'),
    ('virtualenvwrapper.sh'),
    ('pipenvwrapper.sh'),
    ('sshrc'),
    ('ansible'),
])
def test_package_is_installed(host, name):
    package = host.file(vars['ansible_env']['HOME'] + '/.local/bin/' + name)
    assert package.exists
    assert package.is_file


@pytest.mark.parametrize('line, path', [
    (
        'name = ' + vars['my_shell_git_username'],
        vars['ansible_env']['HOME'] + '/.gitconfig'
    ),
    (
        'email = ' + vars['my_shell_git_email'],
        vars['ansible_env']['HOME'] + '/.gitconfig'
    ),
    (
        'signingkey = ' + vars['my_shell_git_key_fingerprint'],
        vars['ansible_env']['HOME'] + '/.gitconfig'
    ),
    (
        'gpgsign = true',
        vars['ansible_env']['HOME'] + '/.gitconfig'
    ),
    ('Defaults        insults', '/etc/sudoers'),
])
def test_line_is_in_file(host, line, path):
    file = host.file(path)
    assert file.exists
    assert file.is_file
    assert file.contains(line)

import os

import pytest

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('all')


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
])
def test_apt_package_is_installed(host, name):
    package = host.package(name)
    assert package.is_installed


@pytest.mark.parametrize('name', [
    ('pip'),
])
def test_pip_package_is_installed(host, name):
    package = host.file('/home/test-user/.local/bin/' + name)
    assert package.exists
    assert package.is_file

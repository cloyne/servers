# Cloyne servers installation

This repository contains [Salt](http://docs.saltstack.com/en/latest/) files to deploy Cloyne servers.
Expected to be used with Ubuntu Server 16.04, but it might work with other
distributions as well.

An example Salt configuration, which may be used with `salt-ssh` follows.

```
pki_dir: /home/cloyne/servers/config/pki
cachedir: /tmp/salt-cache
jinja_trim_blocks: True
jinja_lstrip_blocks: True
ssh_use_home_key: True
ssh_minion_opts:
  gpg_keydir: /home/cloyne/.gnupg
log_file: /home/cloyne/servers/log/master
ssh_log_file: /home/cloyne/servers/log/ssh
file_roots:
  base:
    - /home/cloyne/servers/states
    - /home/cloyne/tozd
pillar_roots:
  base:
    - /home/cloyne/servers/pillars
```

You can put it into the `config/master` file under this repository.

In this example, the `servers` directory contains a checkout of this repository, while
the `tozd` directory is a checkout of the [`tozd/salt` repository](https://github.com/tozd/salt),
containing commonly used Salt states.

You should also create a `config/roster` file with something like:

```
server3:
  host: server3.cloyne.net
  port: 22
  user: cloyne
  sudo: True
```

Secrets are encrypted with a GPG keypair to be protected. Future secrets can be encrypted using:

```
echo -n "supersecret" | gpg --armor --encrypt -r <keyid>
```

[See Salt GPG renderer documentation for more information](https://docs.saltstack.com/en/latest/ref/renderers/all/salt.renderers.gpg.html).

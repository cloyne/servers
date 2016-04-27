# Cloyne servers installation

This repository contains the necessary Salt files to deploy Cloyne servers.

An example Salt configuration, which may be used with `salt-ssh` follows.

```
pki_dir: /home/cloyne/servers/config/pki
cachedir: /tmp/salt-cache
jinja_trim_blocks: True
jinja_lstrip_blocks: True
gpg_keydir: /home/cloyne/.gnupg
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

You should put SSH keys used by `salt-ssh` to login into servers into the `config/pki`
directory under this repository.

Secrets are encrypted with a GPG keypair to be protected. Future secrets can be encrypted using:

```
echo -n "supersecret" | gpg --armor --encrypt -r <keyid>
```

[See Salt GPG renderer documentation for more information](https://docs.saltstack.com/en/latest/ref/renderers/all/salt.renderers.gpg.html).

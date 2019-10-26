# Cloyne servers installation

This repository contains [Salt](http://docs.saltstack.com/en/latest/) files to deploy Cloyne servers.
Expected to be used with Ubuntu Server 16.04, but it might work with other distributions as well.

## Dependencies
You will need to install the python package `virtualenv`. You can do this using
`pip`. If you don't already have `pip` installed, look up instructions for your
operating system.
On a fresh linux install you may also need to install `g++` and `python-dev`.


Once you have `pip` installed, run `pip install virtualenv`.

After cloning this repository, you will also need to check out all submodules:
```bash
git submodule update --init --recursive
```

Next, create a virtualenv, for example:
```bash
virtualenv salt-virtualenv
. salt-virtualenv/bin/activate
```

## Inside the virtualenv
Your prompt should change to start with (salt-virtualenv). Make sure you're in a
terminal where you've activated the virtualenv before contiuing.

You'll then install `salt-ssh` using `virtualenv` (you do NOT need `sudo` for
these):
```bash
# Install salt==2016.11.1
pip install salt==2016.11.1

# Check version of salt-ssh
salt-ssh --version
# salt-ssh 2016.11.1 (Carbon)
```

### Deploying to the server
Then you can sync the state of a server by doing:
(This updates the live server to match the docker images built from github, so
make sure all the docker images still work!)

```
$ salt-ssh '<servername>' state.highstate
```
Note: This might take ~10 minutes with no output until the end.
If it fails quickly with `ImportError: No module named oncurrent.futures`: ssh
into `<servername>` and run `sudo pip install futures`.

# Secrets
Secrets are encrypted with a GPG keypair to be protected. Future secrets can be encrypted using:

```
echo -n "supersecret" | gpg --armor --encrypt -r <keyid>
```

[See Salt GPG renderer documentation for more information](https://docs.saltstack.com/en/latest/ref/renderers/all/salt.renderers.gpg.html).

# Adding New Servers
When adding a new server, the `cloyne` user on the target server should have sudo permissions without needing to provide a password.
You can configure that in `/etc/sudoers` on the target server with such line (you can replace existing
one without `NOPASSWD`):

```
# Allow members of group sudo to execute any command
%sudo   ALL=(ALL) NOPASSWD: ALL
```
# Troubleshooting
## permission issues/can't copy salt key
1. Check config/roster and make sure the settings are correct for the host
   you're deploying to
2. Make sure you have passwordless login set up on the remote host
3. pass the option `--priv ~/.ssh/id_rsa` to use your RSA key instead of Salt's.

## python syntax errors when running with python3.7
This currently needs to be run with python 2.7. We need to update it by the time
python 2.7 becomes deprecated.

## permission denied for writing to the log file
Pass the location of the log file inside this directory, e.g.
`--log-file=./log/ssh`

## Arch
Install `python-virtualenv2` and run the commands with `virtualenv2` instead of
`virtualenv`.

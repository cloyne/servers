# MAJOR CHANGES TO COME

The following will be out of date soon. We will be moving to [Ansible](https://github.com/ansible/ansible) soon. For 
more details on how we are doing this and why, see [our wiki pages](https://github.com/cloyne/servers/wiki/Architectural-Changes-and-why-we-did-them)
# Cloyne servers installation

This repository contains [Salt](http://docs.saltstack.com/en/latest/) files to deploy Cloyne servers.
Expected to be used with Ubuntu Server 16.04, but it might work with other distributions as well.

## Dependencies
This only works on Ubuntu! It DOES work on Windows Subsystem for Linux with Ubuntu installed. It DOES NOT work on Mac OS.

You will need to install the python package `virtualenv`. You can do this using
`pip`. If you don't already have pip installed, install it with `sudo apt install python3-pip`.
Once you have `pip` installed, run `sudo pip3 install virtualenv`.

If you don't already have `pip` installed, look up instructions for your
operating system.
On a fresh linux install you may also need to install `g++` and `python-dev`.




After cloning this repository, you will also need to check out all submodules:
```bash
git submodule update --init --recursive
```

Next, create a virtualenv, for example:
```bash
virtualenv --python=/usr/bin/python3 salt-virtualenv
. salt-virtualenv/bin/activate
```

If upgrading from python2, you'll need to `rm -rf` the existing
`salt-virtualenv` folder first.

## Inside the virtualenv
Your prompt should change to start with (salt-virtualenv). Make sure you're in a
terminal where you've activated the virtualenv before contiuing.

You'll then install `salt-ssh` using `virtualenv` (you do NOT need `sudo` for
these):

```bash
# currently necessary as of 06/25/2020, but this is a bug and should be fixed, see https://github.com/saltstack/salt/issues/55029
pip install distro

# Install salt==3001
pip install salt==3001

# Check version of salt-ssh
salt-ssh --version
# salt-ssh 3001
```

Update (08/25/2022): if you encounter Markup import error from Jinja2, it's because there's a bug with Jinja2 version 3.0.1+ with salt-ssh. This is the fix:
```bash
pip uninstall Jinja2 -y && pip uninstall MarkupSafe -y
pip install Jinja2==3.0
```

### Deploying to the server
Then you can sync the state of a server by doing:
(This updates the live server to match the docker images built from github, so
make sure all the docker images still work!)

```bash
$ salt-ssh '<servername>' state.highstate
```
If using a server that is configured to disallow password logins, you must specify the public key:
```bash
$ salt-ssh '<servername>' state.highstate
```

Note: This might take ~10 minutes with no output until the end.
If it fails quickly with `ImportError: No module named concurrent.futures`: ssh
into `<servername>` and run `sudo pip install futures`.

# Secrets
Secrets are encrypted with a GPG keypair to be protected. Future secrets can be encrypted using:

```
echo -n "supersecret" | gpg --armor --encrypt -r <keyid>
```

[See Salt GPG renderer documentation for more information](https://docs.saltstack.com/en/latest/ref/renderers/all/salt.renderers.gpg.html).

# Adding New Servers
When adding a new server, the `cloyne` user on the target server should have sudo permissions without needing to provide a password.

First create the cloyne user and set a password:

``` 
useradd -m cloyne -G sudo
passwd cloyne
```

Next, configure that in `/etc/sudoers` on the target server with such line (you can replace existing
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

## permission denied for writing to the log file
Pass the location of the log file inside this directory, e.g.
`--log-file=./log/ssh`

## ModuleNotFoundError: No moule named 'vboxapi'
1. Install VirtualBox
`sudo apt install virtualbox`
2. Download SDK from virtualbox.org/wiki/Downloads
3. cd to sdk/installer and run
```
export VBOX_INSTALL_PATH=$(which virtualbox)
python vboxapisetup.py install
```
4. I also did `pip3 install virtualbox` and `pip3 install vboxapi` and `pip3 install pyvbox`; not sure if these were necessary

## No module named 'urllib2'
Use clonm/salt instead of tozd/salt. tozd/salt hasn't been upgraded to python3 yet.

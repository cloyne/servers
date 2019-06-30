# Cloyne servers installation

This repository contains [Salt](http://docs.saltstack.com/en/latest/) files to deploy Cloyne servers.
Expected to be used with Ubuntu Server 16.04, but it might work with other distributions as well.

Check out all submodules:
```bash
git submodule update --init --recursive
```

Install `salt-ssh` using `virtualenv` (you do NOT need `sudo` for these):
```bash
# Create a virtualenv, for example:
virtualenv salt-virtualenv
. salt-virtualenv/bin/activate

# Install salt==2016.11.1
pip install salt==2016.11.1

# Check version of salt-ssh
salt-ssh --version
# salt-ssh 2016.11.1 (Carbon)
```

Then you can sync the state of a server by doing:
(This updates the live server to match the docker images built from github, so
make sure all the docker images still work!)

```
$ salt-ssh '<servername>' state.highstate
```
Note: This might take ~10 minutes with no output until the end.
If it fails quickly with `ImportError: No module named oncurrent.futures`: ssh
into `<servername>` and run `sudo pip install futures`.

Secrets are encrypted with a GPG keypair to be protected. Future secrets can be encrypted using:

```
echo -n "supersecret" | gpg --armor --encrypt -r <keyid>
```

[See Salt GPG renderer documentation for more information](https://docs.saltstack.com/en/latest/ref/renderers/all/salt.renderers.gpg.html).

When adding a new server, the `cloyne` user on the target server should have sudo permissions without needing to provide a password.
You can configure that in `/etc/sudoers` on the target server with such line (you can replace existing
one without `NOPASSWD`):

```
# Allow members of group sudo to execute any command
%sudo   ALL=(ALL) NOPASSWD: ALL
```
# Misc. Upgrade notes

To upgrade postgresql database used by Sympa, follow the desired version's [upgrade instructions](https://www.postgresql.org/docs/10/upgrading.html).
For existing sympa installation,
1. From the running `pgsql` container, run `sudo -u postgres pg_dumpall >
   var/lib/postgresql/pgsql_backup_$(date)` to create a backup of the entire
   database within the volume accessible from outside the container. You can
   check the name of the created file by listing files sorted by date with `ls
   -lhat`, either from `/var/lib/postgresql` inside the container or
   `/srv/postgresql` on the host. The most recent file will be at the top of the
   list. (Note: the filename doesn't actually have to follow any particular
   format, I've just suggested a command that will generate unique names.)
2. Test out the postgresql container for the new version, by running it with the
   following:
       `docker run --restart=always --name=pgsql-new --hostname=pgsql-new -v
       /srv/var/log/postgresql-new:/var/log/postgresql -v
       /srv/postgresql:/var/lib/postgresql`
   This will start a new container running the new version. WARNING: the line
   above has it use the same storage directory as the existing pgsql container.
   This is fine as long as the containers are running different versions, but
   will create a race condition if you try to run two containers with the same
   version of postgresql. If the database keeps crashing with `lock file
   "postmaster.pid" contains wrong PID` and `The postmaster has commanded this
   server process to roll back the current transaction and exit`, that is
   probably why.
3. In the `pgsql-new` container, import the backup file you exported:
    `sudo -u postgres psql -d postgres -f
    /var/lib/postgresql/pgsql_backup_TIMESTAMP_HERE`. See step 1 for how to get
    the file name.
4. Stop the `pgsql-new` container with `docker stop pgsql-new`.
5. comment out everything but `postgresql` in pillars/server2/docker/init.sls,
   and then follow the steps above for syncing server2.

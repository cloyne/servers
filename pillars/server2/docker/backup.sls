docker:
  containers:
    backup:
      image: tozd/rdiff-backup
      network_mode:
        name: server2.cloyne.org
      environment:
        RDIFF_BACKUP_EXPIRE: 12M
        ADMINADDR:
          type: pillar
          key: mailer:root_alias
          join: ','
        REMOTES:
          type: pillar
          key: mailer:relay
        MAILTO:
          type: pillar
          key: mailer:root_alias
          join: ','
      volumes:
        /:
          bind: /source/host
        /srv/mnt/backup:
          bind: /backup
        /var/run/docker.sock:
          bind: /var/run/docker.sock
          type: socket
        /srv/storage/backup/backup.list:
          bind: /source/backup.list
          type: file
        /srv/storage/backup/backup.d:
          bind: /etc/backup.d
      files:
        /srv/storage/backup/backup.list: |
          + /source/host/etc
          + /source/host/home
          - /source/host/srv/mnt/backup
          - /source/host/srv/mnt/tmp
          - /source/host/srv/docker
          - /source/host/srv/tmp
          + /source/host/srv
          + /source/host/root
          + /source/host/var/backups
          + /source/host/var/log
          + /source/host/usr/local/bin
          + /source/host/usr/local/etc
          + /source/host/usr/local/sbin
          - /source/host
        /srv/storage/backup/backup.d/pgsqlcd:
          mode: 755
          contents: |
            #!/bin/bash -e
            docker exec pgsql pg_dumpall -U postgres > /source/data/pgsql.sql
        /srv/storage/backup/backup.d/mysql:
          mode: 755
          contents: |
            #!/bin/bash -e
            PASSWORD=$(docker exec mysql grep password /etc/mysql/debian.cnf | awk '{print $3}' | head -1)
            echo "$PASSWORD" | docker exec mysql mysqldump --user=debian-sys-maint --password="$PASSWORD" --all-databases > /source/data/mysql.sql

docker:
  containers:
    pgsql:
      image: cloyne/postgresql
      network_mode:
        name: server2.cloyne.org
      volumes:
        /srv/postgresql:
          bind: /var/lib/postgresql
        /srv/var/log/postgresql:
          bind: /var/log/postgresql

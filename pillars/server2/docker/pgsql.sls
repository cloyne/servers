docker:
  containers:
    pgsql:
      image: tozd/postgresql
      tag: "9.3"
      network_mode:
        name: server2.cloyne.org
      volumes:
        /srv/postgresql:
          bind: /var/lib/postgresql
          user: 102
          group: 106
        /srv/var/log/postgresql:
          bind: /var/log/postgresql
          user: nobody
          group: nogroup

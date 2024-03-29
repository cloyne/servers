docker:
  containers:
    pgsql:
      image: clonm/postgresql
      tag: "10"
      network_mode:
        name: server4.cloyne.org
      volumes:
        /srv/postgresql:
          bind: /var/lib/postgresql
          user: 102
          group: 106
        /srv/var/log/postgresql:
          bind: /var/log/postgresql
          user: nobody
          group: nogroup

docker:
  containers:
    mysql:
      image: cloyne/mysql
      network_mode:
        name: server2.cloyne.org
      volumes:
        /srv/mysql:
          bind: /var/lib/mysql
        /srv/var/log/mysql:
          bind: /var/log/mysql

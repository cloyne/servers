docker:
  containers:
    mysql:
      image: tozd/mysql
      tag: "10.1"
      network_mode:
        name: server2.cloyne.org
      volumes:
        /srv/mysql:
          bind: /var/lib/mysql
        /srv/var/log/mysql:
          bind: /var/log/mysql

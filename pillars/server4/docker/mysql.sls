docker:
  containers:
    mysql:
      image: clonm/mysql
      tag: "10.1"
      network_mode:
        name: server4.cloyne.org
      volumes:
        /srv/mysql:
          bind: /var/lib/mysql
        /srv/var/log/mysql:
          bind: /var/log/mysql

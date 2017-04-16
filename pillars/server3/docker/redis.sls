docker:
  containers:
    redis:
      image: tozd/redis
      network_mode:
        name: server3.cloyne.org
      volumes:
        /srv/log/redis:
          bind: /var/log/redis
          user: nobody
          group: nogroup

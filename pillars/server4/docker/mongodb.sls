docker:
  containers:
    mongo:
      image: cloyne/mongodb
      tag: 3.6
      network_mode:
        name: server4.cloyne.org
      volumes:
        /srv/storage/rocketchat/mongo:
            bind: /var/lib/mongodb
        /srv/storage/rocketchat/dump:
            bind: /dump
        /srv/log/mongo:
            bind: /var/log/mongod
      command: mongod --smallfiles

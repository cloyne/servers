docker:
  containers:
    mongo:
      image: clonm/mongodb
      tag: 3.6
      network_mode:
        name: server3.cloyne.org
      volumes:
        /srv/storage/rocketchat/mongo:
            bind: /var/lib/mongodb
        /srv/storage/rocketchat/dump:
            bind: /dump
        /srv/log/mongo:
            bind: /var/log/mongod
      command: mongod --smallfiles

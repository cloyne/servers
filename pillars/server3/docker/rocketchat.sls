docker:
  containers:
    rocketchat:
      image: cloyne/rocketchat
      network_mode:
        name: server3.cloyne.org
      environment:
        VIRTUAL_HOST: chat.cloyne.org
        VIRTUAL_PORT: 3000
        VIRTUAL_ALIAS: /
        VIRTUAL_LETSENCRYPT: true
        PHP_FCGI_CHILDREN: 30
        SET_REAL_IP_FROM: 172.18.0.0/16
        MONGO_URL: mongodb://mongo:27017/rocketchat
        MONGO_OPLOG_URL: mongodb://mongo:27017/local?replSet=rs01
        ROOT_URL: https://chat.cloyne.org
        Accounts_UseDNSDomainCheck: False
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
        MAIL_URL: smtp://mail.cloyne.org
        MAIL_FROM: rocketchat@cloyne.org
      ports:
        3000/tcp:
          ip:
            type: pillar
            key: network:interfaces:p1p1:ipv4:0:address
          port: 3000
      volumes:
        /srv/storage/rocketchat/uploads:
            bind: /Rocket.Chat/uploads
        /srv/storage/rocketchat/etc:
            bind: /etc/rocketchat
        /srv/log/rocketchat:
            bind: /var/log/rocketchat
            user: nobody
            group: nogroup
      dependencies:
        - mongo

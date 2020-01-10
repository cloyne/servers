docker:
  containers:
    owncloud:
      image: cloyne/owncloud
      network_mode:
        name: server3.cloyne.org
      environment:
        VIRTUAL_HOST: files.cloyne.org
        VIRTUAL_URL: /
        VIRTUAL_LETSENCRYPT: true
        PHP_FCGI_CHILDREN: 30
        SET_REAL_IP_FROM: 172.18.0.0/16
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
      volumes:
        /srv/storage/owncloud/config:
          bind: /var/www/owncloud/config
          user: 106
          group: 108
        /srv/storage/owncloud/data:
          bind: /owncloud-data
          user: 106
          group: 108
        /srv/log/owncloud/nginx:
          bind: /var/log/nginx
          user: nobody
          group: nogroup
        /srv/storage/owncloud/redis:
          bind: /var/lib/redis
          user: 103
          group: 106
        /srv/log/owncloud/redis:
          bind: /var/log/redis
          user: nobody
          group: nogroup
      dependencies:
        - postgresql

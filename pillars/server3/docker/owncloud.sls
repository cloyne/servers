docker:
  containers:
    owncloud:
      image: cloyne/owncloud
      environment:
        - VIRTUAL_HOST: files.cloyne.org
          VIRTUAL_URL: /
          PHP_FCGI_CHILDREN: 30
          ADMINADDR:
            type: pillar
            key: mailer:root_alias
            join: ','
          REMOTES:
            type: pillar
            key: mailer:relay
      volumes:
        /srv/storage/owncloud/config:
          bind: /var/www/owncloud/config
          user: 102
          group: 105
        /srv/storage/owncloud/data:
          bind: /owncloud-data
          user: 102
          group: 105
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

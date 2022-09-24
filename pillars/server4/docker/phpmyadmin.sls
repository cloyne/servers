docker:
  containers:
    phpmyadmin:
      image: tozd/phpmyadmin
      network_mode:
        name: server4.cloyne.org
      environment:
        PHPMYADMIN_DBSERVER: mysql
        VIRTUAL_HOST: cloyne.org
        VIRTUAL_ALIAS: /phpmyadmin/
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
        /srv/var/log/phpmyadmin:
          bind: /var/log/nginx
          user: nobody
          group: nogroup
      dependencies:
        - mysql

docker:
  containers:
    blog:
      image: cloyne/blog
      network_mode:
        name: server2.cloyne.org
      environment:
        VIRTUAL_HOST: cloyne.org
        VIRTUAL_ALIAS: /
        VIRTUAL_LETSENCRYPT: true
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
        /srv/blog/etc:
          bind: /etc/wordpress
        /srv/var/log/blog:
          bind: /var/log/nginx
          user: nobody
          group: nogroup
        /srv/blog/uploads:
          bind: /wordpress/wp-content/uploads
      dependencies:
        - mysql

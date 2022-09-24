docker:
  containers:
    sympa:
      image: cloyne/sympa
      network_mode:
        name: server4.cloyne.org
      environment:
        VIRTUAL_HOST: cloyne.org
        REMOTE_ADDR: cloyne.org
        VIRTUAL_ALIAS: /lists,/lists-static/
        SET_REAL_IP_FROM: 172.18.0.0/16
        ADMINADDR:
          type: pillar
          key: mailer:root_alias
          join: ','
        REMOTES:
          type: pillar
          key: mailer:relay
      volumes:
        /srv/sympa/etc/shared:
          bind: /etc/sympa/shared
        /srv/var/log/sympa:
          bind: /var/log/sympa
        /srv/var/log/sympa/nginx:
          bind: /var/log/nginx
        /srv/sympa/data:
          bind: /var/lib/sympa
        /srv/sympa/nullmailer:
          bind: /var/spool/nullmailer
        /srv/sympa/spool:
          bind: /var/spool/sympa
        /srv/sympa/etc/includes:
          bind: /etc/sympa/includes
      dependencies:
        - mail
        - pgsql

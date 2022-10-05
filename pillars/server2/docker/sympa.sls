docker:
  containers:
    sympa:
      image: cloyne/sympa
      network_mode:
        name: server2.cloyne.org
      ports:
        22/tcp:
          ip:
            type: pillar
            key: network:interfaces:eth0:ipv4:0:address
          port: 2025
      environment:
        VIRTUAL_HOST: cloyne.org
        REMOTE_ADDR: cloyne.org
        VIRTUAL_ALIAS: /lists,/lists-static/
        SET_REAL_IP_FROM: 172.18.0.0/16
        ADMINADDR:
          type: pillar
          key: mailer:root_alias
          join: ','
        REMOTES: mail.cloyne.org smtp port=587 starttls insecure tls-anon-auth user=sympa@cloyne.org pass=password
        # REMOTES:
        #   type: pillar
        #   key: mailer:relay
      volumes:
        /srv/sympa/etc/shared:
          bind: /etc/sympa/shared
        /srv/var/log/sympa:
          bind: /var/log/sympa
        /srv/web/ssl:
          bind: /ssl
          user: root
          group: root
          mode: 701
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

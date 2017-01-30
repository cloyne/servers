docker:
  containers:
    web:
      image: cloyne/web
      network_mode:
        name: server2.cloyne.org
      ports:
        80/tcp:
          ip:
            type: pillar
            key: network:interfaces:eth0:ipv4:0:address
          port: 80
        443/tcp:
          ip:
            type: pillar
            key: network:interfaces:eth0:ipv4:0:address
          port: 443
      environment:
        ADMINADDR:
          type: pillar
          key: mailer:root_alias
          join: ','
        MAILTO:
          type: pillar
          key: mailer:root_alias
          join: ','
        REMOTES:
          type: pillar
          key: mailer:relay
        LETSENCRYPT_EMAIL: clonm+server2@bsc.coop
      volumes:
        /srv/var/log/letsencrypt:
          bind: /var/log/letsencrypt
          user: nobody
          group: nogroup
        /srv/web/sites:
          bind: /etc/nginx/sites-volume
          user: root
          group: root
        /srv/web/ssl:
          bind: /ssl
          user: root
          group: root
          mode: 701
        /var/run/docker.sock:
          bind: /var/run/docker.sock
          type: socket
          readonly: True
        /srv/var/log/nginx:
          bind: /var/log/nginx
          user: nobody
          group: nogroup
        /srv/var/log/dockergen:
          bind: /var/log/dockergen
          user: nobody
          group: nogroup

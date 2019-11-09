docker:
  containers:
    nginx-proxy:
      image: clonm/nginx-proxy
      network_mode:
        name: server4.cloyne.org
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
        REMOTES:
          type: pillar
          key: mailer:relay
        MAILTO:
          type: pillar
          key: mailer:root_alias
          join: ','
        LETSENCRYPT_EMAIL: clonm+server4@bsc.coop
      volumes:
        /srv/log/letsencrypt:
          bind: /var/log/letsencrypt
          user: nobody
          group: nogroup
        /srv/storage/sites:
          bind: /etc/nginx/sites-volume
          user: root
          group: root
        /srv/storage/ssl:
          bind: /ssl
          user: root
          group: root
          mode: 701
        /var/run/docker.sock:
          bind: /var/run/docker.sock
          type: socket
        /srv/log/nginx-proxy:
          bind: /var/log/nginx
          user: nobody
          group: nogroup
        /srv/log/dockergen:
          bind: /var/log/dockergen
          user: nobody
          group: nogroup
        /srv/storage/nginx/client_max_body_size.conf:
          bind: /etc/nginx/conf.d/client_max_body_size.conf
          type: file
        /srv/storage/nginx/proxy_read_timeout.conf:
          bind: /etc/nginx/conf.d/proxy_read_timeout.conf
          type: file
      files:
        /srv/storage/nginx/client_max_body_size.conf: |
          client_max_body_size 16384m;
        # The same timeout as PHP's max_execution_time.
        /srv/storage/nginx/proxy_read_timeout.conf: |
          proxy_read_timeout 3600s;

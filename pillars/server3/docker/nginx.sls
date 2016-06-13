docker:
  containers:
    nginx-proxy:
      image: tozd/nginx-proxy
      ports:
        80/tcp:
          ip: 10.20.32.11
          port: 80
      volumes:
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
          logrotate: True
        /srv/storage/nginx/client_max_body_size.conf:
          bind: /etc/nginx/conf.d/client_max_body_size.conf
          type: file
      files:
        /srv/storage/nginx/client_max_body_size.conf: |
          client_max_body_size 16384m;
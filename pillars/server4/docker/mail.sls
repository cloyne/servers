docker:
  containers:
    mail:
      image: cloyne/postfix
      network_mode:
        name: server4.cloyne.org
      ports:
        25/tcp:
          ip:
            type: pillar
            key: network:interfaces:ens3:ipv4:0:address
          port: 25
        465/tcp:
          ip:
            type: pillar
            key: network:interfaces:ens3:ipv4:0:address
          port: 465
        587/tcp:
          ip:
            type: pillar
            key: network:interfaces:ens3:ipv4:0:address
          port: 587
      environment:
        MAILNAME:
          type: pillar
          key: mailer:relay
        MY_NETWORKS: 172.17.0.0/16 172.18.0.0/16 208.113.134.114/32 127.0.0.0/8
        ROOT_ALIAS:
          type: pillar
          key: mailer:root_alias
          join: ","
        MY_DESTINATION: localhost.localdomain, localhost, mail.cloyne.org
        CERT_DIR: /ssl/live/mail.cloyne.org
      volumes:
        /srv/sympa/etc/shared:
          bind: /etc/sympa/shared
        /srv/rocketchat/etc/shared:
          bind: /etc/rocketchat/shared
        /srv/var/log/postfix:
          bind: /var/log/postfix
        /srv/postfix/spool:
          bind: /var/spool/postfix
        /srv/postfix/sasl:
          bind: /etc/postfix/sasl
        /etc/letsencrypt:
          bind: /ssl
        /etc/ssl:
          bind: /etc/ssl
        /usr/share/ca-certificates:
          bind: /usr/share/ca-certificates

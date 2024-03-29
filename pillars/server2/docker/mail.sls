docker:
  containers:
    mail:
      image: cloyne/postfix
      tag: clonm
      network_mode:
        name: server2.cloyne.org
      ports:
        25/tcp:
          ip:
            type: pillar
            key: network:interfaces:eth0:ipv4:0:address
          port: 25
        465/tcp:
          ip:
            type: pillar
            key: network:interfaces:eth0:ipv4:0:address
          port: 465
        587/tcp:
          ip:
            type: pillar
            key: network:interfaces:eth0:ipv4:0:address
          port: 587
      environment:
        MAILNAME:
          type: pillar
          key: mailer:relay
        MY_NETWORKS: 172.17.0.0/16 172.18.0.0/16 192.168.88.0/24 127.0.0.0/8
        ROOT_ALIAS:
          type: pillar
          key: mailer:root_alias
          join: ","
        MY_DESTINATION: localhost.localdomain, localhost, smtp.cloyne.org, mail.cloyne.org
      volumes:
        /srv/sympa/etc/shared:
          bind: /etc/sympa/shared
        /srv/rocketchat/etc/shared:
          bind: /etc/rocketchat/shared
        /srv/var/log/postfix:
          bind: /var/log/postfix
        /srv/postfix/spool:
          bind: /var/spool/postfix
        /srv/web/ssl:
          bind: /ssl
        /srv/postfix/sasl:
          bind: /etc/postfix/sasl

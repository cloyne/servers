docker:
  containers:
    mail:
      image: cloyne/postfix
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
        MY_NETWORKS: 10.20.32.0/22 172.17.0.0/16 172.18.0.0/16 64.62.133.40/29 127.0.0.0/8
        ROOT_ALIAS:
          type: pillar
          key: mailer:root_alias
          join: ","
        MY_DESTINATION: localhost.localdomain, localhost, mail.cloyne.org
      volumes:
        /srv/sympa/etc/shared:
          bind: /etc/sympa/shared
        /srv/var/log/postfix:
          bind: /var/log/postfix
        /srv/postfix:
          bind: /var/spool/postfix

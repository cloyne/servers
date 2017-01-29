docker:
  containers:
    dns:
      image: cloyne/powerdns-master
      network_mode:
        name: server2.cloyne.org
      ports:
        53/tcp:
          ip:
            type: pillar
            key: network:interfaces:eth0:ipv4:0:address
          port: 53
        53/udp:
          ip:
            type: pillar
            key: network:interfaces:eth0:ipv4:0:address
          port: 53
      volumes:
        /srv/var/log/powerdns:
          bind: /var/log/powerdns
          user: nobody
          group: nogroup

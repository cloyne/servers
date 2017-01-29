docker:
  containers:
    dns:
      image: cloyne/powerdns-slave
      network_mode:
        name: server1.cloyne.org
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
        /srv/dns/powerdns/log:
          bind: /var/log/powerdns
          user: nobody
          group: nogroup

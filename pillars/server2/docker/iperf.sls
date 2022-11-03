docker:
  containers:
    iperf:
      image: tozd/iperf
      network_mode:
        name: server2.cloyne.org
      ports:
        5001/tcp:
          ip:
            type: pillar
            key: network:interfaces:eth0:ipv4:0:address
          port: 5001

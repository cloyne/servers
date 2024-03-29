docker:
  containers:
    iperf:
      image: tozd/iperf
      network_mode:
        name: server4.cloyne.org
      ports:
        5001/tcp:
          ip:
            type: pillar
            key: network:interfaces:eth1:ipv4:0:address
          port: 5001

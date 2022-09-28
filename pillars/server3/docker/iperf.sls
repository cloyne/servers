docker:
  containers:
    iperf:
      image: clonm/iperf
      network_mode:
        name: server3.cloyne.org
      ports:
        5001/tcp:
          ip:
            type: pillar
            key: network:interfaces:p1p1:ipv4:0:address
          port: 5001

network:
  system:
    hostname: kingman-reverse-proxy
    fqdn: kingmanhall.org
  dns:
    ipv4:
      - 216.218.196.2
  interfaces:
    eth0:
      ipv4:
        - type: static
          address: 64.62.133.46
          netmask-address: 64.62.133.46/28
          netmask: 255.255.255.248
          gateway: 64.62.133.42

network:
  system:
    hostname: server2
    fqdn: server2.cloyne.org
  dns:
    ipv4:
      - 216.218.196.2
  interfaces:
    eth0:
      ipv4:
        - type: static
          address: 64.62.133.44
          netmask: 255.255.255.248
          gateway: 64.62.133.41
    eth1:
      ipv4:
        - type: static
          address: 192.168.88.10
          netmask: 255.255.255.0
          gateway: 192.168.88.1
mailer:
  other_hostnames: server2.cloyne.org
  local_interfaces: 127.0.0.1 ; ::1
  relay: mail.cloyne.org
  root_alias:
    - clonm@bsc.coop
    - mitar.cloyne@tnode.com

network:
  system:
    hostname: server3
    fqdn: server3.cloyne.net
  dns:
    ipv4:
      - 216.218.196.2
  interfaces:
    p1p1:
      ipv4:
        - type: static
          address: 64.62.133.45
          netmask: 255.255.255.248
          gateway: 64.62.133.42
    p1p2:
      ipv4:
        - type: static
          address: 10.20.32.11
          netmask: 255.255.252.0
    p1p3:
      ipv4:
        - type: static
          address: 172.16.0.103
          netmask: 255.255.255.0
mailer:
  other_hostnames: server3.cloyne.net
  local_interfaces: 127.0.0.1 ; ::1
  relay: mail.cloyne.net
  root_alias:
    - clonm@bsc.coop
    - mitar.cloyne@tnode.com

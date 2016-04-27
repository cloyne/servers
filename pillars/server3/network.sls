network:
  system:
    hostname: server3
    fqdn: server3.cloyne.net
  dns:
    ipv4:
      - 216.218.196.2
  interfaces:
    p5p1:
      ipv4:
        - type: static
          address: 10.20.32.11
          netmask: 255.255.252.0
          gateway: 10.20.32.1
    p6p1:
      ipv4:
        - type: static
          address: 172.16.0.103
          netmask: 255.255.255.0
mailer:
  other_hostnames: server3.cloyne.net
  local_interfaces: 127.0.0.1 ; ::1
  relay: mail.cloyne.net
  root_alias:
    - clonm@bsc.coop,mitar.cloyne@tnode.com

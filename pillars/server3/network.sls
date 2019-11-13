network:
  system:
    hostname: server3
    fqdn: server3.cloyne.org
  dns:
    ipv4:
      - 216.218.196.2
  interfaces:
    p1p1:
      ipv4:
        - type: static
          address: 64.62.133.45
          netmask: 255.255.255.248
          gateway: 64.62.133.41
    p1p2:
      ipv4:
        - type: static
          address: 192.168.88.11
          netmask: 255.255.255.0
mailer:
  other_hostnames: server3.cloyne.org
  local_interfaces: 127.0.0.1 ; ::1
  relay: mail.cloyne.org
  root_alias:
    - clonm@bsc.coop
    - mitar.cloyne@tnode.com

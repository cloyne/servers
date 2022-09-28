network:
  system:
    hostname: server3
    fqdn: server3.cloyne.org
  dns:
    ipv4:
      - 50.0.1.1
  interfaces:
    p1p1:
      ipv4:
        - type: static
          address: 192.168.88.13
          netmask: 255.255.255.0
          gateway: 192.168.88.1
mailer:
  other_hostnames: server3.cloyne.org
  local_interfaces: 127.0.0.1 ; ::1
  relay: mail.cloyne.org
  root_alias:
    - clonm@bsc.coop
    - mitar.cloyne@tnode.com

network:
  system:
    hostname: server1
    fqdn: server1.cloyne.org
  dns:
    ipv4:
      - 50.0.1.1
  interfaces:
    eth0:
      ipv4:
        - type: static
          address: 192.168.88.11
          netmask: 255.255.255.0
          gateway: 192.168.88.1
mailer:
  other_hostnames: server1.cloyne.org
  local_interfaces: 127.0.0.1 ; ::1
  relay: mail.cloyne.org
  root_alias:
    - clonm@bsc.coop
    - mitar.cloyne@tnode.com

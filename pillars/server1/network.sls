network:
  system:
    hostname: server1
    fqdn: server1.cloyne.org
  dns:
    ipv4:
      - 216.218.196.2
  interfaces:
    eth0:
      ipv4:
        - type: static
          address: 64.62.133.43
          netmask: 255.255.255.248
          gateway: 64.62.133.41
mailer:
  other_hostnames: server1.cloyne.org
  local_interfaces: 127.0.0.1 ; ::1
  relay: mail.cloyne.org
  root_alias:
    - clonm@bsc.coop
    - mitar.cloyne@tnode.com

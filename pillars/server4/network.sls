network:
  system:
    hostname: server4
    fqdn: server4.cloyne.org
  dns:
    ipv4:
      - 8.8.8.8
  interfaces:
    ens3:
      ipv4:
        - type: static
          address: 208.113.134.114
          netmask: 255.255.248.0
          gateway: 208.113.128.1
mailer:
  other_hostnames: server4.cloyne.org
  local_interfaces: 127.0.0.1 ; ::1
  relay: mail.cloyne.org
  root_alias:
    - clonm@bsc.coop
    - closoft@bsc.coop

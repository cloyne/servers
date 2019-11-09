network:
  system:
    hostname: server4
    fqdn: server4.cloyne.org
  dns:
    ipv4:
      - 216.218.196.2
  interfaces:
    eth0:
      ipv4:
        - type: static
          address: 192.81.216.6
          netmask: 255.255.255.0
          gateway: 192.81.216.1
mailer:
  other_hostnames: server4.cloyne.org
  local_interfaces: 127.0.0.1 ; ::1
  relay: mail.cloyne.org
  root_alias:
    - clonm@bsc.coop

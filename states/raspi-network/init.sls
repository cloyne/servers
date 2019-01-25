/etc/dhcpcd.conf:
  file.managed:
    - source: salt://raspi-network/dhcpcd.conf
    - template: jinja
    - mode: 644
    - user: root
    - group: root

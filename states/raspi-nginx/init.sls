nginx:
  pkg:
    - latest

/etc/nginx/sites-available/default:
  file.managed:
    - source: salt://raspi-nginx/proxy
    - template: jinja
    - mode: 644
    - user: root
    - group: root

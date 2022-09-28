docker.version: auto

include:
# - server4.docker.dns
# - server4.docker.iperf
  - server4.docker.pgsql
# - server4.docker.mysql
  - server4.docker.web
# - server4.docker.phpmyadmin
  - server4.docker.phppgadmin
# - server4.docker.blog
  - server4.docker.mail
  - server4.docker.sympa
# - server4.docker.backup
  # TODO: Fix radio to work with new version of ownCloud and re-enable.
  #- server4.docker.radio

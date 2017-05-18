docker.version: auto

include:
  - server2.docker.dns
  - server2.docker.iperf
  - server2.docker.pgsql
  - server2.docker.mysql
  - server2.docker.web
  - server2.docker.phpmyadmin
  - server2.docker.phppgadmin
  - server2.docker.blog
  - server2.docker.mail
  - server2.docker.sympa
  # TODO: Fix radio to work with new version of ownCloud and re-enable.
  #- server2.docker.radio

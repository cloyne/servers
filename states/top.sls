base:
  server*:
    - core
    - network
    - mailer
    - smart
    - logwatch
    - pip
    - docker.base
    - docker.containers
  
  server[2-3]:
    - mdadm

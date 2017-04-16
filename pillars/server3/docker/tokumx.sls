docker:
  containers:
    tokumx:
      image: wlanslovenija/tokumx
      network_mode:
        name: server3.cloyne.org
      environment:
        TOKUMX_ARGS: --cacheSize 8G --directio
      sysfs:
        kernel.mm.transparent_hugepage.enabled: never
      volumes:
        /srv/storage/tokumx:
          bind: /var/lib/tokumx
          user: 102
          group: 105
        /srv/log/tokumx:
          bind: /var/log/tokumx
          user: nobody
          group: nogroup

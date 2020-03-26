docker:
  containers:
    minecraft:
      image: itzg/minecraft-server
      network_mode:
        name: server3.cloyne.org
      environment:
        EULA: "TRUE"
        CONSOLE: "true"
        ENABLE_RCON: "false"
      ports:
        25565/tcp:
          ip:
            type: pillar
            key: network:interfaces:p1p1:ipv4:0:address
          port: 25565
      volumes:
        /srv/storage/minecraft/data:
          bind=/data

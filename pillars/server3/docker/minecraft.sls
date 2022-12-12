docker:
  containers:
    minecraft:
      image: itzg/minecraft-server
      network_mode:
        name: server3.cloyne.org
      environment:
        EULA: "TRUE"
        CONSOLE: "TRUE"
        ENABLE_RCON: "FALSE"
        ONLINE_MODE: "FALSE"
        MOTD: "Cloyne's own Minecraft server!"
        ICON: "/data/icon.png"
        TYPE: "PAPER"
        USE_AIKAR_FLAGS: "TRUE"
        VERSION: 1.19.3
      ports:
        25565/tcp:
          ip:
            type: pillar
            key: network:interfaces:p1p1:ipv4:0:address
          port: 25565
      volumes:
        /srv/storage/minecraft/data:
          bind: /data

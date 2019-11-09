#!yaml|gpg
docker:
  containers:
    postgresql:
      image: clonm/postgresql
      tag: "10"
      network_mode:
        name: server4.cloyne.org
      volumes:
        /srv/storage/postgresql:
          bind: /var/lib/postgresql
          user: 102
          group: 106
        /srv/log/postgresql:
          bind: /var/log/postgresql
          user: nobody
          group: nogroup
      environment:
        - postgresql
  environments:
    postgresql:
      PGSQL_ROLE_1_USERNAME: nodewatcher
      PGSQL_ROLE_1_PASSWORD: |
        -----BEGIN PGP MESSAGE-----
        Version: GnuPG v1

        hQMOA3gVyCOtuwFXEAv/f5v2MVew6GKeJDoZ9lG4BwZPiZ7FU214QlkNiKMjfyt1
        IXfFNgLYNneJhjwXQTw1XE38agDc8rRV9hgORmX0yHF1p9GgcDcCpxPncn/gEDKB
        Oqb8bPiaUZjaTbPICf/3R8v71oS7gqf2szXInOxgYIaCJ9FOSGwZvZpBgMgXeAxh
        oLPPzWK+aNydnRZjzF+sKXLrkYZhUCS8mXQ5PAFKHzRU4C08n3mKogITPZuc8AO3
        2jpt0G0H3EGqGIVuMJAtl6EFAapZ5rMmXo7nPv7k7YFydO+d8EcsQ+D7vZfe5wHn
        SXFmO6cnDvsTaiFFjeh1iLalWcHUMAA3O7DfFep2TxQHTdPl4LyXgwoi8M9R2nmf
        /1NM2UcuaR+v3cCylwRLw6LT0SL3nmct72XkfxwWf3UKtJXpKqkuFHQUykjI+eIv
        s4cb81hJ3z4uzQPkgk/NQf3l8WYAWAHVFK66X5gK5U3DJa+YnVcVST2GpNseTyIA
        0VzmHxAEU7S3UMAs3dwsDACGWgyR1sp8smrarCKavNgncejidHRPHTjvYXnPYim+
        wTsRQs7HBZbGrswoW7fwAsdaLZGC1rTKxaQFIE74EJHF4C2asWFi22sa5ahfdEtE
        mHjBsomDZmAoGhv3FjHlYyIODHClt843zL1rk4nNDRFl6Y0nCXVCMVLTsenjzoiX
        tkAF9RBIazVaYrTdDib03LAO6BVAPM3AR1M1I90kTPBaWR4hZOj5+NGGiOzgLFHE
        xS5+mnA4+Om5+gEYh0Lxi7862pghvwtfD8z7wktG9ZSuQYkX5ouji4fabmWQzhsL
        6yXERMv+lp9F3XJuPTJrInIsHxM8dRVggoWDaQ4WhYYOtw4y6eqei53u45B6WTi5
        fxPwwrY0m5IhvZEffp1+bnVXwqqRCs7+gB5/tslzI6rzMP30qSf2jd3z0LvRPFba
        u8RutmxY1V/Xx3tBVzfyTGLVc4TKPsZL+LuYvEWyEsQjwcQ9pHeIQx/A9Gj/7uoy
        t2RnVgkX1Ph8n/Copj603n3SUAETvPIlJuxJ4pR/dF0Yb4VSRJb27US1vIDFNayh
        6ZkbpcH+R+qBIpybjaMG9PZ/AJ+BEmygZSHl4cmYDDzq2Wno2h3+6AqG30XH6doA
        5zW9
        =vhO8
        -----END PGP MESSAGE-----
      PGSQL_ROLE_1_FLAGS: LOGIN
      PGSQL_DB_1_NAME: nodewatcher
      PGSQL_DB_1_OWNER: nodewatcher
      PGSQL_DB_1_ENCODING: UNICODE
      PGSQL_DB_1_POSTGIS: true

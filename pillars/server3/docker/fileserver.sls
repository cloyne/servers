#!yaml|gpg
docker:
  containers:
    nodewatcher-fileserver:
      image: wlanslovenija/scp-server
      environment:
        - FILESERVER_PUBLIC_KEY: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDDmvenEu4CM+6/NgW67xBhL8j/SSdAKvTsyuNiw40DwWUOTjdULweuNdR/g7/5GWTc9VZcIfzvHyFxjq9dgnyVxqowQRkfvhvQQaajQ5oc8a+HTuPRQjRHnCtj8r1Bzps5dzn9IQxdUNH4lhmdcSH04xrOiaP5rxE9GsoDBQVfPn3FCp7tXr9AV+sSYqOk9ralk2/KSBg+qF82yktAsf64NARbShT9wsj/NCrFaeiEzCvMnGDcdlVebtaTKtjUAWqa+zj3CbgVhjDpXugzhO1oVeov7PYzgI7yHBrn5tV8tow5gAkG8R4bQOYkphr7qo/QqiWO0a6a2as/ZW03NJ1n nodeupgrade@cloyne.org
      ports:
        28932/tcp:
          ip: 10.20.32.11
          port: 28932
      volumes:
        /srv/storage/nodewatcher/fileserver-keys:
          bind: /etc/ssh/keys
          mode: 700
        /srv/storage/nodewatcher/media:
          type: other
          bind: /readonly/files
          readonly: true

# docker-backup
Container exposing readonly volumes and listening on ssh for backup purpose
You can then use rsync to access the container or use
https://github.com/gnibu/snapshot-backup


Here is a sample docker-compose.yml that will instanciate a container

          backup:
            build: .
            ports:
                - "444:22"
            volumes:
                - /etc:/backup/etc:ro
                - /root:/backup/root:ro
                - /home:/backup/home:ro
                - /var:/backup/var:ro
                - /data:/backup/data:ro
                - authorized_keys2:/root/authorized_keys2

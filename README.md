# Nextcloud

Run [Nextcloud](https://nextcloud.com/) with a PostgreSQL DB on your Raspberry Pi 3 using docker.
This config runs out of the box. For more information about the config via environment variables, configurable volumes etc. see the official [documentation on Docker Hub](https://hub.docker.com/_/nextcloud/).

## Requirements
* [Install docker](https://www.raspberrypi.org/blog/docker-comes-to-raspberry-pi/)
* [Install docker-compose](docker-compose)
* WARNING: For Production use the Nextcloud should be behind a SSL Proxy

## How to
* Clone repo: `git clone git@github.com:polandy/rpi-nextcloud.git rpi-nextcloud`
* Change to git directory: `cd rpi-nextcloud`
* Change the value of `POSTGRES_PASSWORD` in `db.env`
* Start the containers in the background and leaves them running: `docker-compose up -d`
* Check the state of the containers: `docker ps`
* The Nexcloud should be running on Port 8080 now
* Setup your nextcloud in your browser: `<RPI-URL>:8080`


## About
This is a collection of scripts to prepare a transport and application layer lab inside a default topology mini-internet. These are specific for usage in the Computer Network Course's Lab in Brawijaya.
The scripts prefixed with "prepare" will perpare the environment such as:
* Copying access script (prepare-ssh.sh)
* Installing the necessary tools that's not yet included in base mini-internet (prepare-client and prepare-web). One might consider modifying the docker imaages instead so the installation part isn't necessary.

The "apk-server" and "apk-client" directories contains unmodified .apk file to be installed inside the containers.  These are necessary because the containers aren't connected to the internet. If newer version of the softwares are necessary you can grab new version using `apk fetch` from an alpine linux system

## Usage
1. Have a mini-internet running with default configuration
2. Clone the repository
3. Run all the `prepare-*.sh` scripts
   1. `prepare-web.sh` takes exactly one argument which is the server you want to install a webserver on
   2. `prepare-client.sh` by default installs on all container in the AS



Sementara
setup curl:
sudo curl -L   https://github.com/moparisthebest/static-curl/releases/latest/download/curl-amd64   -o /opt/curl-static

sudo chmod +x /opt/curl-static

for c in $(docker ps --format '{{.Names}}' --filter "ancestor=miniinterneteth/d_host"); do
  echo "Injecting curl into $c"
  docker cp /opt/curl-static "$c":/usr/local/bin/curl
  docker exec "$c" chmod +x /usr/local/bin/curl
done

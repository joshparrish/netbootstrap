docker pull macadmins/tftpd
docker pull bruienne/bsdpy:1.0

docker stop tftpd bsdpy
docker rm tftpd bsdpy

chmod -R 755 /usr/local/docker/web
IP=`ifconfig eno1 2>/dev/null|awk '/inet addr:/ {print $2}'|sed 's/addr://'`
echo $IP

docker run -d --name tftpd \
  -p 0.0.0.0:69:69/udp \
  -v /usr/local/docker/web:/nbi \
  --restart=always \
  macadmins/tftpd

docker run -d --name bsdpy \
  -p 0.0.0.0:67:67/udp \
  -v /usr/local/docker/web:/nbi \
  -e BSDPY_IP=147.97.68.110 \
  -e BSDPY_NBI_URL=http://147.97.68.42 \
  -e BSDPY_IFACE=eno1 \
  --restart=always \
  bruienne/bsdpy:1.0


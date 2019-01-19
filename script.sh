#!/bin/bash

mkdir grin
cd grin
wget https://github.com/mimblewimble/grin-miner/releases/download/v1.0.2/grin-miner-v1.0.2-480780314-linux-amd64.tgz
tar -xvzf grin-miner-v1.0.2-480780314-linux-amd64.tgz
rm grin-miner-v1.0.2-480780314-linux-amd64.tgz
cd grin-miner-v1.0.2
mv * ..
cd ..
rm grin-miner-v1.0.2
rm grin-miner.toml
wget https://raw.githubusercontent.com/god10145/grin/master/grin-miner.toml
sed -i "s/VAST/$VAST_CONTAINERLABEL/g" "grin-miner.toml"
cd ~
rm onstart.sh
touch onstart.sh
apt-get -y install screen
touch /root/onstart.sh
echo '#!/bin/bash
screen -dmS miner /root/grin/grin-miner' > /root/onstart.sh
chmod +x onstart.sh

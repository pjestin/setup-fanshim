echo 'Installing Python 3'
sudo apt install git python3-pip

echo 'Cloning Pimoroni Python repo'
git clone https://github.com/pimoroni/fanshim-python.git /tmp/fanshim-python

echo 'Installing fanshim dependencies'
cd /tmp/fanshim-python
sudo ./install.sh

echo 'Installing systemctl service'
cd examples
sudo ./install-service.sh --on-threshold 60 --off-threshold 50 --delay 2

echo 'Setting up standalone python script'
mkdir -p ~/.local/bin
cp /tmp/fanshim-python/examples/automatic.py ~/.local/bin/fanshim.py
sudo sed -i '/WorkingDirectory/d' /etc/systemd/system/pimoroni-fanshim.service
sudo sed -i 's/python3 .*\/automatic\.py/python3 ~\/\.local\/bin\/fanshim\.py/' /etc/systemd/system/pimoroni-fanshim.service

echo 'Cleaning'
sudo rm -rf /tmp/fanshim-python
sudo systemctl daemon-reload
sudo systemctl restart pimoroni-fanshim

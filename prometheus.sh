
#安装监控
sudo apt install -y prometheus
sudo apt install -y prometheus-node-exporter
sudo systemctl enable prometheus
sudo systemctl enable prometheus-node-exporter
sudo wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
echo "deb https://packages.grafana.com/oss/deb stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
sudo apt-get update
sudo apt install -y grafana
sudo systemctl start grafana-server
sudo systemctl enable grafana-server

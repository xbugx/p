curl -O ~/Download/ https://github.com/prometheus/node_exporter/releases/download/v1.4.0/node_exporter-1.4.0.darwin-amd64.tar.gz
cd ~/Download
tar -xzf node_exporter-1.4.0.darwin-amd64.tar.gz
mkdir -p /usr/local/bin
cp -n node_exporter-1.4.0.darwin-amd64/node_exporter /usr/local/bin/

curl -O  ~/Download/ https://raw.githubusercontent.com/prometheus/node_exporter/master/examples/launchctl/io.prometheus.node_exporter.plist -O /Library/LaunchDaemons/io.prometheus.node_exporter.plist

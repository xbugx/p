curl -o ~/Downloads/node_exporter-1.9.0.darwin-amd64.tar.gz -L https://github.com/prometheus/node_exporter/releases/download/v1.9.0/node_exporter-1.9.0.darwin-amd64.tar.gz
cd ~/Downloads
tar -xzf node_exporter-1.9.0.darwin-amd64.tar.gz
mkdir -p /usr/local/bin
cp -n node_exporter-1.9.0.darwin-amd64/node_exporter /usr/local/bin/

cat > /Library/LaunchDaemons/io.prometheus.node_exporter.plist <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Label</key>
  <string>io.prometheus.node_exporter</string>
  <key>ProgramArguments</key>
  <array>
    <string>sh</string>
    <string>-c</string>
    <string>/usr/local/bin/node_exporter</string>
  </array>
  <key>UserName</key>
  <string>root</string>
  <key>GroupName</key>
  <string>wheel</string>
  <key>RunAtLoad</key>
  <true/>
  <key>KeepAlive</key>
  <false/>
  <key>WorkingDirectory</key>
  <string>/usr/local</string>
  <key>StandardErrorPath</key>
  <string>/tmp/node_exporter.log</string>
  <key>StandardOutPath</key>
  <string>/tmp/node_exporter.log</string>
  <key>HardResourceLimits</key>
  <dict>
    <key>NumberOfFiles</key>
    <integer>4096</integer>
  </dict>
  <key>SoftResourceLimits</key>
  <dict>
    <key>NumberOfFiles</key>
    <integer>4096</integer>
  </dict>
</dict>
</plist>
EOF
#curl -o /Library/LaunchDaemons/io.prometheus.node_exporter.plist https://raw.githubusercontent.com/prometheus/node_exporter/master/examples/launchctl/io.prometheus.node_exporter.plist
chown root:wheel /Library/LaunchDaemons/io.prometheus.node_exporter.plist

launchctl bootstrap system/ /Library/LaunchDaemons/io.prometheus.node_exporter.plist

echo "🔧 نصب neon-dream-42..."

bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install

cp config.json /usr/local/etc/xray/config.json

\systemctl restart xray
echo "✅ نصب کامل شد! پروکسی روی پورت 10808 (SOCKS) و 10809 (HTTP) فعال شد"

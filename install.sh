echo "🔧 نصب neon-dream-42..."

# نصب Xray
bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install

# کپی کانفیگ
cp config.json /usr/local/etc/xray/config.json

# اجرا
systemctl restart xray
echo "✅ نصب کامل شد! پروکسی روی پورت 10808 (SOCKS) و 10809 (HTTP) فعال شد"

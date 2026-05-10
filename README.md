# 🌙 NEON-DREAM-42

<p align="center">
  <img src="https://img.shields.io/badge/Version-1.0.0-blue.svg" alt="Version">
  <img src="https://img.shields.io/badge/License-Proprietary-red.svg" alt="License">
  <img src="https://img.shields.io/badge/Platform-Linux%20%7C%20macOS%20%7C%20WSL-lightgrey.svg" alt="Platform">
  <img src="https://img.shields.io/badge/Powered%20by-XrayCore-brightgreen.svg" alt="Powered by Xray">
</p>

<p align="center">
  <b>🔒 محصول اختصاصی | کپی و بازنشر ممنوع 🔒</b><br>
  <b>© 2026 تمامی حقوق مادی و معنوی محفوظ است</b>
</p>

---

## 📖 درباره پروژه

**NEON-DREAM-42** یک کانفیگ حرفه‌ای و بهینه‌شده برای اتصال به اینترنت آزاد و دسترسی به یوتیوب و سایر سرویس‌های خارجی می‌باشد. این پروژه با استفاده از **Xray-core** و تکنیک‌های پیشرفته‌ای مانند **Fragmentation** و **Domain Fronting** طراحی شده است.

### ✨ ویژگی‌های کلیدی

| ویژگی | توضیح |
|-------|-------|
| 🚀 **سرعت بالا** | بهینه‌سازی شده برای کمترین میزان لگ و تاخیر |
| 🛡️ **Fragmentation** | تکه‌تکه کردن پکت‌ها برای عبور از فیلترهای عمیق |
| 🔄 **Mux پشتیبانی** | مدیریت همزمان چندین کانکشن |
| 📡 **DNS over HTTPS** | درخواست‌های DNS رمزنگاری شده از طریق کلودفلر |
| 🧩 **Domain Strategy UseIP** | استراتژی بهینه برای رزولوشن دامنه |
| 🔌 **پشتیبانی از SOCKS5 & HTTP** | پروکسی هم روی پورت 10808 و هم 10809 |

---

## 📋 پیش‌نیازها

قبل از نصب، مطمئن شوید موارد زیر را دارید:

- ✅ **سیستم‌عامل:** لینوکس (Ubuntu/Debian/CentOS)، macOS یا WSL در ویندوز
- ✅ **دسترسی روت (sudo)** برای نصب سرویس
- ✅ **اتصال به اینترنت** برای دانلود Xray-core
- ✅ **حداقل 50 مگابایت** فضای خالی

---

## 🚀 نصب سریع (یک خطی)

```bash
git clone https://github.com/YOUR-USERNAME/neon-dream-42.git && cd neon-dream-42 && sudo bash install.sh
⚠️ توجه: دستورات را با sudo اجرا کنید چون نیاز به دسترسی سیستمی دارید.

📝 نصب مرحله به مرحله
مرحله 1: کلون کردن پروژه
bash
git clone https://github.com/YOUR-USERNAME/neon-dream-42.git
cd neon-dream-42
مرحله 2: اجرای اسکریپت نصب
bash
chmod +x *.sh
sudo bash install.sh
مرحله 3: بررسی وضعیت سرویس
bash
sudo bash status.sh
مرحله 4: تست اتصال
bash
curl -x socks5://127.0.0.1:10808 https://www.youtube.com
⚙️ تنظیمات در برنامه‌های مختلف
🌐 مرورگرها
Google Chrome / Brave / Edge
bash
# اجرای مرورگر با پروکسی خودکار
google-chrome --proxy-server="socks5://127.0.0.1:10808"
Firefox
رفتن به Settings → Network Settings

انتخاب Manual proxy configuration

تنظیم SOCKS Host: 127.0.0.1 و Port: 10808

انتخاب SOCKS v5 و تیک Proxy DNS when using SOCKS

📱 تلگرام دسکتاپ
text
Settings → Advanced → Connection Type → Custom Proxy
Type: SOCKS5
Host: 127.0.0.1
Port: 10808
🖥️ سیستم‌عامل (تنظیمات سیستمی)
Linux (Ubuntu/Debian)
bash
# تنظیم پروکسی موقت
export http_proxy="http://127.0.0.1:10809"
export https_proxy="http://127.0.0.1:10809"
Windows (با WSL)
powershell
netsh winhttp set proxy 127.0.0.1:10809
📊 دستورات مدیریتی
دستور	توضیح
sudo bash start.sh	شروع کردن پروکسی
sudo bash stop.sh	توقف پروکسی
sudo bash status.sh	مشاهده وضعیت سرویس
sudo systemctl restart xray	ریستارت کامل سرویس
sudo journalctl -u xray -f	مشاهده لاگ‌های لحظه‌ای
🔧 تنظیمات پیشرفته
تغییر پورت‌های پروکسی
فایل config.json را ویرایش کنید:

json
"inbounds": [
  {
    "port": 10808,  // پورت SOCKS - این عدد را تغییر دهید
    "protocol": "socks"
  },
  {
    "port": 10809,  // پورت HTTP - این عدد را تغییر دهید
    "protocol": "http"
  }
]
سپس سرویس را ریستارت کنید:

bash
sudo systemctl restart xray
فعال کردن Mux (اتصال همزمان)
در بخش outbounds مقدار enabled را به true تغییر دهید:

json
"mux": {
  "concurrency": 8,
  "enabled": true
}
🐛 رفع مشکلات رایج
مشکل 1: پورت 10808 قبلاً استفاده می‌شود
bash
# بررسی پورت‌های اشغال شده
sudo lsof -i :10808
sudo lsof -i :10809

# تغییر پورت در config.json یا kill کردن پروسه قبلی
sudo kill -9 [PID]
مشکل 2: سرویس Xray بالا نمی‌آید
bash
# بررسی لاگ‌ها
sudo journalctl -u xray -n 50 --no-pager

# بررسی سینتکس کانفیگ
xray run -test -config config.json
مشکل 3: اتصال قطع می‌شود یا کند است
bash
# افزایش Timeout در config.json
"policy": {
  "levels": {
    "8": {
      "connIdle": 600,  // افزایش از 300 به 600
      "handshake": 10
    }
  }
}
مشکل 4: DNS کار نمی‌کند
bash
# تست مستقیم DNS
nslookup youtube.com 127.0.0.1

# یا
dig @127.0.0.1 youtube.com
🛡️ نکات امنیتی
⚠️ این نکات را جدی بگیرید!

🔐 هرگز کانفیگ خود را با دیگران به اشتراک نگذارید

🌐 از پروکسی فقط برای سایت‌های قانونی استفاده کنید

🖥️ روی سیستم‌های عمومی از این پروکسی استفاده نکنید

📱 در صورت استفاده از موبایل، حتماً از VPN معتبر کنار آن استفاده کنید

🔄 هر ماه یکبار UUID خود را تغییر دهید


⚖️ قوانین و مجوز
<div align="center">
ممنوعیت	مجاز
❌ کپی و بازنشر	✅ استفاده شخصی
❌ فروش کانفیگ	✅ تغییر برای شخصی
❌ ادعای مالکیت	✅ اشتراک لینک با ذکر منبع
❌ انتشار با نام دیگر	✅ گزارش باگ و مشکل
</div>
هرگونه تخلف از قوانین بالا، شرعاً و قانوناً قابل پیگرد می‌باشد.

🙏 تشکر و قدردانی
از همه کسانی که در بهبود این پروژه کمک می‌کنند سپاسگزاریم. ویژه تشکر از:

تیم Xray-core برای ارائه این ابزار قدرتمند

همه کاربرانی که با گزارش باگ‌ها کمک می‌کنند

📅 تاریخچه نسخه‌ها
نسخه	تاریخ	تغییرات
1.0.0	2025	انتشار اولیه با قابلیت Fragment و DNS over HTTPS
1.0.1	آینده	اضافه شدن قابلیت Auto-Update
<p align="center"> <b>🌟 اگر این پروژه برای شما مفید بود، با یک ⭐ در گیت‌هاب از آن حمایت کنید 🌟</b><br> <b>🔒 NEON-DREAM-42 | کلیه حقوق محفوظ است 🔒</b> </p> ```

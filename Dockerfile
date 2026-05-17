FROM python:3.10-slim

# تثبيت أداة لتشغيل واجهة الويب ومكتبات البايثون
RUN apt-get update && apt-get install -y npm && npm install -g node-static
WORKDIR /app

# نسخ جميع ملفات المشروع داخل السيرفر
COPY . /app

# تثبيت المكتبات الموجودة في ملف requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# فتح المنفذ الخاص بالواجهة لكي تظهر الأسعار
EXPOSE 8080

# الأمر النهائي لتشغيل واجهة الويب وملف البايثون start.py معاً
CMD node-static -p 8080 & python start.py

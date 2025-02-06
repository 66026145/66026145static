# ใช้ base image ที่เหมาะสมกับการใช้งานของโปรเจค (ตัวอย่างนี้ใช้ Nginx สำหรับ static files)
FROM nginx:alpine

# ตั้งค่า directory ที่ใช้ภายใน container
WORKDIR /usr/share/nginx/html

# Copy โฟลเดอร์ที่มีไฟล์ index.html ไปยัง container
COPY . .

# เปิด port ที่ใช้สำหรับ Nginx (โดยปกติแล้ว Nginx จะใช้ port 80)
EXPOSE 80

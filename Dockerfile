FROM alpine:latest

ARG PB_VERSION=0.35.1

RUN apk add --no-cache \
    unzip \
    ca-certificates \
    bash

# ตั้งค่า Directory ทำงาน
WORKDIR /pb

# ดาวน์โหลดและแตกไฟล์ PocketBase
ADD https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip /tmp/pb.zip
RUN unzip /tmp/pb.zip -d /pb/ && rm /tmp/pb.zip

# ให้สิทธิ์การรันไฟล์
RUN chmod +x /pb/pocketbase

# เปิด Port 8080
EXPOSE 8080

# คำสั่งรัน: 
# 1. พยายามสร้าง admin จาก Environment Variable (ถ้ามี และถ้ายังไม่เคยมี admin ระบบจะสร้างให้)
# 2. || true คือถ้าสร้างไม่สำเร็จ (เช่น มีอยู่แล้ว) ให้ข้ามไปทำคำสั่งถัดไปทันที ไม่ให้ค้าง
# 3. รัน PocketBase Serve ตามปกติ
CMD ["sh", "-c", "/pb/pocketbase admin create $PB_ADMIN_EMAIL $PB_ADMIN_PASSWORD || true; /pb/pocketbase serve --http=0.0.0.0:8080"]
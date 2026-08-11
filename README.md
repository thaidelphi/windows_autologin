# Windows Auto Login Configurator

โปรแกรมสำหรับตั้งค่า Auto Login เข้าสู่ระบบ Windows อย่างรวดเร็ว เขียนด้วยภาษา Pascal (Lazarus/Free Pascal) ทำงานผ่าน Command Line Interface (CLI) โดยจะทำการแก้ไข Registry ของ Windows เพื่อเปิดหรือปิดใช้งานระบบล็อกอินอัตโนมัติ

## 📌 ความต้องการของระบบ (Requirements)
* ระบบปฏิบัติการ: Windows
* สิทธิ์การใช้งาน: **ต้องคลิกขวาเลือก Run as administrator เท่านั้น** (เนื่องจากมีการแก้ไข `HKEY_LOCAL_MACHINE`)

## 🚀 วิธีการใช้งาน (Usage)

คุณสามารถใช้งานโปรแกรมได้ 2 รูปแบบคือแบบโต้ตอบ (Interactive) และแบบผ่าน Command Line

### รูปแบบที่ 1: การใช้งานแบบถาม-ตอบ (Interactive Mode) - *แนะนำ!*
เพียงแค่เปิดโปรแกรม `AutoLoginCLI.exe` ขึ้นมา (อย่าลืมคลิกขวา Run as administrator) โปรแกรมจะมีเมนูให้คุณเลือกใช้งานอย่างง่ายดาย:
1. โปรแกรมจะถามว่าคุณต้องการ **[E]nable** (เปิด) หรือ **[D]isable** (ปิด) Auto Login
2. หากคุณพิมพ์ `E` โปรแกรมจะถามให้คุณกรอก **Username**, **Password** และ **Domain** ทีละบรรทัด 

### รูปแบบที่ 2: การใช้งานผ่าน Command Line (CLI Mode)
เหมาะสำหรับการนำไปเขียนเป็น Script หรือ Batch file:

**การเปิดใช้งาน Auto Login (Enable)**
```cmd
AutoLoginCLI.exe enable <username> <password> [domain]
```
*ตัวอย่าง:* `AutoLoginCLI.exe enable admin 123456`

**การปิดใช้งาน Auto Login (Disable)**
```cmd
AutoLoginCLI.exe disable
```
คำสั่งนี้จะทำการปิดระบบ Auto Login และลบรหัสผ่านออกจาก Registry ทันทีเพื่อความปลอดภัย

## 🛠️ การ Compile โค้ด
หากต้องการนำโค้ดไปพัฒนาต่อหรือ Compile เอง สามารถทำได้ดังนี้:

1. ติดตั้ง [Lazarus IDE / Free Pascal](https://www.lazarus-ide.org/)
2. เปิดไฟล์ `AutoLoginCLI.lpr` ใน Lazarus
3. กด `F9` (Run) หรือ `Ctrl+F9` (Compile) เพื่อสร้างไฟล์ `.exe`

## ⚠️ คำเตือน (Warning)
* การเปิดใช้งาน Auto Login จะทำการบันทึกรหัสผ่านของคุณไว้ใน Registry ซึ่งอาจมีความเสี่ยงด้านความปลอดภัยในกรณีที่มีผู้ใช้คนอื่นเข้าถึงเครื่องคอมพิวเตอร์ของคุณได้ โปรดใช้ด้วยความระมัดระวัง

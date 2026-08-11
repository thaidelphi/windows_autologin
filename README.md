# Windows Auto Login Configurator

โปรแกรมสำหรับตั้งค่า Auto Login เข้าสู่ระบบ Windows อย่างรวดเร็ว เขียนด้วยภาษา Pascal (Lazarus/Free Pascal) ทำงานผ่าน Command Line Interface (CLI) โดยจะทำการแก้ไข Registry ของ Windows เพื่อเปิดหรือปิดใช้งานระบบล็อกอินอัตโนมัติ

## 📌 ความต้องการของระบบ (Requirements)
* ระบบปฏิบัติการ: Windows
* สิทธิ์การใช้งาน: **ต้องรันด้วยสิทธิ์ Administrator เท่านั้น** (เนื่องจากมีการแก้ไข `HKEY_LOCAL_MACHINE`)

## 🚀 วิธีการใช้งาน (Usage)

ดาวน์โหลดไฟล์ `AutoLoginCLI.exe` และเปิด Command Prompt (cmd) โดยคลิกขวาเลือก **Run as administrator** จากนั้นเรียกใช้คำสั่งดังนี้:

### 1. การเปิดใช้งาน Auto Login (Enable)
```cmd
AutoLoginCLI.exe enable <username> <password> [domain]
```
* **username**: ชื่อผู้ใช้งาน Windows
* **password**: รหัสผ่าน
* **domain**: (ตัวเลือก) ชื่อโดเมน หรือ ชื่อคอมพิวเตอร์ (หากไม่ได้อยู่ใน Domain ให้ละเว้นไว้)

**ตัวอย่าง:**
```cmd
AutoLoginCLI.exe enable admin 123456
```

### 2. การปิดใช้งาน Auto Login (Disable)
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

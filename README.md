# Lab10-WebAPI-DATA_BASE

API ตัวนี้คือ RESTful API ที่เขียนด้วย PHP + MySQL บน XAMPP โดยจะใช้ไฟล์เดียว (products.php) ในการรองรับการทำงานกับ สินค้า (Product)

และใช้ POSTMAN HTTP Methods (GET, POST, PUT, DELETE) เพื่อบอกว่าต้องการทำอะไร

ส่วนประกอบหลัก

การเชื่อมต่อฐานข้อมูล

$conn = new mysqli($host, $user, $pass, $db);

→ เชื่อมต่อไปที่ฐานข้อมูล laptop_shop และตาราง product

การอ่าน Method

$method = $_SERVER['REQUEST_METHOD'];

→ ตรวจว่า request ที่เข้ามาเป็น GET, POST, PUT หรือ DELETE

การอ่านพาธ (Path Info)

$request = explode("/", trim($_SERVER['PATH_INFO'] ?? '', "/"));
$id = $request[0] ?? null;

→ ถ้า URL เป็น /products.php/5 → $id = 5
→ ใช้สำหรับระบุสินค้าทีละตัว

📌 การทำงานของแต่ละ Method
1. GET
   
ถ้าไม่มี ID (/products.php)
→ ดึงสินค้าทั้งหมดจากฐานข้อมูล SELECT * FROM product
<img width="1002" height="842" alt="image" src="https://github.com/user-attachments/assets/47916eb8-102b-47c3-a32b-be91473f7a1d" />


ถ้ามี ID (/products.php/1)
→ ดึงสินค้าที่ product_id=1 จากฐานข้อมูล
<img width="1002" height="415" alt="image" src="https://github.com/user-attachments/assets/f15235e0-d8d0-4e5e-b97a-67336c1174a4" />


///ใช้สำหรับ ดูข้อมูลสินค้า

2. POST

รับ JSON จาก client เช่น:

<img width="1006" height="638" alt="image" src="https://github.com/user-attachments/assets/e2a68f76-5e16-4dae-85e3-0ae524a2f1ec" />


แปลง JSON → Array

สร้าง SQL INSERT INTO product ... เพื่อเพิ่มข้อมูล

///ใช้สำหรับ เพิ่มสินค้าใหม่///

3. PUT

URL ต้องมี ID เช่น /products.php/1

รับ JSON ที่ส่งมา เช่น:

<img width="1011" height="619" alt="image" src="https://github.com/user-attachments/assets/6d3df382-c380-4f47-b888-551ba597ba46" />

อัปเดตข้อมูลสินค้าที่ product_id=1 ด้วย UPDATE

///ใช้สำหรับ แก้ไขสินค้า///

4. DELETE

<img width="1014" height="503" alt="image" src="https://github.com/user-attachments/assets/412fdf14-1e08-41c2-8d82-bd77e5faf5fa" />


ทำการลบสินค้าตัวนั้นจากตาราง product

👉 ใช้สำหรับ ลบสินค้า


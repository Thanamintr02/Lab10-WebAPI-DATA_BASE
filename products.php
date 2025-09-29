<?php
// ตั้งค่าเชื่อมต่อ MySQL
$host = "localhost";
$user = "root"; // ค่าเริ่มต้นของ XAMPP
$pass = "";
$db   = "laptop_shop";

$conn = new mysqli($host, $user, $pass, $db);
if ($conn->connect_error) {
    die(json_encode(["error" => "Database connection failed"]));
}

// ตั้งค่า Header
header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
header("Access-Control-Allow-Headers: Content-Type");

$method = $_SERVER['REQUEST_METHOD'];
$request = explode("/", trim($_SERVER['PATH_INFO'] ?? '', "/"));
$id = $request[0] ?? null;

// ฟังก์ชันช่วยแปลง JSON → Array
function getInput() {
    return json_decode(file_get_contents("php://input"), true);
}

switch ($method) {
    case 'GET':
        if ($id) {
            // ดึงสินค้าตาม id
            $stmt = $conn->prepare("SELECT * FROM product WHERE product_id=?");
            $stmt->bind_param("i", $id);
            $stmt->execute();
            $result = $stmt->get_result()->fetch_assoc();
            echo json_encode($result ?: ["message" => "Product not found"]);
        } else {
            // ดึงสินค้าทั้งหมด
            $result = $conn->query("SELECT * FROM product");
            $products = [];
            while ($row = $result->fetch_assoc()) {
                $products[] = $row;
            }
            echo json_encode($products);
        }
        break;

    case 'POST':
        $data = getInput();
        if (!$data) { echo json_encode(["error" => "Invalid JSON"]); exit; }

        $stmt = $conn->prepare("INSERT INTO product (brand, model, specification, price, stock) VALUES (?, ?, ?, ?, ?)");
        $stmt->bind_param("sssdi", $data['brand'], $data['model'], $data['specification'], $data['price'], $data['stock']);
        $stmt->execute();
        echo json_encode(["message" => "Product added", "id" => $conn->insert_id]);
        break;

    case 'PUT':
        if (!$id) { echo json_encode(["error" => "Missing ID"]); exit; }
        $data = getInput();
        $stmt = $conn->prepare("UPDATE product SET brand=?, model=?, specification=?, price=?, stock=? WHERE product_id=?");
        $stmt->bind_param("sssdii", $data['brand'], $data['model'], $data['specification'], $data['price'], $data['stock'], $id);
        $stmt->execute();
        echo json_encode(["message" => "Product updated"]);
        break;

    case 'DELETE':
        if (!$id) { echo json_encode(["error" => "Missing ID"]); exit; }
        $stmt = $conn->prepare("DELETE FROM product WHERE product_id=?");
        $stmt->bind_param("i", $id);
        $stmt->execute();
        echo json_encode(["message" => "Product deleted"]);
        break;

    default:
        echo json_encode(["error" => "Method not allowed"]);
}
$conn->close();
?>

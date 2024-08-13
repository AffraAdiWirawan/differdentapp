<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *'); // Allow requests from any origin

// Database configuration
$servername = "localhost";
$username = "u223430490_Differdent";
$password = "Differ1234";
$dbname = "u223430490_AppDifferent";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    echo json_encode(['error' => 'Connection failed: ' . $conn->connect_error]);
    exit;
}

// Get UID from query parameter
$uid = $_GET['uid'] ?? '';
if (empty($uid)) {
    echo json_encode(['error' => 'UID is required']);
    exit;
}

// Prepare and execute the query
$sql = "
    SELECT username, nama_lengkap, NIK, email, namaanak
    FROM `User` 
    WHERE uid = ?
";

$stmt = $conn->prepare($sql);
if (!$stmt) {
    echo json_encode(['error' => 'Prepare failed: ' . $conn->error]);
    exit;
}

$stmt->bind_param('s', $uid); // Fixed parameter binding
$stmt->execute();
$result = $stmt->get_result();

$user = [];
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $user[] = $row;
    }
} else {
    echo json_encode(["error" => "No user found"]);
    $conn->close();
    exit();
}

echo json_encode($user);

$stmt->close();
$conn->close();
?>
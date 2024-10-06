<?php
header('Access-Control-Allow-Origin: http://localhost:3000');
try {
    $toDay = date('dmYHis');
    $backupPath = "backups/{$toDay}_DBbak.sql";
    $conn = new mysqli("localhost", "root", "", "book_db.sql");
    if ($conn->connect_error) {
        die(json_encode(array("es" => "error", "res" => "Connection failed: " . $conn->connect_error)));
    }
    $backupFile = fopen($backupPath, 'w');
    if (!$backupFile) {
        die(json_encode(array("es" => "error", "res" => "Failed to open backup file")));
    }
    $tablesResult = $conn->query("SHOW TABLES");
    while ($row = $tablesResult->fetch_array()) {
        $table = $row[0];
		fwrite($backupFile, "DROP TABLE IF EXISTS `$table`;\n");
        $createTableResult = $conn->query("SHOW CREATE TABLE $table");
        $createTableRow = $createTableResult->fetch_array();
        fwrite($backupFile, "\n\n" . $createTableRow[1] . ";\n\n");
        $rowsResult = $conn->query("SELECT * FROM $table");
        while ($row = $rowsResult->fetch_assoc()) {
            $values = array_map([$conn, 'real_escape_string'], array_values($row));
            $valuesList = "'" . implode("','", $values) . "'";
            fwrite($backupFile, "INSERT INTO $table VALUES ($valuesList);\n");
        }
    }
    fclose($backupFile);
    echo json_encode(array("es" => "success", "res" => "Database backed up successfully"));
} catch (Exception $e) {
    echo json_encode(array("es" => "error", "res" => "Exception occurred", "message" => $e->getMessage()));
}
?>

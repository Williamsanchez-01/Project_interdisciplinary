<?php
$host = 'localhost';
$dbname = 'construcao';
$username = 'root';
$password = 'root';

$conn = new mysqli($host, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Erro ao conectar ao banco de dados: " . $conn->connect_error);
}

echo "Conexão com o banco de dados MySQL realizada com sucesso!";

$conn->close();
?>

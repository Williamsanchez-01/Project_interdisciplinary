<?php
// Conexão com banco de dados
$host = 'localhost';
$db = 'estoque';
$user = 'root';
$pass = '';

$conn = new mysqli($host, $user, $pass, $db);

if ($conn->connect_error) {
  die('Erro de conexão: ' . $conn->connect_error);
}

$sql = "SELECT p.nome, c.nome AS categoria, p.quantidade_estoque AS estoque, 
               p.preco_unitario AS preco, f.nome AS fornecedor
        FROM Produto p
        JOIN Categoria c ON p.id_categoria = c.id
        JOIN Fornecedor f ON p.id_fornecedor = f.id";

$result = $conn->query($sql);
$produtos = [];

if ($result->num_rows > 0) {
  while ($row = $result->fetch_assoc()) {
    $produtos[] = $row;
  }
}
$conn->close();
header('Content-Type: application/json');
echo json_encode($produtos);
?>

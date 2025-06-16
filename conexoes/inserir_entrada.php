<?php
$host = 'localhost';
$dbname = 'construcao';
$username = 'root';
$password = 'root';

// Criar conexão
$conn = new mysqli($host, $username, $password, $dbname);

// Verificar conexão
if ($conn->connect_error) {
    die("Erro ao conectar ao banco de dados: " . $conn->connect_error);
}

// Obter dados do POST
$id_produto = $_POST['id_produto'] ?? null;
$quantidade = $_POST['quantidade'] ?? null;

if (!$id_produto || !$quantidade || $quantidade <= 0) {
    echo "Erro: Produto e quantidade válidos são obrigatórios.";
    exit;
}


// Inserir na tabela entradas_estoque
$stmt = $conn->prepare("INSERT INTO entradas_estoque (id_produto, quantidade) VALUES (?, ?)");
$stmt->bind_param("ii", $id_produto, $quantidade);

if (!$stmt->execute()) {
    echo "Erro ao inserir entrada no estoque: " . $stmt->error;
    $stmt->close();
    $conn->close();
    exit;
}
$stmt->close();

// Atualizar o estoque do produto
$stmtUpdate = $conn->prepare("UPDATE produtos SET estoque = estoque + ? WHERE id_produto = ?");
$stmtUpdate->bind_param("ii", $quantidade, $id_produto);

if (!$stmtUpdate->execute()) {
    echo "Erro ao atualizar estoque: " . $stmtUpdate->error;
} else {
    echo "Entrada registrada e estoque atualizado com sucesso!";
}

$stmtUpdate->close();
$conn->close();
?>

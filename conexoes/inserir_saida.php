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

// Dados recebidos do POST
$id_produto = $_POST['id_produto'] ?? null;
$quantidade = $_POST['quantidade'] ?? null;

if (!$id_produto || !$quantidade || $quantidade <= 0) {
    echo "Erro: Produto e quantidade válidos são obrigatórios.";
    exit;
}

// Verifica estoque atual
$stmtCheck = $conn->prepare("SELECT estoque FROM produtos WHERE id_produto = ?");
$stmtCheck->bind_param("i", $id_produto);
$stmtCheck->execute();
$result = $stmtCheck->get_result();
$produto = $result->fetch_assoc();
$stmtCheck->close();

if (!$produto) {
    echo "Produto não encontrado.";
    exit;
}

if ($produto['estoque'] < $quantidade) {
    echo "Erro: Estoque insuficiente.";
    exit;
}

// Insere na tabela saidas_estoque
$stmtInsert = $conn->prepare("INSERT INTO saidas_estoque (id_produto, quantidade) VALUES (?, ?)");
$stmtInsert->bind_param("ii", $id_produto, $quantidade);
if (!$stmtInsert->execute()) {
    echo "Erro ao registrar saída: " . $stmtInsert->error;
    $stmtInsert->close();
    $conn->close();
    exit;
}
$stmtInsert->close();

// Atualiza o estoque do produto
$stmtUpdate = $conn->prepare("UPDATE produtos SET estoque = estoque - ? WHERE id_produto = ?");
$stmtUpdate->bind_param("ii", $quantidade, $id_produto);
if (!$stmtUpdate->execute()) {
    echo "Erro ao atualizar estoque: " . $stmtUpdate->error;
} else {
    echo "Saída registrada e estoque atualizado com sucesso!";
}
$stmtUpdate->close();
$conn->close();
?>

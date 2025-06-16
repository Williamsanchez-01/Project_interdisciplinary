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
$nome = $_POST['nome'] ?? '';
$categoria = $_POST['categoria'] ?? null;
$estoque = $_POST['estoque'] ?? 0;
$preco = $_POST['preco'] ?? null;
$id_fornecedor = $_POST['id_fornecedor'] ?? null;

// Verificação de campo obrigatório
if (empty($nome)) {
    echo "Erro: nome do produto é obrigatório.";
    exit;
}

// Preparar e executar o INSERT
$stmt = $conn->prepare("INSERT INTO produtos (nome, categoria, estoque, preco, id_fornecedor) VALUES (?, ?, ?, ?, ?)");
if (!$stmt) {
    die("Erro na preparação da consulta: " . $conn->error);
}

// Associar parâmetros: s = string, i = inteiro, d = double
$stmt->bind_param("ssidi", $nome, $categoria, $estoque, $preco, $id_fornecedor);

// Executar e verificar
if ($stmt->execute()) {
    echo "Produto '$nome' inserido com sucesso!";
} else {
    echo "Erro ao inserir produto: " . $stmt->error;
}

// Fechar recursos
$stmt->close();
$conn->close();
?>

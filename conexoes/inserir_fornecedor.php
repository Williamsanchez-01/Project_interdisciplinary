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
$cnpj = $_POST['cnpj'] ?? '';
$telefone = $_POST['telefone'] ?? null;
$email = $_POST['email'] ?? null;

// Verificação de campos obrigatórios
if (empty($nome) || empty($cnpj)) {
    echo "Erro: nome e CNPJ são obrigatórios.";
    exit;
}

// Inserir fornecedor
$stmt = $conn->prepare("INSERT INTO fornecedores (nome, cnpj, telefone, email) VALUES (?, ?, ?, ?)");
if (!$stmt) {
    die("Erro na preparação da consulta: " . $conn->error);
}

// Associar parâmetros
$stmt->bind_param("ssss", $nome, $cnpj, $telefone, $email);

// Executar e verificar
if ($stmt->execute()) {
    echo "Fornecedor '$nome' inserido com sucesso!";
} else {
    echo "Erro ao inserir fornecedor: " . $stmt->error;
}

// Fechar recursos
$stmt->close();
$conn->close();
?>

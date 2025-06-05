<?php
// Configurações do banco de dados
$host = 'localhost';           // Ou IP do servidor MySQL
$dbname = 'nome_do_banco';     // Substitua pelo nome do seu banco
$username = 'seu_usuario';     // Substitua pelo usuário do banco
$password = 'sua_senha';       // Substitua pela senha do banco

try {
    // Criar uma conexão PDO com MySQL
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);

    // Definir o modo de erro para exceções
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    echo "Conexão com o banco de dados MySQL realizada com sucesso!";
} catch (PDOException $e) {
    echo "Erro ao conectar ao banco de dados: " . $e->getMessage();
    exit;
}
?>

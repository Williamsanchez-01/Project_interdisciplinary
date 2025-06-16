CREATE DATABASE construcao;
USE construcao;

-- Tabela de fornecedores
CREATE TABLE fornecedores (
    id_fornecedor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cnpj VARCHAR(20) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100)
);

-- Tabela de produtos
CREATE TABLE produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    estoque INT DEFAULT 0,
    preco DECIMAL(10,2),
    id_fornecedor INT,
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedores(id_fornecedor)
);

-- Tabela de entradas de estoque
CREATE TABLE entradas_estoque (
    id_entrada INT PRIMARY KEY AUTO_INCREMENT,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    data_entrada DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

-- Tabela de saídas de estoque
CREATE TABLE saidas_estoque (
    id_saida INT PRIMARY KEY AUTO_INCREMENT,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    data_saida DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);









-- -- INSERT INTO produtos (nome, categoria, estoque, preco, id_fornecedor)
-- VALUES
-- ("Cimento Votoran", "Cimento", 100, 32.50, (SELECT id_fornecedor FROM fornecedores WHERE nome = "Construfácil" LIMIT 1)),
-- ("Areia Média", "Areia", 200, 18.00, (SELECT id_fornecedor FROM fornecedores WHERE nome = "Areial do Zé" LIMIT 1)),
-- ("Brita 1", "Brita", 150, 22.50, (SELECT id_fornecedor FROM fornecedores WHERE nome = "Pedreira Boa Pedra" LIMIT 1)),
-- ("Tijolo Baiano", "Tijolos", 500, 0.80, (SELECT id_fornecedor FROM fornecedores WHERE nome = "Tijolaria São Jorge" LIMIT 1)),
-- ("Bloco de Concreto", "Blocos", 300, 2.50, (SELECT id_fornecedor FROM fornecedores WHERE nome = "Blocos & Cia" LIMIT 1)),
-- ("Cal Hidratada", "Cal", 120, 10.00, (SELECT id_fornecedor FROM fornecedores WHERE nome = "Químicos Vale Verde" LIMIT 1)),
-- ("Telha Cerâmica", "Telhas", 250, 3.20, (SELECT id_fornecedor FROM fornecedores WHERE nome = "Telhas Brasil" LIMIT 1)),
-- ("Viga de Aço", "Aço", 80, 45.00, (SELECT id_fornecedor FROM fornecedores WHERE nome = "Metalúrgica União" LIMIT 1)),
-- ("Tubo PVC 100mm", "Hidráulico", 180, 27.00, (SELECT id_fornecedor FROM fornecedores WHERE nome = "HidroCenter" LIMIT 1)),
-- ("Fio Elétrico 2,5mm", "Elétrico", 220, 1.90, (SELECT id_fornecedor FROM fornecedores WHERE nome = "EletroMais" LIMIT 1)),
-- ("Laje Treliçada", "Estrutura", 60, 85.00, (SELECT id_fornecedor FROM fornecedores WHERE nome = "Treliças do Brasil" LIMIT 1)),
-- ("Argamassa AC1", "Argamassa", 90, 22.90, (SELECT id_fornecedor FROM fornecedores WHERE nome = "Argamix" LIMIT 1)),
-- ("Porta de Madeira", "Acabamento", 40, 120.00, (SELECT id_fornecedor FROM fornecedores WHERE nome = "Portas Reais" LIMIT 1)),
-- ("Janela de Alumínio", "Acabamento", 70, 210.00, (SELECT id_fornecedor FROM fornecedores WHERE nome = "Alumix" LIMIT 1)),
-- ("Interruptor Simples", "Elétrico", 300, 5.50, (SELECT id_fornecedor FROM fornecedores WHERE nome = "Casa Elétrica" LIMIT 1)),
-- ("Torneira PVC", "Hidráulico", 130, 12.00, (SELECT id_fornecedor FROM fornecedores WHERE nome = "PlasCenter" LIMIT 1)),
-- ("Massa Corrida", "Acabamento", 110, 38.00, (SELECT id_fornecedor FROM fornecedores WHERE nome = "Tintas Real" LIMIT 1)),
-- ("Rolo de Pintura", "Ferramentas", 90, 15.00, (SELECT id_fornecedor FROM fornecedores WHERE nome = "Ferragens ABC" LIMIT 1)),
-- ("Parafuso 5mm", "Ferragens", 800, 0.10, (SELECT id_fornecedor FROM fornecedores WHERE nome = "Parafusos & Cia" LIMIT 1)),
-- ("Cano PVC 50mm", "Hidráulico", 160, 19.00, (SELECT id_fornecedor FROM fornecedores WHERE nome = "HidroCenter" LIMIT 1));

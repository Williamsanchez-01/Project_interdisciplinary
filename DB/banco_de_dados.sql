CREATE DATABASE construcao;
USE construcao;

-- Tabela de fornecedores
CREATE TABLE fornecedores (
    id_fornecedor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cnpj VARCHAR(14) UNIQUE NOT NULL,
    telefone VARCHAR(14),
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



INSERT INTO fornecedores (nome, cnpj, telefone, email) VALUES
("Construfácil", "12345678000101", "(13) 3234-1001", "contato@construfacil.com.br"),
("Areial do Zé", "12345678000202", "(13) 3222-2020", "vendas@areialdoze.com.br"),
("Pedreira Boa Pedra", "12345678000303", "(13) 3245-3030", "pedidos@boapedra.com"),
("Tijolaria São Jorge", "12345678000404", "(13) 3211-4040", "comercial@tijolosjorge.com.br"),
("Blocos & Cia", "12345678000505", "(13) 3255-5050", "atendimento@blocoscia.com.br"),
("Químicos Vale Verde", "12345678000606", "(13) 3266-6060", "quimicos@valeverde.com"),
("Telhas Brasil", "12345678000707", "(13) 3277-7070", "sac@telhasbrasil.com.br"),
("Metalúrgica União", "12345678000808", "(13) 3288-8080", "contato@metalunic.com"),
("HidroCenter", "12345678000909", "(13) 3299-9090", "suporte@hidrocenter.com"),
("EletroMais", "12345678001010", "(13) 3200-1010", "info@eletromais.com.br"),
("Treliças do Brasil", "12345678001111", "(13) 3212-1111", "vendas@trelicasbr.com"),
("Argamix", "12345678001212", "(13) 3223-1212", "contato@argamix.com.br"),
("Portas Reais", "12345678001313", "(13) 3234-1313", "sac@portasreais.com.br"),
("Alumix", "12345678001414", "(13) 3245-1414", "atendimento@alumix.com"),
("Casa Elétrica", "12345678001515", "(13) 3256-1515", "eletrica@casaelétrica.com.br"),
("PlasCenter", "12345678001616", "(13) 3267-1616", "comercial@plascenter.com"),
("Tintas Real", "12345678001717", "(13) 3278-1717", "sac@tintasreal.com.br"),
("Ferragens ABC", "12345678001818", "(13) 3289-1818", "vendas@ferragensabc.com"),
("Parafusos & Cia", "12345678001919", "(13) 3290-1919", "contato@parafusoscia.com.br");








INSERT INTO produtos (nome, categoria, quantidade_estoque, preco_unitario, id_fornecedor)
VALUES
("Cimento Votoran", "Cimento", 100, 32.50, (SELECT id_fornecedor FROM fornecedores WHERE nome = "Construfácil" LIMIT 1)),
("Areia Média", "Areia", 200, 18.00, (SELECT id_fornecedor FROM fornecedores WHERE nome = "Areial do Zé" LIMIT 1)),
("Brita 1", "Brita", 150, 22.50, (SELECT id_fornecedor FROM fornecedores WHERE nome = "Pedreira Boa Pedra" LIMIT 1)),
("Tijolo Baiano", "Tijolos", 500, 0.80, (SELECT id_fornecedor FROM fornecedores WHERE nome = "Tijolaria São Jorge" LIMIT 1)),
("Bloco de Concreto", "Blocos", 300, 2.50, (SELECT id_fornecedor FROM fornecedores WHERE nome = "Blocos & Cia" LIMIT 1)),
("Cal Hidratada", "Cal", 120, 10.00, (SELECT id_fornecedor FROM fornecedores WHERE nome = "Químicos Vale Verde" LIMIT 1)),
("Telha Cerâmica", "Telhas", 250, 3.20, (SELECT id_fornecedor FROM fornecedores WHERE nome = "Telhas Brasil" LIMIT 1)),
("Viga de Aço", "Aço", 80, 45.00, (SELECT id_fornecedor FROM fornecedores WHERE nome = "Metalúrgica União" LIMIT 1)),
("Tubo PVC 100mm", "Hidráulico", 180, 27.00, (SELECT id_fornecedor FROM fornecedores WHERE nome = "HidroCenter" LIMIT 1)),
("Fio Elétrico 2,5mm", "Elétrico", 220, 1.90, (SELECT id_fornecedor FROM fornecedores WHERE nome = "EletroMais" LIMIT 1)),
("Laje Treliçada", "Estrutura", 60, 85.00, (SELECT id_fornecedor FROM fornecedores WHERE nome = "Treliças do Brasil" LIMIT 1)),
("Argamassa AC1", "Argamassa", 90, 22.90, (SELECT id_fornecedor FROM fornecedores WHERE nome = "Argamix" LIMIT 1)),
("Porta de Madeira", "Acabamento", 40, 120.00, (SELECT id_fornecedor FROM fornecedores WHERE nome = "Portas Reais" LIMIT 1)),
("Janela de Alumínio", "Acabamento", 70, 210.00, (SELECT id_fornecedor FROM fornecedores WHERE nome = "Alumix" LIMIT 1)),
("Interruptor Simples", "Elétrico", 300, 5.50, (SELECT id_fornecedor FROM fornecedores WHERE nome = "Casa Elétrica" LIMIT 1)),
("Torneira PVC", "Hidráulico", 130, 12.00, (SELECT id_fornecedor FROM fornecedores WHERE nome = "PlasCenter" LIMIT 1)),
("Massa Corrida", "Acabamento", 110, 38.00, (SELECT id_fornecedor FROM fornecedores WHERE nome = "Tintas Real" LIMIT 1)),
("Rolo de Pintura", "Ferramentas", 90, 15.00, (SELECT id_fornecedor FROM fornecedores WHERE nome = "Ferragens ABC" LIMIT 1)),
("Parafuso 5mm", "Ferragens", 800, 0.10, (SELECT id_fornecedor FROM fornecedores WHERE nome = "Parafusos & Cia" LIMIT 1)),
("Cano PVC 50mm", "Hidráulico", 160, 19.00, (SELECT id_fornecedor FROM fornecedores WHERE nome = "HidroCenter" LIMIT 1));




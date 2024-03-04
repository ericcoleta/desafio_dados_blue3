CREATE TABLE IF NOT EXISTS clientes (
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    data_cadastro DATE NOT NULL,
    endereco VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS categorias (
    id_categoria SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT
);

CREATE TABLE IF NOT EXISTS produtos (
    id_produto SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    quantidade_estoque INT NOT NULL,
    id_categoria INT,
    descricao TEXT,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS pedidos (
    id_pedido SERIAL PRIMARY KEY,
    id_cliente INT NOT NULL,
    data_pedido DATE NOT NULL,
    valor_total DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS itens_pedido (
    id_item_pedido SERIAL PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido) ON DELETE CASCADE,
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto) ON DELETE CASCADE
);

-- Inserção de dados fictícios adicionais para clientes
INSERT INTO clientes (nome, email, telefone, data_cadastro, endereco) VALUES
('Ana Silva', 'ana.silva@example.com', '1122334455', '2023-07-20', 'Rua das Flores, 123, São Paulo, SP'),
('Bruno Martins', 'bruno.martins@example.com', '9988776655', '2023-07-21', 'Avenida Paulista, 1000, São Paulo, SP'),
('Carla Gomes', 'carla.gomes@example.com', '5566778899', '2023-07-22', 'Rua XV de Novembro, 187, Curitiba, PR'),
('Daniel Souza', 'daniel.souza@example.com', '4433221100', '2023-07-23', 'Setor Comercial Sul, Quadra 2, Brasília, DF'),
('Eduardo Oliveira', 'eduardo.oliveira@example.com', '1122334455', '2023-07-24', 'Rua das Flores, 123, São Paulo, SP'),
('Fernanda Santos', 'fernanda.santos@example.com', '9988776655', '2023-07-25', 'Avenida Paulista, 1000, São Paulo, SP'),
('Gabriel Pereira', 'gabriel.pereira@example.com', '5566778899', '2023-07-26', 'Rua XV de Novembro, 187, Curitiba, PR'),
('Heloísa Lima', 'heloisa.lima@example.com', '4433221100', '2023-07-27', 'Setor Comercial Sul, Quadra 2, Brasília, DF');

-- Inserção de dados fictícios adicionais para categorias
INSERT INTO categorias (nome, descricao) VALUES
('Eletrônicos', 'Dispositivos e aparelhos eletrônicos para diversas finalidades.'),
('Livros', 'Diversos gêneros de livros, incluindo literatura, técnicos e acadêmicos.'),
('Vestuário', 'Roupas e acessórios para todas as estações.'),
('Alimentos', 'Produtos alimentícios, incluindo perecíveis e não perecíveis.'),
('Esportes', 'Equipamentos e acessórios para práticas esportivas diversas.');

-- Inserção de dados fictícios adicionais para produtos
INSERT INTO produtos (nome, preco, quantidade_estoque, id_categoria, descricao) VALUES
('Smartphone XYZ', 1500.00, 25, (SELECT id_categoria FROM categorias WHERE nome = 'Eletrônicos'), 'Última geração de smartphones com câmera de alta resolução.'),
('Livro "A Arte da Guerra"', 45.00, 50, (SELECT id_categoria FROM categorias WHERE nome = 'Livros'), 'Clássico da literatura mundial sobre estratégia militar.'),
('Camiseta Polo', 80.00, 100, (SELECT id_categoria FROM categorias WHERE nome = 'Vestuário'), 'Camisetas polo de várias cores.'),
('Pacote de Arroz 5kg', 22.00, 200, (SELECT id_categoria FROM categorias WHERE nome = 'Alimentos'), 'Arroz branco de alta qualidade.'),
('Bicicleta de Montanha', 1200.00, 15, (SELECT id_categoria FROM categorias WHERE nome = 'Esportes'), 'Bicicleta preparada para trilhas e terrenos irregulares.'),
('Fone de Ouvido Bluetooth', 150.00, 40, (SELECT id_categoria FROM categorias WHERE nome = 'Eletrônicos'), 'Fones de ouvido sem fio com conexão Bluetooth.'),
('Livro "O Senhor dos Anéis"', 60.00, 30, (SELECT id_categoria FROM categorias WHERE nome = 'Livros'), 'Trilogia de J.R.R. Tolkien em edição de luxo.'),
('Calça Jeans', 120.00, 80, (SELECT id_categoria FROM categorias WHERE nome = 'Vestuário'), 'Calças jeans de vários tamanhos e modelos.'),
('Feijão 1kg', 5.00, 150, (SELECT id_categoria FROM categorias WHERE nome = 'Alimentos'), 'Feijão carioca de primeira qualidade.'),
('Bola de Futebol', 50.00, 20, (SELECT id_categoria FROM categorias WHERE nome = 'Esportes'), 'Bolas de futebol de vários tamanhos e marcas.');

-- Inserção de dados fictícios adicionais para pedidos
INSERT INTO pedidos (id_cliente, data_pedido, valor_total, status) VALUES
((SELECT id_cliente FROM clientes WHERE nome = 'Ana Silva'), '2023-08-01', 1570.00, 'Em processamento'),
((SELECT id_cliente FROM clientes WHERE nome = 'Bruno Martins'), '2023-08-02', 1625.00, 'Enviado'),
((SELECT id_cliente FROM clientes WHERE nome = 'Carla Gomes'), '2023-08-03', 1680.00, 'Entregue'),
((SELECT id_cliente FROM clientes WHERE nome = 'Daniel Souza'), '2023-08-04', 1735.00, 'Cancelado'),
((SELECT id_cliente FROM clientes WHERE nome = 'Eduardo Oliveira'), '2023-08-05', 1790.00, 'Em processamento'),
((SELECT id_cliente FROM clientes WHERE nome = 'Fernanda Santos'), '2023-08-06', 1845.00, 'Em processamento'),
((SELECT id_cliente FROM clientes WHERE nome = 'Gabriel Pereira'), '2023-08-07', 1900.00, 'Em processamento'),
((SELECT id_cliente FROM clientes WHERE nome = 'Heloísa Lima'), '2023-08-08', 1955.00, 'Em processamento'),
((SELECT id_cliente FROM clientes WHERE nome = 'Ana Silva'), '2023-08-09', 2010.00, 'Em processamento'),
((SELECT id_cliente FROM clientes WHERE nome = 'Bruno Martins'), '2023-08-10', 2065.00, 'Em processamento'),
((SELECT id_cliente FROM clientes WHERE nome = 'Carla Gomes'), '2023-08-11', 2120.00, 'Em processamento'),
((SELECT id_cliente FROM clientes WHERE nome = 'Daniel Souza'), '2023-08-12', 2175.00, 'Em processamento'),
((SELECT id_cliente FROM clientes WHERE nome = 'Eduardo Oliveira'), '2023-08-13', 2230.00, 'Em processamento'),
((SELECT id_cliente FROM clientes WHERE nome = 'Fernanda Santos'), '2023-08-14', 2285.00, 'Em processamento'),
((SELECT id_cliente FROM clientes WHERE nome = 'Gabriel Pereira'), '2023-08-15', 2340.00, 'Em processamento'),
((SELECT id_cliente FROM clientes WHERE nome = 'Heloísa Lima'), '2023-08-16', 2395.00, 'Em processamento'),
((SELECT id_cliente FROM clientes WHERE nome = 'Ana Silva'), '2023-08-17', 2450.00, 'Em processamento'),
((SELECT id_cliente FROM clientes WHERE nome = 'Ana Silva'), '2023-08-18', 2505.00, 'Em processamento'),
((SELECT id_cliente FROM clientes WHERE nome = 'Ana Silva'), '2023-08-19', 2560.00, 'Em processamento'),
((SELECT id_cliente FROM clientes WHERE nome = 'Carla Gomes'), '2023-08-20', 2615.00, 'Em processamento');


INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
((SELECT id_pedido FROM pedidos WHERE id_cliente = (SELECT id_cliente FROM clientes WHERE nome = 'Ana Silva') ORDER BY data_pedido DESC LIMIT 1), (SELECT id_produto FROM produtos WHERE nome = 'Smartphone XYZ'), 1, 1500.00),
((SELECT id_pedido FROM pedidos WHERE id_cliente = (SELECT id_cliente FROM clientes WHERE nome = 'Bruno Martins') ORDER BY data_pedido DESC LIMIT 1), (SELECT id_produto FROM produtos WHERE nome = 'Livro "A Arte da Guerra"'), 2, 45.00),
((SELECT id_pedido FROM pedidos WHERE id_cliente = (SELECT id_cliente FROM clientes WHERE nome = 'Carla Gomes') ORDER BY data_pedido DESC LIMIT 1), (SELECT id_produto FROM produtos WHERE nome = 'Camiseta Polo'), 3, 80.00),
((SELECT id_pedido FROM pedidos WHERE id_cliente = (SELECT id_cliente FROM clientes WHERE nome = 'Daniel Souza') ORDER BY data_pedido DESC LIMIT 1), (SELECT id_produto FROM produtos WHERE nome = 'Pacote de Arroz 5kg'), 4, 22.00),
((SELECT id_pedido FROM pedidos WHERE id_cliente = (SELECT id_cliente FROM clientes WHERE nome = 'Eduardo Oliveira') ORDER BY data_pedido DESC LIMIT 1), (SELECT id_produto FROM produtos WHERE nome = 'Bicicleta de Montanha'), 5, 1200.00),
((SELECT id_pedido FROM pedidos WHERE id_cliente = (SELECT id_cliente FROM clientes WHERE nome = 'Fernanda Santos') ORDER BY data_pedido DESC LIMIT 1), (SELECT id_produto FROM produtos WHERE nome = 'Fone de Ouvido Bluetooth'), 6, 150.00),
((SELECT id_pedido FROM pedidos WHERE id_cliente = (SELECT id_cliente FROM clientes WHERE nome = 'Gabriel Pereira') ORDER BY data_pedido DESC LIMIT 1), (SELECT id_produto FROM produtos WHERE nome = 'Livro "O Senhor dos Anéis"'), 7, 60.00),
((SELECT id_pedido FROM pedidos WHERE id_cliente = (SELECT id_cliente FROM clientes WHERE nome = 'Heloísa Lima') ORDER BY data_pedido DESC LIMIT 1), (SELECT id_produto FROM produtos WHERE nome = 'Calça Jeans'), 8, 120.00),
((SELECT id_pedido FROM pedidos WHERE id_cliente = (SELECT id_cliente FROM clientes WHERE nome = 'Ana Silva') ORDER BY data_pedido DESC LIMIT 1), (SELECT id_produto FROM produtos WHERE nome = 'Feijão 1kg'), 9, 5.00),
((SELECT id_pedido FROM pedidos WHERE id_cliente = (SELECT id_cliente FROM clientes WHERE nome = 'Bruno Martins') ORDER BY data_pedido DESC LIMIT 1), (SELECT id_produto FROM produtos WHERE nome = 'Bola de Futebol'), 10, 50.00),
((SELECT id_pedido FROM pedidos WHERE id_cliente = (SELECT id_cliente FROM clientes WHERE nome = 'Carla Gomes') ORDER BY data_pedido DESC LIMIT 1), (SELECT id_produto FROM produtos WHERE nome = 'Smartphone XYZ'), 11, 1500.00),
((SELECT id_pedido FROM pedidos WHERE id_cliente = (SELECT id_cliente FROM clientes WHERE nome = 'Daniel Souza') ORDER BY data_pedido DESC LIMIT 1), (SELECT id_produto FROM produtos WHERE nome = 'Livro "A Arte da Guerra"'), 12, 45.00),
((SELECT id_pedido FROM pedidos WHERE id_cliente = (SELECT id_cliente FROM clientes WHERE nome = 'Eduardo Oliveira') ORDER BY data_pedido DESC LIMIT 1), (SELECT id_produto FROM produtos WHERE nome = 'Camiseta Polo'), 13, 80.00),
((SELECT id_pedido FROM pedidos WHERE id_cliente = (SELECT id_cliente FROM clientes WHERE nome = 'Fernanda Santos') ORDER BY data_pedido DESC LIMIT 1), (SELECT id_produto FROM produtos WHERE nome = 'Pacote de Arroz 5kg'), 14, 22.00),
((SELECT id_pedido FROM pedidos WHERE id_cliente = (SELECT id_cliente FROM clientes WHERE nome = 'Gabriel Pereira') ORDER BY data_pedido DESC LIMIT 1), (SELECT id_produto FROM produtos WHERE nome = 'Bicicleta de Montanha'), 15, 1200.00),
((SELECT id_pedido FROM pedidos WHERE id_cliente = (SELECT id_cliente FROM clientes WHERE nome = 'Heloísa Lima') ORDER BY data_pedido DESC LIMIT 1), (SELECT id_produto FROM produtos WHERE nome = 'Fone de Ouvido Bluetooth'), 16, 150.00),
((SELECT id_pedido FROM pedidos WHERE id_cliente = (SELECT id_cliente FROM clientes WHERE nome = 'Ana Silva') ORDER BY data_pedido DESC LIMIT 1), (SELECT id_produto FROM produtos WHERE nome = 'Livro "O Senhor dos Anéis"'), 17, 60.00),
((SELECT id_pedido FROM pedidos WHERE id_cliente = (SELECT id_cliente FROM clientes WHERE nome = 'Ana Silva') ORDER BY data_pedido DESC LIMIT 1), (SELECT id_produto FROM produtos WHERE nome = 'Calça Jeans'), 18, 120.00),
((SELECT id_pedido FROM pedidos WHERE id_cliente = (SELECT id_cliente FROM clientes WHERE nome = 'Ana Silva') ORDER BY data_pedido DESC LIMIT 1), (SELECT id_produto FROM produtos WHERE nome = 'Feijão 1kg'), 19, 5.00),
((SELECT id_pedido FROM pedidos WHERE id_cliente = (SELECT id_cliente FROM clientes WHERE nome = 'Carla Gomes') ORDER BY data_pedido DESC LIMIT 1), (SELECT id_produto FROM produtos WHERE nome = 'Bola de Futebol'), 20, 50.00);

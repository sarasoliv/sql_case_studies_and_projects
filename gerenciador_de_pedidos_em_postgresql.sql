--Etapa 1 — Criação do banco de dados
CREATE DATABASE loja_pedidos;

--Etapa 2 — Conversão do MER para o modelo relacional
--tabela cliente
CREATE TABLE cliente(
	id BIGSERIAL PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	telefone VARCHAR(15),
	email VARCHAR(100) NOT NULL
);

--tabela pedido
CREATE TABLE pedido(
	id BIGSERIAL PRIMARY KEY,
	idfk_cliente BIGINT,
	dt_entrada DATE NOT NULL,
	quantidade_total_pro INT NOT NULL,
	desconto FLOAT,
	tipo VARCHAR(11) NOT NULL,
	total FLOAT NOT NULL,
	dt_embarque DATE,

	FOREIGN KEY(idfk_cliente)
		REFERENCES cliente(id)
);

--tabela produto
CREATE TABLE produto(
	id BIGSERIAL PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	unidade_medida VARCHAR(15) NOT NULL,
	preco FLOAT NOT NULL
);

--tabela associativa produto_pedido
CREATE TABLE produto_pedido(
	id BIGSERIAL PRIMARY KEY,
	idfk_pedido BIGINT,
	idfk_produto BIGINT,
	quantidade_por_pro INT NOT NULL,
	subtotal_por_pro FLOAT,

	FOREIGN KEY(idfk_pedido)
		REFERENCES pedido(id),

	FOREIGN KEY(idfk_produto)
		REFERENCES produto(id),

--impedir repetição na tabela
	UNIQUE (idfk_pedido, idfk_produto)
);
--SELECT pro produto_pedido
SELECT * FROM produto_pedido;

--Etapa 3 — Cadastro dos dados
--insert dos clientes
--com telefone
INSERT INTO cliente(nome, telefone, email)
VALUES ('Ana Beatriz Souza', '(11) 98765-4321', 'ana.souza@email.com'),
('Carlos Eduardo Lima', '(11) 97654-3210', 'carlos.lima@email.com')

--sem telefone
INSERT INTO cliente(nome, email)
VALUES ('Mariana Oliveira', 'mariana.oliveira@email.com'),
('João Pedro Silva', 'joao.silva@email.com'),
('Fernanda Alves Costa', 'fernanda.costa@email.com')

--insert dos produtos
INSERT INTO produto(nome, unidade_medida, preco)
VALUES ('Sabonete', 'unidade', 4.50),
('Arroz', 'kg', 6.80),
('Café', 'g', 12.50),
('Detergente', 'litro', 8.90),
('Shampoo', 'ml', 15.90),
('Tecido', 'metro', 52.00),
('Lápis de cor', 'caixa', 18.50),
('Biscoito', 'pacote', 7.50)

--insert dos pedidos
--com desconto
INSERT INTO pedido(idfk_cliente, dt_entrada, quantidade_total_pro, desconto, tipo, total, dt_embarque)
VALUES (1, '2026-09-02', 7, 4.50, 'Online', 43.00, '2026-09-05'),
(3, '2026-09-04', 4, 5.00, 'Presencial', 40.40, '2026-09-11'),
(5, '2026-09-06', 6, 2.50, 'Online', 46.70, '2026-09-09')

--sem desconto
INSERT INTO pedido(idfk_cliente, dt_entrada, quantidade_total_pro, tipo, total)
VALUES (2, '2026-09-08', 28, 'Presencial', 1313.50),
(4, '2026-09-10', 36, 'Online', 541.20),
(1, '2026-09-12', 3, 'Presencial', 37.50)


--insert dos produto_pedido
INSERT INTO produto_pedido(idfk_pedido, idfk_produto, quantidade_por_pro, subtotal_por_pro)
VALUES (1, 1, 5, 22.50),
(1, 3, 2, 25.00),
(2, 2, 2, 13.60),
(2, 5, 2, 31.80),
(3, 8, 3, 22.50),
(3, 4, 3, 26.70),
(4, 6, 25, 1300.00), 
(4, 1, 3, 13.50),
(5, 7, 2, 37.00),
(5, 2, 4, 27.20),
(5, 5, 30, 477.00),     
(6, 3, 3, 37.50)

--Etapa 4 — Consultas simples
--1. Liste todos os clientes
SELECT * FROM cliente;

--2. Mostre o nome e o telefone dos clientes.
SELECT nome, telefone FROM cliente;

--3. Liste os clientes em ordem alfabética.
SELECT * FROM cliente ORDER BY nome;

--4. Localize os clientes cujo nome começa com A.
SELECT * FROM cliente WHERE nome ILIKE 'A%';

--5. Localize os clientes cujo nome contém Silva.
SELECT * FROM cliente WHERE nome ILIKE '%silva%';

--6. Mostre os clientes sem telefone cadastrado
SELECT * FROM cliente WHERE telefone IS NULL;

--7. Liste todos os produtos.
SELECT * FROM produto;

--8. Mostre o nome e o preço dos produtos.
SELECT nome, preco FROM produto;

--9. Liste os produtos em ordem crescente de preço.
SELECT * FROM produto ORDER BY preco;

--10. Mostre os produtos com preço superior a R$ 50,00.
SELECT * FROM produto WHERE preco > 50;

--11. Mostre os produtos com preço entre R$ 10,00 e R$ 100,00.
SELECT preco FROM produto WHERE preco > 10 AND preco < 100;

--12. Mostre os produtos cuja unidade de medida é UN.
SELECT * FROM produto WHERE unidade_medida ILIKE 'un%';

--13. Mostre os produtos cuja unidade de medida é KG ou L.
SELECT * FROM produto WHERE unidade_medida ILIKE 'kg' OR unidade_medida ILIKE'L%';

--14. Liste todos os pedidos.
SELECT * FROM pedido;

--15. Mostre os pedidos com desconto maior que zero
SELECT * FROM pedido WHERE desconto > 0;

--16. Mostre os pedidos que ainda não foram embarcados
SELECT * FROM pedido WHERE dt_embarque IS NULL;

--17. Mostre os pedidos que já foram embarcados.
SELECT * FROM pedido WHERE dt_embarque IS NOT NULL;

--18. Mostre os pedidos realizados em uma data específica.
SELECT * FROM pedido WHERE dt_entrada = '2026-09-12';

--19. Mostre os pedidos realizados entre duas datas.
SELECT * FROM pedido WHERE dt_entrada BETWEEN '2026-09-02' AND '2026-09-08';

--20. Liste os pedidos em ordem decrescente de valor total.
SELECT * FROM pedido ORDER BY total DESC;

--21. Mostre os pedidos com valor total superior a R$ 500,00.
SELECT * FROM pedido WHERE total > 500

--22. Mostre os itens cuja quantidade seja maior que três.
SELECT * FROM produto_pedido WHERE quantidade_por_pro > 3;

--23. Mostre os itens com subtotal superior a R$ 100,00.
SELECT * FROM produto_pedido WHERE subtotal_por_pro > 100;

--24. Conte quantos clientes estão cadastrados.
SELECT COUNT(*) FROM cliente;

--25. Conte quantos produtos estão cadastrados.
SELECT COUNT(*) FROM produto;

--26. Mostre o maior preço dos produtos
SELECT MAX(preco) AS maior_valor FROM produto;

--27. Mostre o menor preço dos produtos.
SELECT MIN(preco) AS menor_valor FROM produto;

--28. Calcule a média dos preços
SELECT ROUND(AVG(preco)::NUMERIC, 2) AS media_valor FROM produto;

--29. Calcule a soma dos valores dos pedidos
SELECT ROUND(SUM(total)::numeric, 2) AS todos_pedidos_total FROM pedido;

--30. Conte quantos pedidos ainda não foram embarcados
SELECT COUNT(*) FROM pedido WHERE dt_embarque IS NULL;

--Etapa 5 — Alteração e exclusão de dados
--Utilizando UPDATE:
--1. Altere o telefone de um cliente.
SELECT * FROM cliente;
UPDATE cliente SET telefone = '(11) 94002-8922' WHERE id = 1;

--2. Aumente o preço de um produto em 10%.
SELECT * FROM produto;
UPDATE produto SET preco = preco * 1.10 WHERE id = 2;

--3. Registre a data de embarque de um pedido
SELECT * FROM pedido;
UPDATE pedido SET dt_embarque = '2026-09-11' WHERE id = 5;

--4. Altere o desconto de um pedido.
SELECT * FROM pedido;
UPDATE pedido SET desconto = 10 WHERE id = 1;

--5. Utilize SELECT para conferir os registros antes e depois das alterações
SELECT * FROM cliente;
SELECT * FROM produto;
SELECT * FROM pedido;

--Utilizando DELETE:
--1. Cadastre um produto de teste que não esteja relacionado a nenhum pedido.
INSERT INTO produto(nome, unidade_medida, preco)
VALUES ('Caneta', 'unidade', 3.50)

--2. Consulte o produto para confirmar seu cadastro.
SELECT * FROM produto;

--3. Exclua o produto utilizando sua chave primária.
DELETE FROM produto WHERE id = 9;

--4. Consulte novamente para confirmar a exclusão
SELECT * FROM produto;

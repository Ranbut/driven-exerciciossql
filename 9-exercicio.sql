/*9. Chico Buarque de Holanda comprou o produto Violão Lava ME 2. Adicione esse registro de compra na tabela compra;*/
INSERT INTO compras (id_cliente, id_produto) VALUES
((SELECT id FROM clientes WHERE nome='Chico Buarque de Holanda'), (SELECT id FROM produtos WHERE nome='Violão Lava ME 2'));
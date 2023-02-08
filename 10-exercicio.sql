/*10. Olga Cascais Fortunato comprou dois Celular Topo de Linha. Adicione os registros de compra na tabela compra*/
INSERT INTO compras (id_cliente, id_produto) VALUES
((SELECT id FROM clientes WHERE nome='Olga Cascais Fortunato'), (SELECT id FROM produtos WHERE nome='Celular Topo de Linha')),
((SELECT id FROM clientes WHERE nome='Olga Cascais Fortunato'), (SELECT id FROM produtos WHERE nome='Celular Topo de Linha'));
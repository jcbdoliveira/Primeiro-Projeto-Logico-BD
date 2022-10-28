USE ecommerce;

INSERT INTO clients VALUES (0, 'JULIO', 'CB', 'OLIVEIRA', 'RUA TESTE, 1026 - CENTRO - MAFRA/SC', 'Fisica'), 
			   (0, 'MARIA', 'ANA', 'DUARTE', 'RUA AQUARELA, 16 - CENTRO - MAFRA/SC', 'Fisica'),
		       (0, 'CARLOS', 'G', 'SILVA', 'RUA BUENOS, 28 - BOM RETIRO - MAFRA/SC', 'Fisica'),
			   (0, 'JULIANA', 'B', 'OLIVEIRA', 'RUA MARTIN CASTRO, 10026 - CENTRO II - MAFRA/SC', 'Fisica'),
			   (0, 'FABIANE', 'BO', 'ENGEL', 'RUA TESTE DO TESTE, 6 - BAIXADA - MAFRA/SC', 'Fisica'),
			   (0, 'AYLLA', 'BG', 'OLIVER', 'RUA EXAMPLE TEST, SN - CENTRINHO - MAFRA/SC', 'Fisica'),
			   (0, 'MARCOS', 'JK', 'MOREIRA', 'RUA TESTE TESTE, 1 - AGUA VERDE - MAFRA/SC', 'Fisica'),
			   (0, 'IVETE', 'MD', 'CAMARGO ME', 'RUA MAFRE TESTE, 1000 - BR280 - MAFRA/SC', 'Juridica'),
			   (0, 'ANA', 'WD', 'LTDA', 'RUA FELIPE AUGUSTO JOSE, 98652 - FUNDAO - MAFRA/SC', 'Juridica');

INSERT INTO customers VALUES ('01214578963', '36521478', 1),
                             ('21215787521', '37081528', 2),
                             ('32154578999', '91521338', 3),
                             ('74214578875', '50524448', 4),
                             ('00014578978', '26521685', 5),
                             ('00014378999', '00321685', 6),
                             ('00214988932', '00521003', 7);

INSERT INTO companys VALUES ('78569214000115', '253280963', 8),
                            ('00348444000115', '250260723', 9);
                            
INSERT INTO products VALUES (0, 'FOOD','BATATA FRITA 350Z', 1.65),
							(0, 'FOOD','CHIPS 150Z', 2.95),
                            (0, 'CAR','PNEU 14/80', 150),
                            (0, 'KJDS','URSO PELUCIA', 25.23),
                            (0, 'DRINK','COCA-COLA', 1.52),
                            (0, 'CLOTHS','CALCAO 10', 10.35),
                            (0, 'CLOTHS','CAMISA BRASIL', 15.98);
  
INSERT INTO suppliers VALUES (0, 'ZE VENDEDOR ME', '024875213652410','RUA 14 DEZ,102 - CENTRO - RIO NEGRO/PR','554736451234','zevende@gmail.com'),
                               (0, 'VENDEMOS DE TUDO LTDA', '000147521365241','RUA TESTE,102 - CENTRO - MAFRA/SC','554736441274','tudo@gmail.com'),
                               (0, 'COMIDA BOA', '078525213652410','RUA ARMAZEM,12 - BOSTA VERDE - SAO PAULO/sp','554799451234','bestfood@gmail.com');

INSERT INTO orders VALUES (0, 'Processando', 'COMPRA B2B', 2, 11),
		                  (0, 'Processando', 'COMPRA B2B', 3, 10),
						  (0, 'Processando', 'COMPAR B2B', 9, 0),
						  (0, 'Processando', 'COMPAR B2B', 2, 9),
						  (0, 'Processando', 'COMPAR B2B', 7, 10);

INSERT INTO productorder VALUES (1, 1, 10, 'Disponível'),
								(1, 2, 8, 'Disponível'),
                                (1, 3, 1, 'Disponível'),
                                (2, 6, 100, 'Disponível'),
                                (3, 5, 1, 'Disponível'),
                                (3, 1, 10, 'Disponível'),
                                (3, 3, 28, 'Disponível');

INSERT INTO supplierextras VALUES (0, 'SEMPRE VENDO ME', 'RUA DAS PALMEIRAS, 1040 - CENTRO - ITU/SP', 'MEGA DEZ', '5511854734124', 'megadez@gmail.com', '00458741264521'),
                                  (0, 'AMARILDOJOSE LTDA', 'RUA PALMEIRAS, 1040 - CENTRO - JAU/SP', 'AMAJO', '5511854738875', 'amajo@gmail.com', '00458741274121'),
                                  (0, 'PIX ELETRONICOS EIRELI', 'RUA PALMARES, 1040 - CENTRO - IJAU/SP', 'ELECT', '5511858534124', 'elect@gmail.com', '00458741264999'),
                                  (0, 'MAQUINA DE VENDA LTDA', 'RUA PALMITOS, 1040 - CENTRO - MOEMA/SP', 'VAI945', '5511854734327', 'vai495@gmail.com', '00888841264521');

INSERT INTO sellerexproduct VALUES (5, 1, 125),
                                   (5, 2, 120),
                                   (5, 3, 118),
                                   (5, 4, 135);

INSERT INTO sellerproduct VALUES (2, 3),
                                 (2, 4),
                                 (2, 5),
                                 (1, 2),
                                 (1, 5);

INSERT INTO storagelocations VALUES (0, 'LOC 001'),
                                    (0, 'LOC 140'),
                                    (0, 'LOC ABC'),
                                    (0, 'LOC AB1'),
                                    (0, 'LOC WW8');

INSERT INTO storageproducts VALUES (1, 1, 800),
                                   (1, 2, 100),
                                   (1, 3, 10),
                                   (2, 2, 250),
                                   (3, 1, 60),
                                   (3, 4, 1250),
                                   (3, 5, 1000);

INSERT INTO payments VALUES (0, 5, '2022-10-01', 500, 'Cartão'),
                            (0, 3, '2022-10-02', 100, 'Cartão'),
                            (0, 1, '2022-10-27', 200, 'Boleto'),
                            (0, 4, '2022-10-24', 300, 'Cartão'),
                            (0, 2, '2022-10-03', 250, 'Cartão'),
                            (0, 2, '2022-10-03', 150, 'PIX');
                            
INSERT INTO payticket VALUES (0, 3, 'BB', '12478441', '2022-10-27', '142152487154512');

INSERT INTO paycard VALUES (0, 1, '142536789', '2022-12-12', 'MASTER', 6),
                           (0, 2, '082536789', '2023-12-12', 'VISA', 10),
                           (0, 4, '992536789', '2024-12-12', 'AMEX', 1),
                           (0, 5, '140006789', '2032-12-12', 'MASTER', 12);

INSERT INTO paypix VALUES (0, 6, 'adch-1245-gtfg-5214');

INSERT INTO deliveryprodorders VALUES (0, 'CODIGO RASTER AX012415421BR', '2022-10-27', 1, 1),
                                      (0, 'CODIGO RASTER AX012418521BR', '2022-10-27', 1, 2),
                                      (0, 'CODIGO RASTER AX000415421BR', '2022-10-27', 1, 3),
                                      (0, 'CODIGO RASTER AX012419991BR', '2022-10-27', 2, 1);

-- -------------------------------------

-- Descrição da entidade e atibutos
DESC clients;

-- Quantos pedidos foram feitos por cada cliente?
SELECT * FROM clients;

SELECT COUNT(*) FROM clients;

SELECT * FROM clients c, orders o WHERE c.idClient = idClientOrder;

SELECT Fname,Lname, idOrder, statusOrder FROM clients c, orders o WHERE c.idClient = idClientOrder;

SELECT CONCAT(Fname,' ',Lname) AS CLIENT, idOrder AS Request, statusOrder AS STATUS FROM clients c, orders o WHERE c.idClient = idClientOrder;

-- Vendas por cliente
SELECT * FROM clients c 
		INNER JOIN orders o ON c.idClient = o.idClientOrder
		INNER JOIN productOrder p ON p.idProdOrder = o.idOrder 
GROUP BY idClient; 

-- Quantos pedidos foram feitos por cada cliente?
SELECT c.idClient, Fname, COUNT(*) AS Number_of_orders FROM clients c 
		INNER JOIN orders o ON c.idClient = o.idClientOrder 
		GROUP BY idClient; 

-- Relação de produtos fornecedores e estoques;
SELECT *  FROM suppliers s
		INNER JOIN sellerproduct p ON p.idSupplier = s.idSupplier
        INNER JOIN storageProducts t ON t.idProduct = p.idProduct 
ORDER BY s.idSupplier; 

-- Algum vendedor também é fornecedor? 
SELECT u.idExSupplier, u.socialName, u.address, x.phoneContact  
	FROM suppliers s,  supplierExtras u
	WHERE s.CNPJ = u.CNPJ
ORDER BY x.idExSupplier; 

-- Relação de nomes dos fornecedores e nomes dos produtos;
SELECT s.idSupplier, s.socialName, t.idProduct, t.descricao  FROM suppliers s
	INNER JOIN sellerproduct p ON p.idSupplier = s.idSupplier
        INNER JOIN products t ON t.idProduct = p.idProduct 
ORDER BY s.idSupplier; 

-- Meios de pagamento mais usados e %
SELECT p.payType, COUNT(*) AS quantity, ROUND((COUNT(*) / (SELECT COUNT(*) FROM payments) * 100),2) AS percent  FROM payments p
GROUP BY p.payType
ORDER BY COUNT(*) DESC; 

-- Valor pago por tipo
SELECT p.payType,sum(payValue) AS payValue  FROM payments p
GROUP BY p.payType;


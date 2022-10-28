-- Script Database e-commerce

CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce ;

-- -----------------------------------------------------
-- Table Supplier (Fornecedor)
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Suppliers (
  idSupplier INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  socialName VARCHAR(60) NOT NULL,
  CNPJ VARCHAR(15) NOT NULL,
  address  VARCHAR(45) NOT NULL,
  phoneContact VARCHAR(45) NULL,
  eMail VARCHAR(100) NULL,
  CONSTRAINT unique_CNPJ_supplier UNIQUE (CNPJ)
  );
-- -----------------------------------------------------
-- Table Client (Cliente)
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Clients (
  idClient INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Fname  VARCHAR(10) NOT NULL,
  Minit  VARCHAR(3) NULL,
  Lname  VARCHAR(20) NULL,
  address VARCHAR(100) NULL,
  typeClient ENUM('Fisica', 'Juridica') NOT NULL DEFAULT 'Fisica');
-- -----------------------------------------------------
-- Table Product (Produto)
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Products(
  idProduct INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  categoria VARCHAR(45) NOT NULL,
  descricao VARCHAR(250) NOT NULL,
  valor DECIMAL NULL);
-- -----------------------------------------------------
-- Table productStorage (Estoque)
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS storageLocations (
  idProdLocation INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  location  VARCHAR(45) NOT NULL);
-- -----------------------------------------------------
-- Table Orders(Pedido)
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Orders (
  idOrder INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  statusOrder ENUM("Em andamneto", "Processando", "Enviado", "Entregue") NOT NULL DEFAULT 'Processando',
  orderDescription  VARCHAR(45) NOT NULL,
  idClientOrder INT NOT NULL,
  sendValue FLOAT NULL DEFAULT 10,
  CONSTRAINT fk_orders_client FOREIGN KEY (idClientOrder) REFERENCES Clients(idClient)
  );
-- -----------------------------------------------------
-- Table  (Disponibiliza um produto)
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS sellerProduct (
  idSupplier INT NOT NULL,
  idProduct INT NOT NULL,
  PRIMARY KEY (idSupplier, idProduct),
  CONSTRAINT fk_supplier_sellerProduct FOREIGN KEY (idSupplier) REFERENCES Suppliers(idSupplier),
  CONSTRAINT fk_product_sellerProduct FOREIGN KEY (idProduct) REFERENCES Products(idProduct)
  );
-- -----------------------------------------------------
-- Table storageProduct (Estoque)
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS storageProducts (
  idProduct INT NOT NULL,
  idStLocation INT NOT NULL,
  Quantidade DECIMAL(10,6) NULL,
  PRIMARY KEY (idProduct, idStLocation),
  CONSTRAINT fk_product_stProduct FOREIGN KEY (idProduct) REFERENCES Products(idProduct),
  CONSTRAINT fk_location_stProduct FOREIGN KEY (idStLocation) REFERENCES storageLocations(idProdLocation)
);
-- -----------------------------------------------------
-- Table productOrder(Produtos por pedido)
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS productOrder (
  idOrder INT NOT NULL,
  idProdOrder  INT NOT NULL,
  prodQuantity  DECIMAL(10,5) NOT NULL,
  prodOrderStatus ENUM("Disponível", "Sem estoque") NULL,
  PRIMARY KEY (idOrder, idProdOrder),
  CONSTRAINT fk_product_prodOrder FOREIGN KEY (idProdOrder) REFERENCES Products(idProduct),
  CONSTRAINT fk_order_fk_product_prodOrder FOREIGN KEY (idOrder) REFERENCES Orders(idOrder)
);
-- -----------------------------------------------------
-- Table supplierExtra (Terceiro -  Vendedor)
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS supplierExtras (
  idExSupplier INT NOT NULL  AUTO_INCREMENT PRIMARY KEY,
  socialName VARCHAR(60) NOT NULL,
  address VARCHAR(100) NOT NULL,
  surname VARCHAR(60) NULL,
  phoneContact VARCHAR(20) NULL,
  eMail VARCHAR(100) NOT NULL,
  CNPJ CHAR(15) NOT NULL,
  CONSTRAINT unique_CNPJ_supplierEx UNIQUE (CNPJ)
  );
-- -----------------------------------------------------
-- Table sellerExProduct (Produtos por  Terceiro - vendedor)
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS sellerExProduct (
  idProdExSell INT NOT NULL,
  idProdExSupplier INT NOT NULL,
  prodExQuantity DECIMAL(10,6) NOT NULL,
  PRIMARY KEY (idProdExSell, idProdExSupplier),
  CONSTRAINT fk_product_sellerExProduct FOREIGN KEY (idProdExSell) REFERENCES Products(idProduct),
  CONSTRAINT fk_supplierEx_sellerExProduct FOREIGN KEY (idProdExSupplier) REFERENCES supplierExtras(idExSupplier)
);
-- -----------------------------------------------------
-- Table Customers(Pessoa Fisica)
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Customers (
  CPF VARCHAR(11) NOT NULL PRIMARY KEY,
  RG VARCHAR(20) NOT NULL,
  idClient INT NOT NULL,
  CONSTRAINT fk_client_customer FOREIGN KEY (idClient) REFERENCES Clients (idClient),
  CONSTRAINT unique_CPF_customer UNIQUE (CPF)
  );
-- -----------------------------------------------------
-- Table Companys (Pessoa Juridica)
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Companys (
  CNPJ CHAR(15) NOT NULL PRIMARY KEY,
  IE VARCHAR(20) NOT NULL,
  idClient INT NOT NULL,
  CONSTRAINT fk_client_company FOREIGN KEY (idClient) REFERENCES Clients(idClient) 
  );
-- -----------------------------------------------------
-- Table payments(Pagamento)
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Payments (
  IdPayment INT NOT NULL AUTO_INCREMENT,
  idPayOrder INT NOT NULL,
  payDate DATETIME NOT NULL,
  payValue FLOAT ZEROFILL NOT NULL,
  payType ENUM("Boleto", "Cartão", "PIX") NOT NULL DEFAULT 'Boleto',
  PRIMARY KEY (IdPayment, idPayOrder),
  CONSTRAINT fk_order_payment FOREIGN KEY (idPayOrder) REFERENCES Orders(idOrder)
);
-- -----------------------------------------------------
-- Table payCard(Pagamento Cartão débito/crédito)
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS payCard(
  idPayCard INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  IdPayment INT NOT NULL,
  authorization VARCHAR(30) NOT NULL,
  validate DATE NOT NULL,
  flagCard VARCHAR(15) NOT NULL,
  installments INT NOT NULL DEFAULT 1,
  CONSTRAINT fk_payment_paycard FOREIGN KEY (IdPayment) REFERENCES Payments(IdPayment)
);
-- -----------------------------------------------------
-- Table deliveryProdOrder (Status da Entrega Produto)
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS deliveryProdOrders (
  idDelivery INT NOT NULL AUTO_INCREMENT,
  eventDesc VARCHAR(250) NOT NULL,
  eventDate DATE NOT NULL,
  idDelProdOrder INT NOT NULL,
  idDelOrder INT NOT NULL,
  PRIMARY KEY (idDelivery, idDelOrder, idDelProdOrder),
  CONSTRAINT fk_order_deliveryprodorder FOREIGN KEY (idDelOrder) REFERENCES productOrder(idOrder),
  CONSTRAINT fk_product_deliveryprodorder FOREIGN KEY (idDelProdOrder) REFERENCES productOrder(idProdOrder)
);
-- -----------------------------------------------------
-- Table payPIX(Pix)
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS payPIX (
  idPayPIX INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  IdPIXPayment INT NOT NULL,
  keyPIX VARCHAR(150) NOT NULL,  
  CONSTRAINT fk_payment_paypix FOREIGN KEY (IdPIXPayment) REFERENCES Payments(IdPayment)
);
-- -----------------------------------------------------
-- Table payTicket(Boleto)
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS payTicket (
  idPayTicket INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  IdTicketPayment INT NOT NULL,
  bankName VARCHAR(45) NOT NULL,
  nsuTicket VARCHAR(45) NOT NULL,
  dueDate DATE NOT NULL,
  nsuNumber VARCHAR(45) NOT NULL,
  CONSTRAINT fk_payment_payticket FOREIGN KEY (IdTicketPayment) REFERENCES Payments(IdPayment),
  CONSTRAINT unique_nsuNumber_payticket UNIQUE (nsuNumber)
);

ALTER TABLE clients AUTO_INCREMENT=1;







                            




                                 



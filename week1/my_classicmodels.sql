DROP DATABASE IF EXISTS my_classicmodels;
CREATE DATABASE my_classicmodels;
USE my_classicmodels;
CREATE TABLE orders(
    orderNumber INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    orderDate DATETIME NOT NULL,
    reuiredDate DATETIME NOT NULL,
    shippedDate DATETIME,
    status VARCHAR(15) NOT NULL,
    comments TEXT,
    customerNumber INT(11) NOT NULL
);

CREATE TABLE productlines(
    productLine VARCHAR(50) NOT NULL PRIMARY KEY,
    textDescription VARCHAR(4000),
    htmlDescription MEDIUMTEXT,
    image MEDIUMBLOB
);

CREATE TABLE products(
    productCode VARCHAR(15) NOT NULL PRIMARY KEY,
    productName VARCHAR(70) NOT NULL,
    productLine VARCHAR(50) NOT NULL,
    productScale VARCHAR(10) NOT NULL,
    productVendor VARCHAR(50) NOT NULL,
    productDescription TEXT NOT NULL,
    quantityInStock SMALLINT(6) NOT NULL,
    buyPrice DOUBLE NOT NULL,
    CONSTRAINT productline_pk FOREIGN KEY (productLine) REFERENCES productlines (productLine) ON UPDATE CASCADE
);

CREATE TABLE orderdetails(
    orderNumber INT(11),
    productCode VARCHAR(15)  NOT NULL,
    quantityOrdered INT(11) NOT NULL,
    priceEach DOUBLE NOT NULL,
    orderLineNumber SMALLINT(6) NOT NULL,
    PRIMARY KEY (orderNumber, productCode),
    UNIQUE(orderNumber, productCode),
    CONSTRAINT ordernumber_pk FOREIGN KEY (orderNumber) REFERENCES orders (orderNumber) ON UPDATE CASCADE,
    CONSTRAINT productcode_pk FOREIGN KEY (productCode) REFERENCES products (productCode) ON UPDATE CASCADE
);

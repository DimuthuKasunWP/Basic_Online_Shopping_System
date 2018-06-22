DROP DATABASE ShoppingCart;
CREATE DATABASE ShoppingCart;
USE ShoppingCart;

CREATE TABLE AdminLogin(
  USERNAME VARCHAR (100),
  PASSWORD VARCHAR (82) NOT NULL,
  CONSTRAINT PRIMARY KEY (USERNAME)
);

CREATE TABLE Customer(
  CUST_ID INT AUTO_INCREMENT,
  NAME VARCHAR (255),
  NIC INT (13),
  MOBILE INT (15),
  CONSTRAINT PRIMARY KEY (CUST_ID)
);

CREATE TABLE CustomerLogin(
  CUST_USERNAME VARCHAR (255) ,
  CUST_PASSWORD VARCHAR (255) NOT NULL ,
  CUST_ID INT,
  CONSTRAINT UNIQUE KEY (CUST_ID),
  CONSTRAINT PRIMARY KEY (CUST_USERNAME),
  CONSTRAINT FOREIGN KEY (CUST_ID) REFERENCES Customer(CUST_ID) ON DELETE CASCADE
);

CREATE TABLE ItemCategory(
  CAT_ID INT AUTO_INCREMENT,
  CATEGORY VARCHAR(255) UNIQUE NOT NULL ,
  CONSTRAINT PRIMARY KEY (CAT_ID)
);

CREATE TABLE Item(
  ITEM_ID INT AUTO_INCREMENT,
  ITEM_NAME VARCHAR (255) UNIQUE NOT NULL,
  QTY INT,
  UNIT_PRICE DECIMAL (20,2),
  CAT_ID INT NOT NULL,
  CONSTRAINT PRIMARY KEY (ITEM_ID,CAT_ID),
  CONSTRAINT FOREIGN KEY (CAT_ID) REFERENCES ItemCategory(CAT_ID) ON DELETE CASCADE
);

CREATE TABLE CustomerOrder(
  ORDER_ID INT AUTO_INCREMENT,
  ORDER_DATE DATE ,
  CUST_ID INT ,
  CONSTRAINT PRIMARY KEY (ORDER_ID) ,
  CONSTRAINT FOREIGN KEY (CUST_ID) REFERENCES Customer(CUST_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE OrderDetail(
  ORDERDETAIL_ID INT AUTO_INCREMENT ,
  ORDER_ID INT ,
  ITEM_ID INT ,
  ORDER_QTY INT ,
  TOTAL_AMOUNT DECIMAL (20,2) ,
  CONSTRAINT PRIMARY KEY (ORDERDETAIL_ID,ORDER_ID) ,
  CONSTRAINT FOREIGN KEY (ORDER_ID) REFERENCES CustomerOrder(ORDER_ID) ON DELETE CASCADE,
  CONSTRAINT FOREIGN KEY (ITEM_ID) REFERENCES Item(ITEM_ID)
);

INSERT INTO adminlogin VALUES ('admin',PASSWORD('admin'));

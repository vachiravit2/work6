# ---------------------------------------------------------------------- #
# Script generated with: DeZign for Databases V9.0.0                     #
# Target DBMS:           MySQL 5                                         #
# Project file:          azure.dez                                       #
# Project name:                                                          #
# Author:                                                                #
# Script type:           Database creation script                        #
# Created on:            2015-11-25 22:56                                #
# ---------------------------------------------------------------------- #


# ---------------------------------------------------------------------- #
# Add tables                                                             #
# ---------------------------------------------------------------------- #

# ---------------------------------------------------------------------- #
# Add table "Author"                                                     #
# ---------------------------------------------------------------------- #
CREATE TABLE `Author` (
    `A_Name` VARCHAR(40) COMMENT 'ª×èÍ¼Ùéà¢ÕÂ¹',
    `A_Id` VARCHAR(10) NOT NULL COMMENT 'ÃËÑÊ¼Ùéà¢ÕÂ¹',
    CONSTRAINT `PK_Author` PRIMARY KEY (`A_Id`)
);

CREATE TABLE `Publisher` (
    `P_Name` VARCHAR(40) COMMENT 'ª×èÍÊÓ¹Ñ¡¾ÔÁ¾ì',
    `P_Id` VARCHAR(10) NOT NULL COMMENT 'ÃËÑÊÊÓ¹Ñ¡¾ÔÁ¾ì',
    CONSTRAINT `PK_Publisher` PRIMARY KEY (`P_Id`)
);

CREATE TABLE `Book_Type` (
    `BT_Name` VARCHAR(40) COMMENT 'ª×èÍ»ÃÐàÀ·Ë¹Ñ§Ê×Í',
    `BT_Id` VARCHAR(10) NOT NULL COMMENT 'ÃËÑÊ»ÃÐàÀ·Ë¹Ñ§Ê×Í',
    `B_Id` VARCHAR(10) NOT NULL,
    CONSTRAINT `PK_Book_Type` PRIMARY KEY (`BT_Id`, `B_Id`)
);

CREATE TABLE `Customer` (
    `Cus_Name` VARCHAR(40) COMMENT 'ª×èÍÅÙ¡¤éÒ',
    `Cus_Id` VARCHAR(10) NOT NULL COMMENT 'ÃËÑÊÅÙ¡¤éÒ',
    `Cus_Num` VARCHAR(10) COMMENT 'àºÍÃìâ·ÃÅÙ¡¤éÒ',
    CONSTRAINT `PK_Customer` PRIMARY KEY (`Cus_Id`)
);

CREATE TABLE `Order1` (
    `B_Id` VARCHAR(10) COMMENT 'ÃËÑÊË¹Ñ§Ê×Í',
    `B_Name` VARCHAR(40) COMMENT 'ª×èÍË¹Ñ§Ê×Í',
    `O_Id` VARCHAR(10) NOT NULL COMMENT 'ÃËÑÊÊÑè§«×éÍ',
    `Cus_Id` VARCHAR(10) COMMENT 'ÃËÑÊÅÙ¡¤éÒ',
    CONSTRAINT `PK_Order` PRIMARY KEY (`O_Id`)
);

CREATE TABLE `Book` (
    `B_Name` VARCHAR(40) COMMENT 'ª×èÍË¹Ñ§Ê×Í',
    `B_Id` VARCHAR(10) NOT NULL COMMENT 'ÃËÑÊË¹Ñ§Ê×Í',
    `B_Edition` NUMERIC(10) COMMENT 'àÅèÁË¹Ñ§Ê×Í',
    `B_Price` NUMERIC(10) COMMENT 'ÃÒ¤ÒË¹Ñ§Ê×Í',
    `A_Id` VARCHAR(10),
    `O_Id` VARCHAR(10) NOT NULL,
    `BT_Id` VARCHAR(10) NOT NULL,
    `P_Id` VARCHAR(10),
    CONSTRAINT `PK_Book` PRIMARY KEY (`B_Id`, `BT_Id`)
);


INSERT INTO Author (A_Name,A_Id)

VALUES ('Anon','1111');


# ---------------------------------------------------------------------- #
# Add table "Publisher"                                                  #
# ---------------------------------------------------------------------- #

INSERT INTO Publisher (P_Name,P_Id)

VALUES ('Booking','10001');


# ---------------------------------------------------------------------- #
# Add table "Book_Type"                                                  #
# ---------------------------------------------------------------------- #

INSERT INTO Book_Type (BT_Name,BT_Id)

VALUES ('Sport','1001');


# ---------------------------------------------------------------------- #
# Add table "Customer"                                                   #
# ---------------------------------------------------------------------- #

INSERT INTO Customer (Cus_Name,Cus_Id,Cus_Num)

VALUES ('Vachiravit','5605104060','0898957383');


# ---------------------------------------------------------------------- #
# Add table "Order"                                                      #
# ---------------------------------------------------------------------- #

INSERT INTO Order1 (B_Id,B_Name,O_Id,Cus_Id)

VALUES ('2015000001','FourFourTwo','0000000001');

# ---------------------------------------------------------------------- #
# Add table "Book"                                                       #
# ---------------------------------------------------------------------- #

INSERT INTO Book (B_Name,B_Id,B_Edition,B_Price)

VALUES ('FourFourTwo','2015000001','1','150');


# ---------------------------------------------------------------------- #
# Add foreign key constraints                                            #
# ---------------------------------------------------------------------- #

ALTER TABLE `Book` ADD CONSTRAINT `Author_Book` 
    FOREIGN KEY (`A_Id`) REFERENCES `Author` (`A_Id`);

ALTER TABLE `Book` ADD CONSTRAINT `Order_Book` 
    FOREIGN KEY (`O_Id`) REFERENCES `Order` (`O_Id`);

ALTER TABLE `Book` ADD CONSTRAINT `Book_Type_Book` 
    FOREIGN KEY (`BT_Id`, `B_Id`) REFERENCES `Book_Type` (`BT_Id`,`B_Id`);

ALTER TABLE `Book` ADD CONSTRAINT `Publisher_Book` 
    FOREIGN KEY (`P_Id`) REFERENCES `Publisher` (`P_Id`);

ALTER TABLE `Order` ADD CONSTRAINT `Customer_Order` 
    FOREIGN KEY (`Cus_Id`) REFERENCES `Customer` (`Cus_Id`);

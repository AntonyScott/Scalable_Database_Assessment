CREATE DATABASE IF NOT EXISTS sds_assessment;

CREATE TABLE IF NOT EXISTS `tbl_bank_addresses`(
	`Address_ID` int(11) NOT NULL UNIQUE AUTO_INCREMENT,
	`Address_Line_1` varchar(30) NOT NULL,
	`Address_Line_2` varchar(30) NULL,
	`Post_Code` varchar(30) NOT NULL,
	`Country` varchar(30) NOT NULL,
	`Town` varchar(30) NOT NULL,
	PRIMARY KEY(`Address_ID`))ENGINE=INNODB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
    
CREATE TABLE IF NOT EXISTS `tbl_bank_customer`(
	`Customer_ID` int(11) NOT NULL UNIQUE AUTO_INCREMENT,
	`Title` varchar(25) NOT NULL,
	`First_Name` varchar(20) NOT NULL,
	`Middle_Name(s)` varchar(40) DEFAULT NULL,
	`Last_Name` varchar(20) NOT NULL,
	`Gender` varchar(50) NOT NULL,
	`DOB` date NOT NULL,
	`Address_ID` int(11) NOT NULL UNIQUE,
	`Telephone_Number` varchar(15) NOT NULL,
	`Opening_Balance` DECIMAL(8,2) NOT NULL,
	PRIMARY KEY(`Customer_ID`),
	FOREIGN KEY(`Address_ID`)REFERENCES tbl_bank_addresses(`Address_ID`))ENGINE=INNODB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `tbl_bank_accounts`(
	`Customer_ID` int(11) NOT NULL UNIQUE AUTO_INCREMENT,
	`Account_Number` int(8) NOT NULL UNIQUE,
	`Sort_Code` int(6) NOT NULL,
	PRIMARY KEY(`Account_Number`),
	FOREIGN KEY(`Customer_ID`) REFERENCES tbl_bank_customer(`Customer_ID`))ENGINE=INNODB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `tbl_bank_customer_transactions`(
	`Customer_Transaction_ID` int(11) NOT NULL AUTO_INCREMENT,
	`Account_Number` int(8) NOT NULL,
	`Transaction_Date` date NOT NULL,
	`Incoming_Transaction_Amount` DECIMAL(8,2) NULL,
	`Outgoing_Transaction_Amount` DECIMAL(8,2) NULL,
	PRIMARY KEY(`Customer_Transaction_ID`),
	FOREIGN KEY(`Account_Number`) REFERENCES tbl_bank_accounts(`Account_Number`))ENGINE=INNODB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `tbl_bank_loans`(
	`Loan_ID` int(11) NOT NULL UNIQUE AUTO_INCREMENT,
	`Monthly_Payment_Rate` DECIMAL(8,2) NOT NULL,
	`Date_Of_Loan_Withdrawal` date NOT NULL,
	`First_Payment_Date` date NOT NULL,
	`Monthly_Due_Date` varchar(30) NOT NULL,
	`Number_Of_Monthly_Payments` varchar(50) NOT NULL,
	`Account_Number` int(8) NOT NULL UNIQUE,
	`Customer_Transaction_ID` int(11) NOT NULL UNIQUE,
	PRIMARY KEY(`Loan_ID`),
	FOREIGN KEY(`Account_Number`) REFERENCES tbl_bank_accounts(`Account_Number`),
	FOREIGN KEY(`Customer_Transaction_ID`) REFERENCES tbl_bank_customer_transactions(`Customer_Transaction_ID`))ENGINE=INNODB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

INSERT INTO tbl_bank_addresses(`Address_ID`, `Address_Line_1`, `Address_Line_2`,`Post_Code`, `Country`, `Town`) VALUES
(1,'251','London Road', 'NP10 8HL','Wales', 'Newport'),
(2, '95','St. Johns Road', 'HU1 1AS', 'England', 'Hull'),
(3, '8', 'New Port Close', 'OX2 1AE','England', 'Oxford'),
(4, '98', 'Roundhill Road','IV7 4AJ', 'Scotland', 'Inverness'),
(5, '3', 'Hellford Road', 'BT12 1BL','Northern Ireland', 'Belfast'),
(6, '87', 'Mill Cottage', 'NE1 1EE','England', 'Newcastle'),
(7, '38', 'Park Hall Road','NG19 8IJ', 'England', 'Nottingham'),
(8, '74', 'Ley Lane', 'BT47 2AN','Northern Ireland', 'Londonderry'),
(9, '3', 'Grove Road', 'LN6 7WF','England', 'Lincoln'),
(10, '77', 'Church Lane', 'EH11 2DS', 'Scotland', 'Edinburgh');

INSERT INTO tbl_bank_customer(`Customer_ID`, `Title`, `First_Name`, `Middle_Name(s)`, `Last_Name`, `Gender`, `DOB`,`Address_ID`, `Telephone_Number`, `Opening_Balance`) VALUES
(1,'Mr', 'David', 'Duncan', 'Jones', 'Male', '1967-06-28', '1', '01865823823', '51'),
(2,'Miss', 'Samantha', NULL, 'Marley', 'Female', '1976-08-08', '2', '07700900736', '243.93'),
(3, 'Mr', 'James', 'Elliott', 'Smith', 'Male', '1989-03-03', '3', '01865827321', '57.29'),
(4, 'Mr', 'David', 'Max', 'Miller','Male' ,'1984-06-04', '4', '01865652933', '68.58'),
(5, 'Mrs','Aurora', 'Lois', 'Oakley', 'Female', '1991-08-12', '5','01786534281', '400.00'),
(6, 'Mr', 'Kieran', NULL, 'Lakin', 'Male', '2001-12-19', '6', '07700900759', '62.00'),
(7, 'Miss','Rose', 'Elizabeth', 'Hardy', 'Female', '2000-09-25', '7', '01514960255', '84.27'),
(8, 'Mr', 'Antony', 'Elliott James', 'Scott', 'Male', '1998-12-17', '8', '02079460701', '457.20'),
(9, 'Mr','Ryan', NULL, 'Fox', 'Male', '1967-06-28', '9','01614960659', '802.67'),
(10, 'Mrs','Kay', 'Scarlett', 'Lawrence', 'Female', '1971-03-19', '10', '01134960302', '323.40');

INSERT INTO tbl_bank_accounts(`Customer_ID`, `Account_Number`, `Sort_Code`) VALUES
(1,'10909132', '070116'), #
(2,'31510604', '100000'),
(3,'29823529', '902127'),#
(4,'00813796', '800551'),
(5,'75849855', '200052'),#
(6,'12098709', '185008'),
(7,'20400952', '826632'),#
(8,'12345674', '400515'),#
(9,'01273801', '309493'),#
(10,'67037135', '600920');

INSERT INTO tbl_bank_customer_transactions(`Customer_Transaction_ID`, `Account_Number`,`Transaction_Date`,`Incoming_Transaction_Amount`,`Outgoing_Transaction_Amount`) VALUES
(1,'10909132', '2021-12-04','51', '0'),
(2,'10909132', '2021-12-05','0', '22.10'),
(3,'10909132', '2021-12-10','100', '0'),
(4,'10909132', '2021-12-20','0', '25'),
(5,'10909132', '2021-12-31','72.50', '0'),
(6,'10909132', '2022-01-04','0', '26.15'),
(7,'10909132', '2022-01-10','80', '0'),
(8,'10909132', '2022-01-11','0', '50'),
(9,'10909132', '2022-01-20','51', '0'),
(10,'10909132', '2022-01-28','0', '22.10'),
(11,'10909132', '2022-01-31','100', '0'),
(12,'10909132', '2022-02-04','0', '25'),
(13,'10909132', '2022-02-08','182.10', '0'),
(14,'10909132', '2022-02-11','0', '50'),

(15,'29823529', '2021-12-07','57.29', '0'),
(16,'29823529', '2021-12-08','0', '28.10'),
(17,'29823529', '2021-12-17','150', '0'),
(18,'29823529', '2021-12-20','0', '69.99'),
(19,'29823529', '2021-12-31','330.50', '0'),
(20,'29823529', '2022-01-01','0', '52.30'),
(21,'29823529', '2022-01-08','28.10', '0'),
(22,'29823529', '2022-01-18','0', '75'),
(23,'29823529', '2022-01-20','29.30', '0'),
(24,'29823529', '2022-01-31','82.18', '0'),
(25,'29823529', '2022-02-01','0', '80.20'),
(26,'29823529', '2022-02-08','210.47', '0'),
(27,'29823529', '2022-02-18','0', '75'),

(28,'75849855', '2021-12-10','400', '0'),
(29,'75849855', '2021-12-14','0', '18.27'),
(30,'75849855', '2021-12-15','40', '0'),
(31,'75849855', '2021-12-31','62.50', '0'),
(33,'75849855', '2022-01-06', '0', '10.82'),
(34,'75849855', '2022-01-16', '0', '20'),
(35,'75849855', '2022-01-31', '212.02', '0'),
(36,'75849855', '2022-02-03', '0', '48.58'),
(37,'75849855', '2022-02-16', '0', '20'), 

(38,'20400952', '2021-12-06','84.27', '0'),
(39,'20400952', '2021-12-20','104', '0'),
(40,'20400952', '2021-12-25','0', '65.89'),
(41,'20400952', '2022-01-10','128.04', '0'),
(42,'20400952', '2022-01-21','0', '52'),
(43,'20400952', '2022-01-25','200', '0'),
(44,'20400952', '2022-02-10', '0', '72.10'),
(45,'20400952', '2022-02-21','0', '52'),

(46,'01273801', '2021-12-10', '802.67', '0'),
(47,'01273801', '2021-12-20', '20', '0'),
(48, '01273801', '2021-12-28', '0', '482.50'),
(49, '01273801', '2022-01-10', '648', '0'),
(50, '01273801', '2022-01-21', '0', '20'),

(51,'12345674', '2021-12-01', '457.20', '0'),
(52,'12345674', '2021-12-14', '5542.80', '0'),
(53,'12345674', '2021-12-28', '0', '542.80'),

(54,'31510604', '2021-12-08', '243.93', '0'),
(55,'00813796', '2021-12-16', '68.58', '0'),
(56,'67037135', '2021-12-18', '323.40', '0');

INSERT INTO tbl_bank_loans(`Loan_ID`, `Monthly_Payment_Rate`, `Date_Of_Loan_Withdrawal`,`First_Payment_Date`, `Monthly_Due_Date`, `Number_Of_Monthly_Payments`, `Account_Number`, `Customer_Transaction_ID`) VALUES
(1, '25', '2021-12-10', '2022-01-11' ,'11th', '2 months', '10909132', '1'),
(2, '75', '2021-12-17', '2022-01-18','18th', '2 months', '29823529', '3'),
(3, '20', '2021-12-15', '2022-01-16','16th', '2 months', '75849855', '5'),
(4, '52', '2021-12-05', '2022-01-06','6th', '2 months', '20400952','7'),
(5, '20', '2021-12-20', '2022-01-21','21st', '1 months', '01273801','9');

SELECT c.`First_Name`, c.`Middle_Name(s)`, c.`Last_Name`, a.`Account_Number`
FROM tbl_bank_customer c
	INNER JOIN tbl_bank_accounts a
	ON c.Customer_ID = a.Customer_ID
    	INNER JOIN tbl_bank_loans l
    	ON a.Account_Number = l.Account_Number
	WHERE l.First_Payment_Date BETWEEN '2022-01-01' AND '2022-01-07';


SELECT c.`First_Name`, c.`Middle_Name(s)`, c.`Last_Name`, a.`Account_Number`, t.`Transaction_Date` ,t.`Incoming_Transaction_Amount`, t.`Outgoing_Transaction_Amount`
FROM tbl_bank_customer c
	INNER JOIN tbl_bank_accounts a
	ON c.Customer_ID = a.Customer_ID
	INNER JOIN tbl_bank_customer_transactions t
	ON a.Account_Number = t.Account_Number
	WHERE t.Transaction_Date BETWEEN
	'2021-12-01' AND '2021-12-05';
	

SELECT c.`First_Name`, c.`Middle_Name(s)`, c.`Last_Name`,  c.`Opening_Balance`, a.`Account_Number`,t.`Incoming_Transaction_Amount`, t.`Outgoing_Transaction_Amount`, SUM(c.`Opening_Balance` + t.`Incoming_Transaction_Amount` - t.`Outgoing_Transaction_Amount`) AS CurrentBalance
FROM tbl_bank_customer c
	INNER JOIN tbl_bank_accounts a
	ON  c.Customer_ID = a.Customer_ID
	INNER JOIN tbl_bank_customer_transactions t
	ON a.Account_Number = t.Account_Number
	GROUP BY c.Customer_ID
	HAVING CurrentBalance > 5000;
	

SELECT SUM(c.`Opening_Balance` + t.`Incoming_Transaction_Amount` - t.`Outgoing_Transaction_Amount`) as Total_Outstandings
FROM tbl_bank_customer c
	INNER JOIN tbl_bank_accounts a
	ON c.Customer_ID = a.Customer_ID
	INNER JOIN tbl_bank_customer_transactions t
	ON a.Account_Number = t.Account_Number;

CREATE PROCEDURE Loan_Due_In_7_Days()
SELECT c.`First_Name`, c.`Middle_Name(s)`, c.`Last_Name`, a.`Account_Number`
FROM tbl_bank_customer c
	INNER JOIN tbl_bank_accounts a
	ON c.Customer_ID = a.Customer_ID
    	INNER JOIN tbl_bank_loans l
    	ON a.Account_Number = l.Account_Number
	WHERE l.First_Payment_Date BETWEEN '2022-01-01' AND '2022-01-07';
call Loan_Due_In_7_Days;

CREATE PROCEDURE Transactions_Made_In_First_5_Days()
SELECT c.`First_Name`, c.`Middle_Name(s)`, c.`Last_Name`, a.`Account_Number`, t.`Transaction_Date` ,t.`Incoming_Transaction_Amount`, t.`Outgoing_Transaction_Amount`
FROM tbl_bank_customer c
	INNER JOIN tbl_bank_accounts a
	ON c.Customer_ID = a.Customer_ID
	INNER JOIN tbl_bank_customer_transactions t
	ON a.Account_Number = t.Account_Number
	WHERE t.Transaction_Date BETWEEN
	'2021-12-01' AND '2021-12-05';
call Transactions_Made_In_First_5_Days;
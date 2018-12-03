CREATE DATABASE db_libManageSys
GO



USE db_libManageSys

--create tables

CREATE TABLE Books (
	BookID INT PRIMARY KEY NOT NULL IDENTITY (10000,1),
	Title VARCHAR(100) NOT NULL,
	PublisherName VARCHAR(50) NOT NULL
);

CREATE TABLE Book_Authors (
	BookID INT NOT NULL,
	AuthorName VARCHAR(50) NOT NULL
);

CREATE TABLE Library_Branch (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BranchName VARCHAR(50) NOT NULL,
	Address VARCHAR(50) NOT NULL
);

CREATE TABLE Borrower (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY (1000,1),
	Name VARCHAR(50) NOT NULL,
	Address VARCHAR(50) NOT NULL,
	Phone VARCHAR(15)
);

CREATE TABLE Book_Loans (
	BookID INT NOT NULL,
	BranchID INT NOT NULL,
	CardNo INT NOT NULL,
	DateOut DATE NOT NULL,
	DateDue DATE NOT NULL
);

CREATE TABLE Publisher (
	PublisherName VARCHAR(50) PRIMARY KEY NOT NULL,
	Address VARCHAR(50) NOT NULL,
	Phone VARCHAR(15) NOT NULL
);

CREATE TABLE Book_Copies (
	BookID INT NOT NULL,
	BranchID INT NOT NULL,
	Number_Of_Copies INT NOT NULL
);

--insert data into tables

INSERT INTO Books
	(Title, PublisherName)
	VALUES
	('The Lost Tribe', 'Picador'),
	('The Talisman', 'Viking'),
	('It', 'Viking'),
	('The Running Man', 'Signet Books'),
	('Harry Potter and the Chamber of Secrets', 'Bloomsbury'),
	('Life of Pi', 'Canongate'),
	('Labyrinth', 'Orion'),
	('Fire & Blood', 'Bantam'),
	('Target', 'Little Brown and Company'),
	('Look Alive Tweny-Five', 'G.P. Putnam''s Sons'),
	('Every Breath', 'Grand Central Publishing'),
	('The Reckoning', 'Doubleday Books'),
	('Past Tense', 'Delecorte Press'),
	('Elevation', 'Scribner Book Company'),
	('Dark Sacred Night', 'Little Brown and Company'),
	('A Spark of Light', 'Ballantine Books'),
	('Where the Crawdads Sing', 'G.P. Putnam''s Sons'),
	('Sea of Greed', 'G.P. Putnam''s Sons'),
	('You Don''t Own Me', 'Simon & Schuster'),
	('Ambush', 'Little Brown and Company'),
	('The Noel Stranger', 'Simon & Schuster')
;
GO
SELECT * FROM Books
GO

INSERT INTO Book_Authors
	(AuthorName)
	VALUES
	('Mark Lee'),
	('Stephen King'),
	('Stephen King'),
	('Stephen King'),
	('J.K. Rowling'),
	('Yann Martel'),
	('Kate Mosse'),
	('George R R Martin'),
	('James Patterson'),
	('Janet Evanovich'),
	('Nicholas Sparks'),
	('John Grishman'),
	('Lee Child'),
	('Stephen King'),
	('Michael Connelly'),
	('Jodi Picoult'),
	('Delia Owens'),
	('Clive Cussler'),
	('Mary Higgins Clark'),
	('James Patterson'),
	('Richard Paul Evans')
;
GO
SELECT * FROM Book_Authors
GO

INSERT INTO Library_Branch
	(BranchName, Address)
	VALUES
	('Sharpstown', '123 Book Blvd'),
	('Central', '456 Main St'),
	('University', '789 College Ave'),
	('State', '1048 Capital Hwy')
;
GO
SELECT * FROM Library_Branch
GO

INSERT INTO Borrower
	(Name, Address, Phone)
	VALUES
	('Billy Bob', '4125 River Rd', '555-555-1234'),
	('Lisa Thompson', '6294 Lakeview Rd', '555-555-3729'),
	('Sara Williams', '7283 12th Ave', '555-555-9284'),
	('David Wilson', '432 Burnside Blvd', '555-555-1294'),
	('Anna Martinez', '4832 Stark St', '555-555-9875'),
	('Andrew Shultz', '542 Front St', '555-555-3892'),
	('Lou Henry', '8592 Division Ave', '555-555-9283'),
	('Kristi Anderson', '730 Maple St', '555-555-9583'),
	('Mike Sampson', '532 Hall Blvd', '555-555-9320'),
	('Rita Davies', '6293 17th St', '555-555-7233')
;
GO
SELECT * FROM Borrower
GO

INSERT INTO Publisher
	(PublisherName, Address, Phone)
	VALUES
	('Picador', '382 Industry Ave', '444-444-8192'),
	('Viking', '81923 Nordic Blvd', '444-444-1428'),
	('Signet Books', '723 Left Ln', '444-444-9123'),
	('Bloomsbury', '952 Onion Ave', '444-444-7234'),
	('Canongate', 'Napolean St', '444-444-8324'),
	('Orion', 'Constellation Cr', '444-444-6523'),
	('Bantam', '38523 Boundary Rd', '444-444-1273'),
	('Little Brown and Company', '733 Charlie Ct', '444-444-7723'),
	('G.P. Putnam''s Sons', '88823 Flint St', '444-444-1299'),
	('Grand Central Publishing', '1288 Underpass Hwy', '444-444-7283'),
	('Doubleday Books', '777 Lucky Ln', '444-444-2221'),
	('Delecorte Press', '84921 6th Ave', '444-444-8911'),
	('Scribner Book Company', '111 Main St', '444-444-4441'),
	('Ballantine Books', '9009 Page St', '444-444-4448'),
	('Simon & Schuster', '7329 Orange Grove Lp', '444-444-9912')
;
GO
SELECT * FROM Publisher
GO

INSERT INTO Book_Copies
	(BookID, BranchID, Number_Of_Copies)
	VALUES
	(10000, 1, 5),
	(10000, 2, 5),
	(10000, 3, 5),
	(10000, 4, 5),
	(10001, 1, 5),
	(10001, 2, 5),
	(10001, 3, 5),
	(10001, 4, 5),
	(10002, 1, 5),
	(10002, 2, 5),
	(10002, 3, 5),
	(10002, 4, 5),
	(10003, 1, 5),
	(10003, 2, 5),
	(10003, 3, 5),
	(10003, 4, 5),
	(10004, 1, 5),
	(10004, 2, 5),
	(10004, 3, 5),
	(10004, 4, 5),
	(10005, 1, 5),
	(10005, 2, 5),
	(10005, 3, 5),
	(10005, 4, 5),
	(10006, 1, 5),
	(10006, 2, 5),
	(10006, 3, 5),
	(10006, 4, 5),
	(10007, 1, 5),
	(10007, 2, 5),
	(10007, 3, 5),
	(10007, 4, 5),
	(10008, 1, 5),
	(10008, 2, 5),
	(10008, 3, 5),
	(10008, 4, 5),
	(10009, 1, 5),
	(10009, 2, 5),
	(10009, 3, 5),
	(10009, 4, 5),
	(10010, 1, 5),
	(10010, 2, 5),
	(10010, 3, 5),
	(10010, 4, 5),
	(10011, 1, 5),
	(10011, 2, 5),
	(10011, 3, 5),
	(10011, 4, 5),
	(10012, 1, 5),
	(10012, 2, 5),
	(10012, 3, 5),
	(10012, 4, 5),
	(10013, 1, 5),
	(10013, 2, 5),
	(10013, 3, 5),
	(10013, 4, 5),
	(10014, 1, 5),
	(10014, 2, 5),
	(10014, 3, 5),
	(10014, 4, 5),
	(10015, 1, 5),
	(10015, 2, 5),
	(10015, 3, 5),
	(10015, 4, 5),
	(10016, 1, 5),
	(10016, 2, 5),
	(10016, 3, 5),
	(10016, 4, 5),
	(10017, 1, 5),
	(10017, 2, 5),
	(10017, 3, 5),
	(10017, 4, 5),
	(10018, 1, 5),
	(10018, 2, 5),
	(10018, 3, 5),
	(10018, 4, 5),
	(10019, 1, 5),
	(10019, 2, 5),
	(10019, 3, 5),
	(10019, 4, 5),
	(10020, 1, 5),
	(10020, 2, 5),
	(10020, 3, 5),
	(10020, 4, 5),
	(10021, 1, 5),
	(10021, 2, 5),
	(10021, 3, 5),
	(10021, 4, 5)
;
GO
SELECT * FROM Book_Copies
GO

INSERT INTO Book_Loans
	(BookID, BranchID, CardNo, DateOut, DateDue)
	VALUES
	(10000, 1, 1000, '1972-10-22', '1972-11-22'),
	(10001, 1, 1000, '2018-11-02', '2018-12-02'),
	(10002, 1, 1000, '2018-11-20', '2018-12-20'),
	(10003, 1, 1000, '2018-11-03', '2018-12-03'),
	(10004, 1, 1000, '2017-09-07', '2017-10-07'),
	(10005, 1, 1000, '2014-06-06', '2014-07-06'),
	(10006, 1, 1000, '2017-11-11', '2017-12-11'),
	(10000, 1, 1003, '1972-10-22', '1972-11-22'),
	(10001, 1, 1003, '2018-11-02', '2018-12-02'),
	(10002, 1, 1003, '2018-11-20', '2018-12-20'),
	(10003, 1, 1003, '2018-11-03', '2018-12-03'),
	(10004, 1, 1003, '2017-09-07', '2017-10-07'),
	(10005, 1, 1003, '2014-06-06', '2014-07-06'),
	(10006, 1, 1003, '2017-11-11', '2017-12-11'),
	(10010, 1, 1005, '2018-11-02', '2018-12-02'),
	(10012, 1, 1005, '2018-11-20', '2018-12-20'),
	(10015, 1, 1005, '2018-11-03', '2018-12-03'),
	(10001, 1, 1007, '2018-11-02', '2018-12-02'),
	(10002, 1, 1007, '2018-11-20', '2018-12-20'),
	(10003, 1, 1007, '2018-11-03', '2018-12-03'),
	(10010, 2, 1002, '2018-11-02', '2018-12-02'),
	(10012, 2, 1002, '2018-11-20', '2018-12-20'),
	(10015, 2, 1002, '2018-11-03', '2018-12-03'),
	(10018, 2, 1004, '2018-11-03', '2018-12-03'),
	(10020, 2, 1004, '2018-11-20', '2018-12-20'),
	(10021, 2, 1004, '2018-11-03', '2018-12-03'),
	(10019, 3, 1004, '2017-11-02', '2018-12-02'),
	(10020, 3, 1004, '2017-11-20', '2018-12-20'),
	(10021, 3, 1004, '2017-11-03', '2018-12-03'),
	(10011, 4, 1007, '1972-10-22', '1972-11-22'),
	(10012, 4, 1007, '2018-11-02', '2018-12-02'),
	(10013, 4, 1007, '2018-11-20', '2018-12-20'),
	(10014, 4, 1007, '2018-11-03', '2018-12-03'),
	(10015, 4, 1007, '2017-09-07', '2017-10-07'),
	(10016, 4, 1007, '2014-06-06', '2014-07-06'),
	(10017, 4, 1007, '2017-11-11', '2017-12-11'),
	(10000, 4, 1008, '1972-10-22', '1972-11-22'),
	(10001, 4, 1008, '2018-11-02', '2018-12-02'),
	(10002, 4, 1008, '2018-11-20', '2018-12-20'),
	(10003, 4, 1008, '2018-11-03', '2018-12-03'),
	(10004, 4, 1008, '2017-09-07', '2017-10-07'),
	(10005, 4, 1008, '2014-06-06', '2014-07-06'),
	(10006, 4, 1008, '2017-11-11', '2017-12-11'),
	(10000, 2, 1001, '1972-10-22', '1972-11-22'),
	(10001, 2, 1001, '2018-11-02', '2018-12-02'),
	(10002, 2, 1001, '2018-11-20', '2018-12-20'),
	(10003, 2, 1001, '2018-11-03', '2018-12-03'),
	(10004, 2, 1001, '2017-09-07', '2017-10-07'),
	(10005, 2, 1001, '2014-06-06', '2014-07-06'),
	(10006, 2, 1001, '2017-11-11', '2017-12-11'),
	(10000, 3, 1006, '1972-10-22', '1972-11-22'),
	(10006, 3, 1006, '2018-11-02', '2018-12-02'),
	(10008, 3, 1006, '2018-11-20', '2018-12-20'),
	(10014, 3, 1006, '2018-11-03', '2018-12-03'),
	(10015, 3, 1006, '2017-09-07', '2017-10-07'),
	(10016, 3, 1006, '2014-06-06', '2014-07-06'),
	(10017, 3, 1006, '2017-11-11', '2017-12-11'),
	(10019, 3, 1006, '1972-10-22', '1972-11-22'),
	(10021, 3, 1006, '2018-11-02', '2018-12-02')
;
GO	  
SELECT * FROM Book_Loans
GO
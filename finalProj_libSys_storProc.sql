USE db_libManageSys
GO

--Return number of copies: "The Lost Tribe" owned by the Sharpstown branch

CREATE PROC dbo.uspcountSharpstown
	@title VARCHAR(50), @branch VARCHAR(50)
	AS
	SELECT
	book.Title, cop.Number_Of_Copies AS 'Number of Copies', branch.BranchName AS 'Branch'
	FROM Book_Copies cop
	INNER JOIN Library_Branch branch ON cop.BranchID = branch.BranchID
	INNER JOIN Books book ON cop.BookID = book.BookID
	WHERE 
	book.Title = @title
	AND branch.BranchName = @branch
;

GO
EXEC dbo.uspcountSharpstown @title = 'The Lost Tribe', @branch = 'Sharpstown'
GO

--Return number of copies: The Lost Tribe owned by each branch

CREATE PROC dbo.uspAllBranchCountTribe
	@bookTitle VARCHAR(50)
	AS
	SELECT
	bran.BranchName AS 'Branch', cop.Number_Of_Copies AS 'Number of Copies'
	FROM Book_Copies cop
	INNER JOIN Library_Branch bran ON cop.BranchID = bran.BranchID
	INNER JOIN Books book ON cop.BookID = book.BookID
	WHERE
	book.Title = @bookTitle
;

GO
EXEC dbo.uspAllBranchCountTribe @bookTitle = 'The Lost Tribe'
GO

--Retrieve names of borrows without books on loan using EXCEPT operator

CREATE PROC dbo.uspNullLoans
	AS
	SELECT
	Name
	FROM
	Borrower

	EXCEPT
	
	SELECT
	bor.Name
	FROM Borrower bor
	INNER JOIN Book_Loans loan ON bor.CardNo = loan.CardNo
;

GO
EXEC dbo.uspNullLoans
GO

/*For each book loaned from Sharpstown branch with a due date of today, retrieve: Title, Borrower's Name and 
Borrower's Address*/

CREATE PROC dbo.uspDueLoanInfo 
	@branchName VARCHAR(50), 
	@date VARCHAR(50)
	AS
	SELECT
	book.Title, bor.Name, bor.Address
	FROM Book_Loans loan
	INNER JOIN Books book ON loan.BookID = book.BookID
	INNER JOIN Borrower bor ON bor.CardNo = loan.CardNo
	INNER JOIN Library_Branch bran ON loan.BranchID = bran.BranchID
	WHERE
	bran.BranchName = @branchName
	AND
	loan.DateDue = @date	
;

GO
EXEC dbo.uspDueLoanInfo @branchName = 'Sharpstown', @date = '2018-12-02'
GO

--For each branch, retrieve: Branch Name and Total number of books on loan

CREATE PROC dbo.uspLoanTotalAllBranch
	AS
	SELECT
	branch.BranchName AS 'Branch', COUNT(loan.BranchID) AS 'Total On-Loan'
	FROM Book_Loans loan
	INNER JOIN Library_Branch branch ON loan.BranchID = branch.BranchID
	GROUP BY branch.BranchName
;

GO
EXEC dbo.uspLoanTotalAllBranch
GO

/*For all borrowers with > 5 books on loan, retrieve: Name, Address and Number of Books on-loan*/

CREATE PROC dbo.uspBorrowerHighBalance
	AS
	SELECT
	bor.Name, bor.Address, COUNT(loan.CardNo) AS 'Total On-Loan'
	FROM Borrower bor
	INNER JOIN Book_Loans loan ON bor.CardNo = loan.CardNo
	GROUP BY bor.Name, bor.Address
	HAVING COUNT(loan.CardNo) > 5
;

GO
EXEC dbo.uspBorrowerHighBalance
GO

/*For each book authored by Stephen King located at Central library, retrieve: Title and Number of copies owned by branch*/

CREATE PROC dbo.uspKingBookCount
	@authName VARCHAR(50),
	@branchName VARCHAR(50)
	AS
	SELECT
	book.Title, auth.AuthorName AS 'Author', cop.Number_Of_Copies AS 'Total Copies', bran.BranchName AS 'Branch'
	FROM Books book
	INNER JOIN Book_Copies cop ON book.BookID = cop.BookID
	INNER JOIN Book_Authors auth ON cop.BookID = auth.BookID
	INNER JOIN Library_Branch bran ON cop.BranchID = bran.BranchID
	WHERE
	auth.AuthorName = @authName
	AND bran.BranchName = @branchName
;

GO
EXEC dbo.uspKingBookCount @authName = 'Stephen King', @branchName = 'Central'
GO
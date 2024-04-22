-- Title: library_create_views.sql
-- Description: this script generates views for the library datbase schema.
-- Author: Kendall Whitbeck

USE library2;

-- Drop views to recreate, if necessary
DROP VIEW Available_Book_Copies;
DROP VIEW Loan_Details;
DROP VIEW Overdue_Loans;
DROP VIEW Member_Loans;

-- 1. Create a view to display all book copies available for loan:
CREATE VIEW Available_Book_Copies AS 
SELECT Book_Copy.book_copy_id, Book.title, Book.author, Book.publisher, Book.genre 
FROM Book_Copy
INNER JOIN Book ON Book_Copy.book_id = Book.book_id
WHERE Book_Copy.status = 'Available'
;

-- 2. Create a view to display all loan records with their corresponding book, ebook, or audiobook titles:
CREATE VIEW Loan_Details AS
SELECT Loan.loan_id, Member.first_name, Member.last_name, 
CASE 
    WHEN Loan.book_copy_id IS NOT NULL THEN Book.title
    WHEN Loan.ebook_copy_id IS NOT NULL THEN Ebook.title
    ELSE Audiobook.title
END AS item_title,
CASE 
    WHEN Loan.book_copy_id IS NOT NULL THEN 'Book'
    WHEN Loan.ebook_copy_id IS NOT NULL THEN 'Ebook'
    ELSE 'Audiobook'
END AS item_type,
Loan.borrowed_date, Loan.due_date, Loan.return_date
FROM Loan
INNER JOIN Member ON Loan.member_id = Member.member_id
LEFT JOIN Book_Copy ON Loan.book_copy_id = Book_Copy.book_copy_id
LEFT JOIN Ebook_Copy ON Loan.ebook_copy_id = Ebook_Copy.ebook_copy_id
LEFT JOIN Audiobook_Copy ON Loan.audiobook_copy_id = Audiobook_Copy.audiobook_copy_id
LEFT JOIN Book ON Book_Copy.book_id = Book.book_id
LEFT JOIN Ebook ON Ebook_Copy.ebook_id = Ebook.ebook_id
LEFT JOIN Audiobook ON Audiobook_Copy.audiobook_id = Audiobook.audiobook_id
;

-- 3. Create a view to display all overdue loans assuming current date is 2022-02-20:
CREATE VIEW Overdue_Loans AS
SELECT Loan.loan_id, Member.first_name, Member.last_name, 
CASE 
    WHEN Loan.book_copy_id IS NOT NULL THEN Book.title
    WHEN Loan.ebook_copy_id IS NOT NULL THEN Ebook.title
    ELSE Audiobook.title
END AS item_title,
CASE 
    WHEN Loan.book_copy_id IS NOT NULL THEN 'Book'
    WHEN Loan.ebook_copy_id IS NOT NULL THEN 'Ebook'
    ELSE 'Audiobook'
END AS item_type,
Loan.due_date
FROM Loan
INNER JOIN Member ON Loan.member_id = Member.member_id
LEFT JOIN Book_Copy ON Loan.book_copy_id = Book_Copy.book_copy_id
LEFT JOIN Ebook_Copy ON Loan.ebook_copy_id = Ebook_Copy.ebook_copy_id
LEFT JOIN Audiobook_Copy ON Loan.audiobook_copy_id = Audiobook_Copy.audiobook_copy_id
LEFT JOIN Book ON Book_Copy.book_id = Book.book_id
LEFT JOIN Ebook ON Ebook_Copy.ebook_id = Ebook.ebook_id
LEFT JOIN Audiobook ON Audiobook_Copy.audiobook_id = Audiobook.audiobook_id
WHERE Loan.return_date IS NULL AND Loan.due_date < '2022-02-20' 
;

-- 4. Create a view to display all the loans made by a specific member:
CREATE VIEW Member_Loans AS
SELECT Loan.loan_id, Member.first_name, Member.last_name, 
CASE 
    WHEN Loan.book_copy_id IS NOT NULL THEN Book.title
    WHEN Loan.ebook_copy_id IS NOT NULL THEN Ebook.title
    ELSE Audiobook.title
END AS item_title,
CASE 
    WHEN Loan.book_copy_id IS NOT NULL THEN 'Book'
    WHEN Loan.ebook_copy_id IS NOT NULL THEN 'Ebook'
    ELSE 'Audiobook'
END AS item_type,
Loan.borrowed_date, Loan.due_date, Loan.return_date
FROM Loan
INNER JOIN Member ON Loan.member_id = Member.member_id
LEFT JOIN Book_Copy ON Loan.book_copy_id = Book_Copy.book_copy_id
LEFT JOIN Ebook_Copy ON Loan.ebook_copy_id = Ebook_Copy.ebook_copy_id
LEFT JOIN Audiobook_Copy ON Loan.audiobook_copy_id = Audiobook_Copy.audiobook_copy_id
LEFT JOIN Book ON Book_Copy.book_id = Book.book_id
LEFT JOIN Ebook ON Ebook_Copy.ebook_id = Ebook.ebook_id
LEFT JOIN Audiobook ON Audiobook_Copy.audiobook_id = Audiobook.audiobook_id
WHERE Member.member_id = 2
;

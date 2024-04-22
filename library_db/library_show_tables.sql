-- Title: library_show_tables.sql
-- Description: this script shows the tables and views with current data for the library datbase schema.
-- Author: Kendall Whitbeck

USE library2;

SHOW TABLES;

-- Display all tuples from all tables in Results Grid
SELECT * FROM book;
SELECT * FROM ebook;
SELECT * FROM audiobook;
SELECT * FROM Book_Copy;
SELECT * FROM Ebook_Copy;
SELECT * FROM Audiobook_Copy;
SELECT * FROM member;
SELECT * FROM hold;
SELECT * FROM loan;

-- count the total number of copies in the fantasy genre for books, ebooks, audiobooks, & combined in the library database
SELECT
  (SELECT COALESCE(SUM(num_copies), 0) FROM Book WHERE genre = 'Fantasy') AS total_fantasy_book_copies,
  (SELECT COALESCE(SUM(num_copies), 0) FROM Ebook WHERE genre = 'Fantasy') AS total_fantasy_ebook_copies,
  (SELECT COALESCE(SUM(num_copies), 0) FROM Audiobook WHERE genre = 'Fantasy') AS total_fantasy_audiobook_copies,
  (SELECT COALESCE(SUM(num_copies), 0) FROM Book WHERE genre = 'Fantasy') + 
  (SELECT COALESCE(SUM(num_copies), 0) FROM Ebook WHERE genre = 'Fantasy') + 
  (SELECT COALESCE(SUM(num_copies), 0) FROM Audiobook WHERE genre = 'Fantasy') AS total_fantasy_item_copies;

-- Display all tuples from all Views in Results Grid
SELECT * FROM Available_Book_Copies;
SELECT * FROM Loan_Details;
SELECT * FROM Overdue_Loans;
SELECT * FROM Member_Loans;

-- Display Constraint
select COLUMN_NAME, CONSTRAINT_NAME, REFERENCED_COLUMN_NAME, REFERENCED_TABLE_NAME
from information_schema.KEY_COLUMN_USAGE
where TABLE_NAME = 'Loan';
show create table Loan;
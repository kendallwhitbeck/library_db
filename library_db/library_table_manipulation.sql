-- Title: library_table_manipulation.sql
-- Description: this script exists to make varying modifications to the library datbase schema.
-- Author: Kendall Whitbeck

USE library2;
DELETE FROM book WHERE book_id IS NULL;

-- make ISAN and DOI attributes default to Null
USE library2;
ALTER TABLE Audiobook MODIFY COLUMN isan VARCHAR(255) DEFAULT NULL;
ALTER TABLE ebook MODIFY COLUMN doi VARCHAR(255) DEFAULT NULL;

-- clean out tables and enable auto increment where the primary keys start at 1
DELETE FROM Book; ALTER TABLE book AUTO_INCREMENT = 1;
DELETE FROM Ebook; ALTER TABLE ebook AUTO_INCREMENT = 1;
DELETE FROM Audiobook; ALTER TABLE audiobook AUTO_INCREMENT = 1;
DELETE FROM Book_Copy; ALTER TABLE Book_Copy AUTO_INCREMENT = 1;
DELETE FROM Ebook_Copy; ALTER TABLE Ebook_Copy AUTO_INCREMENT = 1;
DELETE FROM Audiobook_Copy; ALTER TABLE Audiobook_Copy AUTO_INCREMENT = 1;
DELETE FROM Loan; ALTER TABLE Loan AUTO_INCREMENT = 1;
DELETE FROM Reservation; ALTER TABLE Reservation AUTO_INCREMENT = 1;
DELETE FROM Member; ALTER TABLE Member AUTO_INCREMENT = 1;

-- Update the foreign keys in Reservation table to match the new schema:
    -- drop the foreign keys
ALTER TABLE Reservation DROP FOREIGN KEY reservation_ibfk_2;
ALTER TABLE Reservation DROP FOREIGN KEY reservation_ibfk_3;
ALTER TABLE Reservation DROP FOREIGN KEY reservation_ibfk_4;
    -- then drop the columns
ALTER TABLE Reservation DROP COLUMN book_copy_id;
ALTER TABLE Reservation DROP COLUMN ebook_copy_id;
ALTER TABLE Reservation DROP COLUMN audiobook_copy_id;
    -- then add the desired columns
ALTER TABLE Reservation
	ADD COLUMN book_id INT,
	ADD COLUMN ebook_id INT,
	ADD COLUMN audiobook_id INT;
    -- Then add the new foreign keys that reference the main tables (Book, Ebook, and Audiobook)
ALTER TABLE Reservation ADD FOREIGN KEY (book_id) REFERENCES Book(book_id);
ALTER TABLE Reservation ADD FOREIGN KEY (ebook_id) REFERENCES Ebook(ebook_id);
ALTER TABLE Reservation ADD FOREIGN KEY (audiobook_id) REFERENCES Audiobook(audiobook_id);

SHOW COLUMNS FROM Reservation LIKE 'book_copy_id';
ALTER TABLE Reservation DROP FOREIGN KEY book_copy_id;
ALTER TABLE Reservation DROP COLUMN book_copy_id;

-- clean out the Book relation so that only books with book_id between 1 and 10 remain
DELETE FROM Book
WHERE book_id > 10;

-- update "Reservation" nomenclature to "Hold"
RENAME TABLE library2.Reservation TO library2.Hold;
    -- replace text in all column names of the Hold table
ALTER TABLE Hold
RENAME COLUMN reservation_id TO hold_id,
RENAME COLUMN reservation_date TO hold_date,
RENAME COLUMN reservation_status TO hold_status;

-- Add foreign key to Loan table referencing hold_id
USE library2;
ALTER TABLE Loan ADD COLUMN hold_id INT DEFAULT NULL;
ALTER TABLE Loan ADD FOREIGN KEY (hold_id) REFERENCES Hold(hold_id);

-- Update Member Addresses
-- change the address of member_id = 2 in the table called "member" to "123 Main St" 
UPDATE member
SET address = '123 Main St'
WHERE member_id = 2;
-- change the address of member_id = 7 in the table called "member" to "691 Elm St" 
UPDATE member
SET address = '691 Elm St'
WHERE member_id = 7;
-- change the address of member_id = 5 in the table called "member" to "309 Pine Rd" 
UPDATE member
SET address = '309 Pine Rd'
WHERE member_id = 5;

-- Insert Harry Potter and the Sorcerers Stone into the Book relation w/ an erroneous 33 copies
INSERT INTO Book (isbn, title, author, publisher, publication_year, genre, num_copies) VALUES
('9780593453654', 'Harry Potter and the Sorcerers Stone', 'J.K. Rowling', 'Scholastic Inc.', 1997, 'Fantasy', 33);

-- Delete extra row of Harry Potter and the Sorcerers Stone with erroneous 33 copies
DELETE FROM book
WHERE num_copies > 10;

-- Delete Harry Potter and the Sorcerers Stone from Book Relation
DELETE FROM book
WHERE book_id = 8;

-- Delete check_loan_medium_type constraint
ALTER TABLE Loan DROP CONSTRAINT check_loan_medium_type;
ALTER TABLE Loan DROP CONSTRAINT check_loan_medium_type2;

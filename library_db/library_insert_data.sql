-- Title: library_insert_data.sql
-- Description: this script inserts data into and updates the library datbase schema.
-- Author: Kendall Whitbeck

USE library2;

-- Insert 10 books into the Book table
INSERT INTO Book (isbn, title, author, publisher, publication_year, genre, num_copies) VALUES
('9780140283330', 'To Kill a Mockingbird', 'Harper Lee', 'Penguin Random House', 1960, 'Fiction', 5),
('9780545010221', 'Harry Potter and the Chamber of Secrets', 'J.K. Rowling', 'Scholastic Inc.', 1998, 'Fantasy', 3),
('9780345538376', '1984', 'George Orwell', 'Penguin Random House', 1949, 'Science Fiction', 2),
('9780061120084', 'Life of Pi', 'Yann Martel', 'Houghton Mifflin Harcourt', 2001, 'Fiction', 4),
('9780547928227', 'The Hobbit', 'J.R.R. Tolkien', 'Houghton Mifflin Harcourt', 1937, 'Fantasy', 3),
('9780593139134', 'Atomic Habits', 'James Clear', 'Penguin Random House', 2018, 'Self-help', 2),
('9780593230892', 'The Midnight Library', 'Matt Haig', 'Penguin Random House', 2020, 'Fiction', 1),
('9780593453654', 'Harry Potter and the Sorcerers Stone', 'J.K. Rowling', 'Scholastic Inc.', 1997, 'Fantasy', 3),
('9780593152522', 'Star Wars Light of the Jedi', 'Charles Soule', 'Random House Publishing Group', 2021, 'Science Fiction', 2),
('9781523505745', 'I Will Teach You to Be Rich', 'Ramit Sethi', 'Workman Publishing', 2009, 'Personal Finance', 1);

-- Insert 10 ebooks into the EBook table
INSERT INTO EBook (title, author, publisher, doi, publication_year, genre, num_copies) VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', 'Scribner', '10.1080/00111619.2014.942814', 1925, 'Fiction', 2),
('The Catcher in the Rye', 'J.D. Salinger', 'Little, Brown and Company', '10.4324/9781315161066', 1951, 'Fiction', 1),
('The Alchemist', 'Paulo Coelho', 'HarperCollins', '10.1590/S0104-40362009000400022', 1988, 'Fiction', 3),
('The Girl with the Dragon Tattoo', 'Stieg Larsson', 'Norstedts förlag', '10.1093/gww/9780199229704.001.0001', 2005, 'Mystery', 3),
('The Hunger Games', 'Suzanne Collins', 'Scholastic', '10.1002/9780470939384.ch13', 2008, 'Science Fiction', 4),
('The Da Vinci Code', 'Dan Brown', 'Doubleday', '10.1145/1284621.1284669', 2003, 'Mystery', 2),
('The Lord of the Rings', 'J.R.R. Tolkien', 'George Allen & Unwin', '10.1111/j.1467-985X.1978.tb00876.x', 1954, 'Fantasy', 3),
('Harry Potter and the Deathly Hallows', 'J.K. Rowling', 'Bloomsbury Publishing', '10.1093/actrade/9780199538191.book.1', 2007, 'Fantasy', 5),
('1984', 'George Orwell', 'Secker & Warburg', '10.1038/nature04131', 1949, 'Science Fiction', 2),
('To Kill a Mockingbird', 'Harper Lee', 'J. B. Lippincott & Co.', '10.1038/350531a0', 1960, 'Fiction', 3);

-- Insert 10 audiobooks into the Audiobook table
INSERT INTO Audiobook (title, author, publisher, publication_year, genre, num_copies) VALUES
('Ready Player Two', 'Ernest Cline', 'Random House Publishing Group', 2020, 'Science Fiction', 2),
('The Silent Patient', 'Alex Michaelides', 'Celadon Books', 2019, 'Mystery', 3),
('Where the Crawdads Sing', 'Delia Owens', 'Penguin Random House', 2018, 'Fiction', 5),
('Project Hail Mary', 'Andy Weir', 'Random House Publishing Group', 2021, 'Science Fiction', 2),
('The Four Winds', 'Kristin Hannah', 'St. Martin''s Publishing Group', 2021, 'Historical Fiction', 2),
('The Code Breaker', 'Walter Isaacson', 'Simon & Schuster', 2021, 'Non-fiction', 1),
('No One Succeeds Alone', 'Robert Reffkin', 'Houghton Mifflin Harcourt', 2021, 'Business', 1),
('Empire of Pain', 'Patrick Radden Keefe', 'Knopf Doubleday Publishing Group', 2021, 'Non-fiction', 3),
('Becoming', 'Michelle Obama', 'Crown', 2018, 'Autobiography', 4),
('The Martian', 'Andy Weir', 'Random House Publishing Group', 2011, 'Science Fiction', 2);

-- Insert 10 book copies into the Book_Copy table
INSERT INTO Book_Copy (status, allowable_loan_period, book_id) VALUES
('Available', 14, 1),
('Checked Out', 14, 1),
('Available', 14, 2),
('Available', 14, 3),
('Checked Out', 14, 3),
('Available', 14, 4),
('Checked Out', 14, 4),
('Available', 14, 5),
('Checked Out', 14, 6),
('Available', 14, 7);

-- Insert 10 ebook copies into the Ebook_Copy table
INSERT INTO Ebook_Copy (status, allowable_loan_period, ebook_id) VALUES
('Available', 14, 1),
('Checked Out', 14, 1),
('Available', 14, 2),
('Available', 14, 3),
('Checked Out', 14, 3),
('Available', 14, 4),
('Checked Out', 14, 4),
('Available', 14, 5),
('Checked Out', 14, 6),
('Available', 14, 7);

-- Insert 10 audiobook copies into the Audiobook_Copy table
INSERT INTO Audiobook_Copy (status, allowable_loan_period, audiobook_id) VALUES
('Available', 14, 1),
('Checked Out', 14, 1),
('Available', 14, 2),
('Checked Out', 14, 3),
('Available', 14, 3),
('Checked Out', 14, 4),
('Available', 14, 5),
('Checked Out', 14, 6),
('Available', 14, 7),
('Checked Out', 14, 8);

-- Insert 10 members into the Member table
INSERT INTO Member (first_name, last_name, address, contact_details, membership_type, membership_status) VALUES
('John', 'Doe', '123 Main St', 'john.doe@email.com', 'Premium', 'Active'),
('Jane', 'Doe', '456 Broadway', 'jane.doe@email.com', 'Basic', 'Active'),
('Bob', 'Smith', '789 Park Ave', 'bob.smith@email.com', 'Premium', 'Inactive'),
('Alice', 'Johnson', '246 Elm St', 'alice.johnson@email.com', 'Basic', 'Active'),
('Tom', 'Wilson', '135 Main St', 'tom.wilson@email.com', 'Premium', 'Inactive'),
('Sara', 'Jones', '246 Park Ave', 'sara.jones@email.com', 'Basic', 'Flagged'),
('Mike', 'Brown', '246 Park Ave', 'mike.brown@email.com', 'Premium', 'Active'),
('Jen', 'Lee', '135 Main St', 'jen.lee@email.com', 'Basic', 'Inactive'),
('David', 'Clark', '246 Elm St', 'david.clark@email.com', 'Premium', 'Active'),
('Mary', 'Allen', '789 Park Ave', 'mary.allen@email.com', 'Basic', 'Inactive');

-- Insert 10 holds into the Hold table
INSERT INTO Hold (hold_date, hold_status, member_id, book_id, ebook_id, audiobook_id) VALUES
('2023-02-18', 'Pending', 1, 1, NULL, NULL),
('2023-02-18', 'Pending', 2, NULL, 1, NULL),
('2023-02-18', 'Pending', 3, NULL, NULL, 1),
('2023-02-18', 'Pending', 4, 2, NULL, NULL),
('2023-02-18', 'Pending', 5, NULL, 2, NULL),
('2023-02-18', 'Pending', 6, NULL, NULL, 2),
('2023-02-18', 'Pending', 7, 3, NULL, NULL),
('2023-02-18', 'Pending', 8, NULL, 3, NULL),
('2023-02-18', 'Pending', 9, NULL, NULL, 3),
('2023-02-18', 'Pending', 10, 4, NULL, NULL);

-- Insert 10 loans into the Loan table
INSERT INTO Loan (member_id, book_copy_id, ebook_copy_id, audiobook_copy_id, borrowed_date, due_date, return_date) VALUES
(1, 1, NULL, NULL, '2022-02-01', '2022-02-15', NULL),
(2, NULL, 2, NULL, '2022-02-02', '2022-02-16', NULL),
(3, NULL, NULL, 3, '2022-02-03', '2022-02-17', NULL),
(1, NULL, 4, NULL, '2022-02-04', '2022-02-18', NULL),
(2, 5, NULL, NULL, '2022-02-05', '2022-02-19', NULL),
(3, NULL, 6, NULL, '2022-02-06', '2022-02-20', NULL),
(1, NULL, NULL, 7, '2022-02-07', '2022-02-21', NULL),
(2, 8, NULL, NULL, '2022-02-08', '2022-02-22', NULL),
(3, NULL, 9, NULL, '2022-02-09', '2022-02-23', NULL),
(1, NULL, 10, NULL, '2022-02-10', '2022-02-24', NULL);

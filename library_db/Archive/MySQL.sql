-- Insert 10 e-books into the EBook table
INSERT INTO EBook (ebook_id, title, author, publisher, doi, publication_year, genre, num_copies) VALUES
('ebook_id_1', 'The Great Gatsby', 'F. Scott Fitzgerald', 'Scribner', '10.1080/00111619.2014.942814', '1925', 'Fiction', 2),
('ebook_id_2', 'The Catcher in the Rye', 'J.D. Salinger', 'Little, Brown and Company', '10.4324/9781315161066', '1951', 'Fiction', 1),
('ebook_id_3', 'The Alchemist', 'Paulo Coelho', 'HarperCollins', '10.1590/S0104-40362009000400022', '1988', 'Fiction', 3),
('ebook_id_4', 'Pride and Prejudice', 'Jane Austen', 'T. Egerton, Whitehall', '10.1017/CBO9780511815487', '1813', 'Fiction', 2),
('ebook_id_5', 'The Adventures of Tom Sawyer', 'Mark Twain', 'American Publishing Company', '10.1093/actrade/9780192835949.book.1', '1876', 'Fiction', 1),
('ebook_id_6', 'The Picture of Dorian Gray', 'Oscar Wilde', 'Ward, Lock and Company', '10.1080/02690055.2015.1082041', '1890', 'Fiction', 2),
('ebook_id_7', 'The Girl with the Dragon Tattoo', 'Stieg Larsson', 'Norstedts förlag', '10.1093/gww/9780199229704.001.0001', '2005', 'Mystery', 3),
('ebook_id_8', 'The Hunger Games', 'Suzanne Collins', 'Scholastic', '10.1002/9780470939384.ch13', '2008', 'Science Fiction', 4),
('ebook_id_9', 'The Da Vinci Code', 'Dan Brown', 'Doubleday', '10.1145/1284621.1284669', '2003', 'Mystery', 2),
('ebook_id_10', 'The Lord of the Rings', 'J.R.R. Tolkien', 'George Allen & Unwin', '10.1111/j.1467-985X.1978.tb00876.x', '1954', 'Fantasy', 3);

-- Insert 10 ebooks into the Ebook table
INSERT INTO Ebook (ebook_id, title, author, publisher, isan, publication_year, genre, num_copies) VALUES
('9780316411182', 'Ready Player Two', 'Ernest Cline', 'Random House Publishing Group', '9780316411182', '2020', 'Science Fiction', 2),
('9780062897029', 'The Silent Patient', 'Alex Michaelides', 'Celadon Books', '9780062897029', '2019', 'Mystery', 3),
('9781984820970', 'Where the Crawdads Sing', 'Delia Owens', 'Penguin Random House', '9781984820970', '2018', 'Fiction', 5),
('9781250773615', 'Project Hail Mary', 'Andy Weir', 'Random House Publishing Group', '9781250773615', '2021', 'Science Fiction', 2),
('9780593230274', 'The Four Winds', 'Kristin Hannah', 'St. Martin''s Publishing Group', '9780593230274', '2021', 'Historical Fiction', 2),
('9781982156947', 'The Code Breaker', 'Walter Isaacson', 'Simon & Schuster', '9781982156947', '2021', 'Non-fiction', 1),
('9781982163617', 'No One Succeeds Alone', 'Robert Reffkin', 'Houghton Mifflin Harcourt', '9781982163617', '2021', 'Business', 1),
('9780385547680', 'Empire of Pain', 'Patrick Radden Keefe', 'Knopf Doubleday Publishing Group', '9780385547680', '2021', 'Non-fiction', 3),
('9781501168680', 'Becoming', 'Michelle Obama', 'Crown', '9781501168680', '2018', 'Autobiography', 4),
('9780062350817', 'The Martian', 'Andy Weir', 'Random House Publishing Group', '9780062350817', '2011', 'Science Fiction', 2);


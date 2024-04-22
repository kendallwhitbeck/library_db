-- Title: library_create_db_2.sql
-- Description: this script creates the library datbase schema.
-- Author: Kendall Whitbeck

CREATE DATABASE IF NOT EXISTS library2;
USE library2;

-- Create Book table
CREATE TABLE IF NOT EXISTS Book (
    book_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    isbn VARCHAR(13),
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    publisher VARCHAR(255) NOT NULL,
    publication_year YEAR NOT NULL,
    genre VARCHAR(255) NOT NULL,
    num_copies INT NOT NULL
);

-- Create Ebook table
CREATE TABLE IF NOT EXISTS Ebook (
    ebook_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    publisher VARCHAR(255) NOT NULL,
    doi VARCHAR(255) DEFAULT NULL,
    publication_year YEAR NOT NULL,
    genre VARCHAR(255) NOT NULL,
    num_copies INT NOT NULL
);

-- Create Audiobook table
CREATE TABLE IF NOT EXISTS Audiobook (
    audiobook_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    publisher VARCHAR(255) NOT NULL,
    isan VARCHAR(255) DEFAULT NULL,
    publication_year YEAR NOT NULL,
    genre VARCHAR(255) NOT NULL,
    num_copies INT NOT NULL
);

-- Create Book Copy table
CREATE TABLE IF NOT EXISTS Book_Copy (
    book_copy_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    status VARCHAR(255) NOT NULL,
    allowable_loan_period INT NOT NULL,
    book_id INT NOT NULL,
    FOREIGN KEY (book_id) REFERENCES Book(book_id)
);

-- Create Ebook Copy table
CREATE TABLE IF NOT EXISTS Ebook_Copy (
    ebook_copy_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    status VARCHAR(255) NOT NULL,
    allowable_loan_period INT NOT NULL,
    ebook_id INT NOT NULL,
    FOREIGN KEY (ebook_id) REFERENCES Ebook(ebook_id)
);

-- Create Audiobook Copy table
CREATE TABLE IF NOT EXISTS Audiobook_Copy (
    audiobook_copy_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    status VARCHAR(255) NOT NULL,
    allowable_loan_period INT NOT NULL,
    audiobook_id INT NOT NULL,
    FOREIGN KEY (audiobook_id) REFERENCES Audiobook(audiobook_id)
);

-- Create Member table
CREATE TABLE IF NOT EXISTS Member (
    member_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    contact_details VARCHAR(255) NOT NULL,
    membership_type VARCHAR(255) NOT NULL,
    membership_status VARCHAR(255) NOT NULL
);

-- Create Hold table
DROP TABLE IF EXISTS Hold;
CREATE TABLE IF NOT EXISTS Hold (
    hold_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    hold_date DATE NOT NULL,
    hold_status VARCHAR(255) NOT NULL,
    member_id INT NOT NULL,
    book_id INT,
    ebook_id INT,
    audiobook_id INT,
    FOREIGN KEY (member_id) REFERENCES Member(member_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id),
    FOREIGN KEY (ebook_id) REFERENCES Ebook(ebook_id),
    FOREIGN KEY (audiobook_id) REFERENCES Audiobook(audiobook_id)
);

-- Create Loan table
CREATE TABLE IF NOT EXISTS Loan (
	loan_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	member_id INT NOT NULL,
    hold_id	INT DEFAULT NULL,
	book_copy_id INT DEFAULT NULL,
	ebook_copy_id INT DEFAULT NULL,
	audiobook_copy_id INT DEFAULT NULL,
	borrowed_date DATE NOT NULL,
	due_date DATE NOT NULL,
	return_date DATE DEFAULT NULL,
	FOREIGN KEY (member_id) REFERENCES Member(member_id),
	FOREIGN KEY (hold_id) REFERENCES Hold(hold_id),
	FOREIGN KEY (book_copy_id) REFERENCES Book_copy(book_copy_id),
	FOREIGN KEY (ebook_copy_id) REFERENCES Ebook_copy(ebook_copy_id),
	FOREIGN KEY (audiobook_copy_id) REFERENCES Audiobook_copy(audiobook_copy_id)
);

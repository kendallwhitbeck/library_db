-- TODO finish updating this SQL script to be library database

-- Description: this script creates the library datbase schema.
-- Author: Kendall Whitbeck

CREATE DATABASE IF NOT EXISTS library;
USE library;

-- DROP TABLE IF EXISTS books;
CREATE TABLE IF NOT EXISTS books (
  book_id INT PRIMARY KEY,
  title VARCHAR(255),
  author VARCHAR(255),
  publisher VARCHAR(255),
  isbn VARCHAR(13),
  pub_year INT,
  genre VARCHAR(255),
  copies_available INT
);

-- DROP TABLE IF EXISTS ebooks;
CREATE TABLE IF NOT EXISTS ebooks (
  ebook_id INT PRIMARY KEY,
  title VARCHAR(255),
  author VARCHAR(255),
  publisher VARCHAR(255),
  isbn VARCHAR(13),
  pub_year INT,
  genre VARCHAR(255),
  copies_available INT
);

-- DROP TABLE IF EXISTS audiobooks;
CREATE TABLE IF NOT EXISTS audiobooks (
  audiobook_id INT PRIMARY KEY,
  title VARCHAR(255),
  author VARCHAR(255),
  publisher VARCHAR(255),
  isbn VARCHAR(13),
  pub_year INT,
  genre VARCHAR(255),
  copies_available INT
);

-- DROP TABLE IF EXISTS members;
CREATE TABLE IF NOT EXISTS members (
  member_id INT PRIMARY KEY,
  name VARCHAR(255),
  address VARCHAR(255),
  contact_details VARCHAR(255),
  membership_type VARCHAR(255),
  membership_status VARCHAR(255)
);

-- DROP TABLE IF EXISTS loans;
CREATE TABLE IF NOT EXISTS loans (
  loan_id INT PRIMARY KEY,
  member_id INT,
  book_id INT,
  ebook_id INT,
  audiobook_id INT,
  loan_date DATE,
  due_date DATE,
  FOREIGN KEY (member_id) REFERENCES members(member_id),
  FOREIGN KEY (book_id) REFERENCES books(book_id),
  FOREIGN KEY (ebook_id) REFERENCES ebooks(ebook_id),
  FOREIGN KEY (audiobook_id) REFERENCES audiobooks(audiobook_id)
);

-- DROP TABLE IF EXISTS reservations;
CREATE TABLE IF NOT EXISTS reservations (
  reservation_id INT PRIMARY KEY,
  member_id INT,
  book_id INT,
  ebook_id INT,
  audiobook_id INT,
  reservation_date DATE,
  status VARCHAR(255),
  FOREIGN KEY (member_id) REFERENCES members(member_id),
  FOREIGN KEY (book_id) REFERENCES books(book_id),
  FOREIGN KEY (ebook_id) REFERENCES ebooks(ebook_id),
  FOREIGN KEY (audiobook_id) REFERENCES audiobooks(audiobook_id)
);

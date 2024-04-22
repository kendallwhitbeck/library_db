-- Title: library_constraint_check_loan_medium_type.sql
-- Description: this script adds Constraints to the media copy ID foreign keys in the Loan relation for the library datbase schema.
-- Author: Kendall Whitbeck

USE library2;

-- adds check_loan_medium_type Constraint to the media copy ID foreign keys in the Loan relation
ALTER TABLE Loan ADD CONSTRAINT check_loan_medium_type
CHECK ((book_copy_id IS NOT NULL AND ebook_copy_id IS NULL AND audiobook_copy_id IS NULL)
    OR (book_copy_id IS NULL AND ebook_copy_id IS NOT NULL AND audiobook_copy_id IS NULL)
    OR (book_copy_id IS NULL AND ebook_copy_id IS NULL AND audiobook_copy_id IS NOT NULL));

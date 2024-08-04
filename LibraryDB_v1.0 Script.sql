CREATE DATABASE IF NOT EXISTS institution_main;
USE institution_main;

/*VARIABLES DECLARED*/
SET @year_a = '2023-01-01';

-- Initialize variables for the date range
SET @start_date = '2020-01-01';
SET @end_date = '2020-12-31';

CREATE TABLE library(
	id INT PRIMARY KEY,
    borrowers_name VARCHAR(100) NOT NULL,
    book_name VARCHAR(100) NOT NULL,
    borrow_date DATE NOT NULL,
    submission_date DATE NOT NULL
);

INSERT INTO library(id, borrowers_name, book_name, borrow_date, submission_date) 
VALUES
(1, "John", "Book of Life", '2020-01-01', '2020-01-12'),
(2, "Keith", "Harry Potter Tales", '2020-02-01', '2020-02-12'),
(3, "Jonathon", "Computing Basics", '2024-01-01', '2024-01-12');

/*BELOW QUERY IS TO RETRIEVE TABULAR DATA FOR BOOK SUBMISSION DATE AFTER 2023 */
SELECT * FROM library WHERE submission_date > '2023-01-01';

/*BELOW QUERY IS TO RETRIEVE TABULAR DATA FOR BOOK SUBMISSION DATE AFTER 2023 | BUT 2023 CAN BE STORED IN A VARIABLE | LINE 4 */
SELECT * FROM library WHERE submission_date > @year_a;

/*INSERTING MORE DATA INTO THE TABLE*/
INSERT INTO library(id, borrowers_name, book_name, borrow_date, submission_date) VALUES (4, "Penny", "Computing Hardware", '2024-01-01', '2024-01-02');

/* BELOW QUERY IS TO RETRIEVE TABULAR DATA FOR BOOK SUBMISSION DATE AFTER 10 DAYS */
SELECT * FROM library WHERE submission_date - borrow_date > 10;

/*CAN ALSO BE DONE AS SUCH TO RETRIEVE DATAFOR BOOK SUBMISSION DATE AFTER 10 DAYS*/
/*DATEDIFF METHOD IS USED TO GET THE DIFFERENCE BETWEEN TWO DATE STAMPS*/
SELECT * FROM library WHERE DATEDIFF(submission_date, borrow_date) > 10;

-- USE THE VARIABLES FOR DATE RANGE | USING @start_date & @end_date
SELECT * FROM library WHERE borrow_date BETWEEN @start_date AND @end_date;
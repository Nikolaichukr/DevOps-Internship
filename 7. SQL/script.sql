DROP TABLE IF EXISTS Loans;
DROP TABLE IF EXISTS PhysicalCopies;
DROP TABLE IF EXISTS BookGenres;
DROP TABLE IF EXISTS Books;
DROP TABLE IF EXISTS Visitors;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Genres;
DROP TABLE IF EXISTS Authors;
DROP TABLE IF EXISTS Publishers;

CREATE TABLE Visitors (
	visitor_id SERIAL PRIMARY KEY,
	visitor_name VARCHAR(50),
	surname VARCHAR(50) NOT NULL,
	address TEXT NOT NULL,
	phone VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE Authors (
	author_id SERIAL PRIMARY KEY,
	author_name VARCHAR(25) NOT NULL,
	surname VARCHAR(50) NOT NULL
);

CREATE TABLE Books (
	book_id SERIAL PRIMARY KEY,
	title VARCHAR(100) NOT NULL,
	release_year INT,
	author_id INT REFERENCES Authors(author_id)
);

CREATE TABLE Employees (
	employee_id SERIAL PRIMARY KEY,
	name VARCHAR(25) NOT NULL,
	surname VARCHAR(50) NOT NULL,
	position VARCHAR(40),
	phone VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE Publishers (
	publisher_id SERIAL PRIMARY KEY,
	name VARCHAR(25) NOT NULL,
	contact_phone VARCHAR(20) UNIQUE,
	email VARCHAR(35) UNIQUE
);

CREATE TABLE PhysicalCopies (
	copy_id SERIAL PRIMARY KEY,
	book_id INT REFERENCES Books(book_id),
	isbn VARCHAR(20) UNIQUE,
	amount INT DEFAULT 0,
	publisher_id INT REFERENCES Publishers(publisher_id)
);

CREATE TABLE Loans (
	loan_id SERIAL PRIMARY KEY,
	visitor_id INT REFERENCES Visitors(visitor_id),
	copy_id INT REFERENCES PhysicalCopies(copy_id),
	return_date DATE DEFAULT (CURRENT_DATE + INTERVAL '1 month') CHECK (return_date >= CURRENT_DATE)
);

CREATE TABLE Genres (
	genre_id SERIAL PRIMARY KEY,
	name VARCHAR(30) NOT NULL
);

CREATE TABLE BookGenres (
	genre_id INT REFERENCES Genres(genre_id),
	book_id INT REFERENCES Books(book_id)
);

INSERT INTO Authors (author_name, surname)
VALUES
    ('John', 'Doe'),
    ('Jane', 'Smith'),
    ('Michael', 'Johnson');

INSERT INTO Publishers (name, contact_phone, email)
VALUES
    ('ABC Publishing', '123-456-7890', 'abc@example.com'),
    ('XYZ Publishing', '987-654-3210', 'xyz@example.com');

INSERT INTO Genres (name)
VALUES
    ('Fiction'),
    ('Non-Fiction'),
    ('Science Fiction');

INSERT INTO Books (title, release_year, author_id)
VALUES
    ('Book 1', 2020, 1),
    ('Book 2', 2019, 2),
    ('Book 3', 2022, 3);

INSERT INTO BookGenres (genre_id, book_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 3);

INSERT INTO Visitors (visitor_name, surname, address, phone)
VALUES
    ('Alice', 'Johnson', '123 Main St', '555-1234'),
    ('Bob', 'Smith', '456 Elm St', '555-5678'),
    ('Carol', 'Williams', '789 Oak St', '555-9012');

INSERT INTO PhysicalCopies (book_id, isbn, amount, publisher_id)
VALUES
    (1, 'ISBN123', 10, 1),
    (2, 'ISBN456', 5, 2),
    (3, 'ISBN789', 8, 1);

INSERT INTO Employees (name, surname, position, phone)
VALUES
    ('Employee1', 'Lastname1', 'Librarian', '555-1111'),
    ('Employee2', 'Lastname2', 'Clerk', '555-2222');

INSERT INTO Loans (visitor_id, copy_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 3);

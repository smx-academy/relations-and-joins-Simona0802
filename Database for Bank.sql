CREATE TABLE Clients (
	client_id INT PRIMARY KEY,
	first_name VARCHAR(20),
	last_name VARCHAR(20),
	date_of_birth DATE,
	email VARCHAR(50),
	date_of_join DATE
); 

INSERT INTO Clients (client_id, first_name, last_name, date_of_birth, email, date_of_join)
VALUES
(1, 'John', 'Doe', '1985-02-15', 'johndoe@gmail.com', '2024-01-10'),
(2, 'Jane', 'Smith', '1990-06-20', 'janesmith@gmail.com', '2024-03-15'),
(3, 'Robert', 'Johnson', '1978-09-25', 'robertj@yahaoo.com', '2024-04-05'),
(4, 'Emily', 'Brown', '1992-12-01', 'emilybrown@yahoo.com', '2024-02-18'),
(5, 'Michael', 'Williams', '1980-04-12', 'michaelwilliams@mail.com', '2024-05-10'),
(6, 'Sarah', 'Jones', '1987-08-09', 'sarahjones@mail.com', '2024-06-22'),
(7, 'David', 'Miller', '1995-03-30', 'davidmiller@gmail.com', '2024-07-04'),
(8, 'Jessica', 'Davis', '1983-11-17', 'jessicadavis@yahoo.com', '2024-08-19'),
(9, 'James', 'García', '1975-05-05', 'jamesgarcia@mail.com', '2024-09-02'),
(10, 'Mary', 'Martínez', '1998-01-28', 'marymartinez@mail.com', '2024-10-15');

CREATE TABLE Credits ( 
	credit_id INT PRIMARY KEY,
	credit_limit VARCHAR(30),
	start_date DATE, 
	end_date DATE, 
	credit_amount VARCHAR(30),
	client_id INT

	FOREIGN KEY (client_id) REFERENCES Clients(client_id)
);

INSERT INTO Credits (credit_id, credit_limit, start_date, end_date, credit_amount, client_id)
VALUES
(1, '5000', '2024-01-10', '2025-01-10', '2500', 1),
(2, '7000', '2024-02-15', '2025-02-15', '3500', 2),
(3, '10000', '2024-03-20', '2025-03-20', '5000', 3),
(4, '6000', '2024-04-05', '2025-04-05', '3000', 4),
(5, '12000', '2024-05-10', '2025-05-10', '6000', 5),
(6, '8000', '2024-06-22', '2025-06-22', '4000', 6),
(7, '15000', '2024-07-04', '2025-07-04', '7500', 7),
(8, '9000', '2024-08-19', '2025-08-19', '4500', 8),
(9, '11000', '2024-09-02', '2025-09-02', '5500', 9),
(10, '13000', '2024-10-15', '2025-10-15', '6500', 10);


CREATE TABLE Accounts (
	account_id INT PRIMARY KEY,
	account_type VARCHAR(30),
	currency VARCHAR(30),
	date_opened DATE, 
	status VARCHAR(30),
	client_id INT

	FOREIGN KEY (client_id) REFERENCES Clients(client_id)
);

INSERT INTO Accounts (account_id, account_type, currency, date_opened, status, client_id)
VALUES
(1, 'Savings', 'USD', '2024-01-15', 'Active', 1),
(2, 'Checking', 'USD', '2024-02-20', 'Inactive', 2),
(3, 'Savings', 'EUR', '2024-03-25', 'Active', 3),
(4, 'Checking', 'GBP', '2024-04-10', 'Active', 4),
(5, 'Savings', 'USD', '2024-05-15', 'Inactive', 5),
(6, 'Business', 'CAD', '2024-06-30', 'Active', 6),
(7, 'Checking', 'USD', '2024-07-10', 'Active', 7),
(8, 'Savings', 'AUD', '2024-08-05', 'Inactive', 8),
(9, 'Business', 'JPY', '2024-09-01', 'Active', 9),
(10, 'Checking', 'USD', '2024-10-01', 'Inactive', 10);


CREATE TABLE Debit_Cards (
	debit_card_id INT PRIMARY KEY,
	card_number VARCHAR(30),
	issue_date DATE,
	expiration_date DATE,
	card_type VARCHAR(15),
	account_id INT

	FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
);

INSERT INTO Debit_Cards (debit_card_id, card_number, issue_date, expiration_date, card_type, account_id)
VALUES
(1, '1234-5678-9876-5432', '2024-01-20', '2027-01-20', 'Visa', 1),
(2, '2345-6789-8765-4321', '2024-02-25', '2027-02-25', 'MasterCard', 2),
(3, '3456-7890-7654-3210', '2024-03-30', '2027-03-30', 'Visa', 3),
(4, '4567-8901-6543-2109', '2024-04-15', '2027-04-15', 'MasterCard', 4),
(5, '5678-9012-5432-1098', '2024-05-10', '2027-05-10', 'Visa', 5),
(6, '6789-0123-4321-0987', '2024-06-05', '2027-06-05', 'MasterCard', 6),
(7, '7890-1234-3210-9876', '2024-07-01', '2027-07-01', 'Visa', 7),
(8, '8901-2345-2109-8765', '2024-08-18', '2027-08-18', 'MasterCard', 8),
(9, '9012-3456-1098-7654', '2024-09-10', '2027-09-10', 'Visa', 9),
(10, '0123-4567-0987-6543', '2024-10-25', '2027-10-25', 'MasterCard', 10);


CREATE TABLE Savings (
	savings_id INT PRIMARY KEY,
	currency_amount VARCHAR(30),
	interest_rate VARCHAR(10),
	account_id INT,
	client_id INT

	FOREIGN KEY (account_id) REFERENCES Accounts(account_id),
	FOREIGN KEY (client_id) REFERENCES Clients(client_id)
);

INSERT INTO Savings (savings_id, currency_amount, interest_rate, account_id, client_id)
VALUES
(1, '10000', '3.5%', 1, 2),
(2, '20000', '2.8%', 2, 4),
(3, '15000', '4.0%', 3, 3),
(4, '5000', '3.2%', 4, 6),
(5, '12000', '3.7%', 5, 5),
(6, '25000', '2.9%', 6, 1),
(7, '18000', '4.1%', 7, 6),
(8, '22000', '3.6%', 8, 10),
(9, '30000', '2.5%', 9, 8),
(10, '7000', '3.0%', 10, 9);


--List all clients who have more than a specific amount in their savings account (e.g., $10,000).

SELECT  c.client_id, c.first_name, c.last_name, s.currency_amount
FROM Clients AS c
LEFT JOIN Savings AS s
ON c.client_id = s.client_id 
WHERE s.currency_amount > 5500;


--Retrieve all debit cards issued within a specific date range.

SELECT card_number, issue_date, expiration_date
FROM Debit_Cards 
WHERE issue_date BETWEEN '2024-05-10' AND '2027-03-30';

--List all clients who have taken credit, along with the 
--credit amount and start date, filtering for credits issued after a specific date (e.g., after 2023).

SELECT cl.client_id, cl.first_name, cl.last_name, c.credit_amount, c.start_date, c.end_date 
FROM Clients AS cl
INNER JOIN Credits AS c 
ON cl.client_id = c.client_id 
WHERE c.start_date > '2024-03-25';


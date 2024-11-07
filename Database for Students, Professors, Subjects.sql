CREATE TABLE Students (
	student_id INT PRIMARY KEY,
	first_name VARCHAR(20),
	last_name VARCHAR(20),
	birth_date DATE,
	enrolment_year CHAR(4),
);

INSERT INTO Students (student_id, first_name, last_name, birth_date, enrolment_year)
VALUES
(1, 'Simona', 'Krstevska', '09-10-1991', '2017'),
(2, 'Kristina', 'Petkova', '05-10-1992', '2018'),
(3, 'Rade', 'Krmov', '03-11-1990', '2016'),
(4, 'Stojna', 'Kostova', '06-15-1986', '2015'),
(5, 'Vlatko', 'Stefanov', '08-05-1988', '2012'),
(6, 'Violeta', 'Lazarova', '07-21-1983', '2008'), 
(7, 'Stojmir', 'Kacarov', '10-18-1993', '2020');

CREATE TABLE Professors (
	professor_id INT PRIMARY KEY,
	first_name VARCHAR(20),
	last_name VARCHAR(20),
	department VARCHAR(20),
	hire_date CHAR(4),

	);

INSERT INTO Professors (professor_id, first_name, last_name, department, hire_date)
VALUES
(1, 'Danica', 'Janeva', 'Psychology', '2020'),
(2, 'Vanco', 'Kljusev', 'Geography', '2021'),
(3, 'Pero', 'Mitev', 'Hystory', '1995'),
(4, 'Marija', 'Naseva', 'Music', '2012'),
(5, 'Darko', 'Danev', 'Math', '2018'),
(6, 'Goran', 'Petrushev', 'Chemistry', '2020'),
(7, 'Elena', 'Dimitrova', 'Literature', '2021'),
(8, 'Filip', 'Petkovski', 'Mechanics', '2023');



CREATE TABLE Subjects ( 
	subject_id INT PRIMARY KEY,
	subject_name VARCHAR(20),
	professor_id INT
	);

INSERT INTO Subjects (subject_id, subject_name, professor_id)
VALUES
(1, 'Math', 2),
(2, 'Chemistry', 3),
(3, 'Music', 1),
(4, 'Hystory', 8),
(5, 'Mechanics', 2),
(6, 'Geography', 8),
(7, 'Literature', 6),
(8, 'Psychology', 5);

CREATE TABLE Professors_Subjects (
	professors_subjects_id INT PRIMARY KEY,
	department VARCHAR(20),
	student_id INT NOT NULL, 
	professor_id INT NOT NULL, 
	subject_id INT NOT NULL,

FOREIGN KEY(student_id) REFERENCES Students(student_id),
FOREIGN KEY(professor_id) REFERENCES Professors(professor_id),
FOREIGN KEY(subject_id) REFERENCES Subjects(subject_id) 
);

INSERT INTO Professors_Subjects (professors_subjects_id, department, student_id, professor_id, subject_id)
VALUES 
(1, 'Math', 2, 2, 1),
(2, 'Chemistry', 1, 3, 2),
(3, 'Music', 3, 1, 2),
(4, 'Hystory', 4, 8, 4),
(5, 'Mechanics', 5, 2, 5),
(6, 'Geography', 6, 8, 6),
(7, 'Literature', 7, 6, 7);


-------------------------------------------------

---Retrieve a list of all students enrolled after a specific year (e.g., 2020).

SELECT student_id, first_name, enrolment_year
FROM Students 
WHERE enrolment_year > 2015; 


---Find the subjects taught by a particular professor by using the professor's ID.

SELECT s.subject_name, p.first_name, p.last_name, p.department
FROM Subjects AS s
INNER JOIN Professors_Subjects AS ps
ON s.subject_id = ps.subject_id
INNER JOIN Professors AS p
ON p.professor_id = ps.professor_id
WHERE ps.professor_id = 8; 


---List all students' names and enrollment years, filtered by department
---(for example, list all students under a department where professors belong).

SELECT s.first_name, s.last_name, s.enrolment_year, ps.department
FROM Students AS s
INNER JOIN Professors_Subjects AS ps
ON s.student_id = ps.student_id
WHERE ps.department = 'Math';






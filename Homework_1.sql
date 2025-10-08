DROP DATABASE IF EXISTS homework_1;
CREATE DATABASE homework_1;
USE homework_1;

-- Creating all tables that I need for future: students, companies, applications, mentors, internships

CREATE TABLE students (
 student_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(100),
    major VARCHAR(100),
    grad_year INT,
    gpa DECIMAL(4,2)
);

CREATE TABLE companies (
 company_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    company_name VARCHAR(50),
    industry VARCHAR(100),
    location VARCHAR(100),
    employye_count INT
);

CREATE TABLE mentors (
 mentor_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(100),
    company_id INT,
 specialization VARCHAR(100),
    FOREIGN KEY (company_id) REFERENCES companies(company_id)
);

CREATE TABLE internships (
 internship_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    company_id VARCHAR(50),
    mentor_id INT,
    position VARCHAR(100),
    duration_mon INT,
    FOREIGN KEY (mentor_id) REFERENCES mentors(mentor_id)
);

CREATE TABLE applications (
 application_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    internship_id INT,
    decision VARCHAR(100),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (internship_id) REFERENCES internships(internship_id)
);

-- Full tables with data

INSERT INTO students (first_name, last_name, major, grad_year, gpa)
VALUES  ('Tania', 'Tkachenko', 'EBD', 2028, 98.09),
('Maria', 'Sydorchyk', 'BE', 2028, 78.97),
('Andrii', 'Grugorchyk', 'SE', 2026, 65.87),
('Oleh', 'Shugar', 'BE', 2027, 98.76),
('Anastasiia', 'Plohotnuk', 'EBD', 2029, 74.99),
('Evhen', 'Kostomarov', 'SE', 2026, 78.67),
('Olha', 'Ivanovska', 'BE', 2027, 69.65),
('Anna', 'Bondar', 'AI', 2028, 84.43),
('Ivan', 'Bosh', 'EBD', 2026, 94.35),
('Artem', 'Fines', 'SE', 2029, 95.67);
        
INSERT INTO companies (company_name, industry, location, employye_count)
VALUES ('TechNova', 'Technology', 'Kyiv', 300),
('EcoBank', 'Finance', 'Lviv', 500),
('DataSky', 'Data Analytics', 'Odesa', 150),
('GreenCore', 'Energy', 'Kharkiv', 200),
('MediCore', 'Healthcare', 'Dnipro', 250),
('FinPlus', 'Finance', 'Kyiv', 320),
('Softline', 'Technology', 'Lviv', 400),
('EduLab', 'Education', 'Odesa', 120),
('CyberNet', 'Cybersecurity', 'Kharkiv', 180),
('AgroSys', 'Agriculture', 'Vinnytsia', 210);

INSERT INTO mentors (first_name, last_name, company_id, specialization)
VALUES ('Iryna', 'Shevchenko', 1, 'Machine Learning'),
('Oleksii', 'Bondar', 2, 'Financial Analysis'),
('Iryna', 'Shevchenko', 3, 'Machine Learning'),
('Oleksii', 'Bondar', 4, 'Financial Analysis'),
('Oleksii', 'Bondar', 5, 'Financial Analysis'),
('Iryna', 'Shevchenko', 6, 'Machine Learning'),
('Oleksii', 'Bondar', 7, 'Financial Analysis'),
('Iryna', 'Shevchenko', 8, 'Machine Learning'),
('Oleksii', 'Bondar', 9, 'Financial Analysis'),
('Iryna', 'Shevchenko', 10, 'Machine Learning');

INSERT INTO internships (company_id, mentor_id, position, duration_mon)
VALUES (3, 1, 'Backend Intern', 6),
(5, 2, 'Finance Analyst Intern', 1),
(1, 3, 'Risk Intern', 5),
(4, 4, 'Finance Analyst Intern', 3),
(2, 5, 'Backend Intern', 6),
(7, 6, 'Risk Intern', 10),
(8, 7, 'Finance Analyst Intern', 7),
(6, 8, 'Risk Intern', 4),
(10, 9, 'Risk Intern', 6),
(9, 10, 'Backend Intern',1);
       
INSERT INTO applications (student_id, internship_id, decision)
VALUES (1, 1, 'Accepted'),
(2, 2, 'Accepted'),
(3, 3, 'Rejected'),
(4, 4, 'Accepted'),
(5, 5, 'Pending'),
(6, 6, 'Accepted'),
(7, 7, 'Accepted'),
(8, 8, 'Accepted'),
(9, 9, 'Pending'),
(10, 10, 'Accepted');   

-- My main goal was found top-position (I used two criterias — AVG(gpa) should be bigger than 70), where you can earn the best expirience
-- And AVG(duration) should be more than avarage duration of all courses) and top-mentor (there is also two criterias — there shoul be at least two aplications from their students and AVG(gpa) should be bigger than avarage GPA of all students )


-- I decided to use union to see the best position and mentor at the same time — it is main goal of code under this comment.

WITH accepted AS
(
    SELECT a.application_id, i.position, i.duration_mon, s.gpa, m.mentor_id, m.first_name, m.last_name
    FROM applications a
    JOIN internships i ON i.internship_id = a.internship_id -- There are all five joins by id
    JOIN mentors m ON i.mentor_id = m.mentor_id
    JOIN students s ON s.student_id = a.student_id
    JOIN companies c ON c.company_id = i.company_id
    WHERE a.decision = 'Accepted' -- Used where to filter rows and left in this CTE just students whose internship was approved
),
top_positions AS (
  SELECT position AS name_or_position,  COUNT(application_id) AS total_accepted, AVG(gpa) AS avg_gpa
  FROM accepted
  GROUP BY position -- Because we want to know top-position
  HAVING AVG(gpa) > 70 AND AVG(duration_mon) > (SELECT AVG(duration_mon) FROM internships) -- Two main criterias
  ORDER BY avg_gpa DESC -- To filter by GPA
  LIMIT 1 -- Limit 1 because I want to know the best position for internship
), 
top_mentors AS (
    SELECT first_name AS name_or_position, COUNT(application_id) AS total_accepted, AVG(gpa) AS avg_gpa
    FROM accepted
    GROUP BY first_name -- Because we want to know top-mentor
    HAVING COUNT(application_id) > 1 AND AVG(gpa) > (SELECT AVG(gpa) FROM students) -- Two main criterias
    ORDER BY avg_gpa DESC -- To filter by GPA
    LIMIT 1  -- Limit 1 because I want to know the best mentor for internship
)
SELECT name_or_position, total_accepted, avg_gpa FROM top_positions UNION ALL SELECT name_or_position, total_accepted, avg_gpa FROM top_mentors;

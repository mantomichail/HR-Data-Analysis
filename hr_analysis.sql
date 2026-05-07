-- Database Setup 

DROP TABLE IF EXISTS performance;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
  dept_id INTEGER PRIMARY KEY,
  dept_name TEXT,
  manager TEXT
);

CREATE TABLE employees (
  emp_id INTEGER PRIMARY KEY,
  name TEXT,
  dept_id INTEGER,
  salary REAL,
  hire_date TEXT,
  FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

CREATE TABLE performance (
  perf_id INTEGER PRIMARY KEY,
  emp_id INTEGER,
  year INTEGER,
  score INTEGER,
  FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

-- Insert Data
INSERT INTO departments VALUES (1, 'Sales', 'John Smith');
INSERT INTO departments VALUES (2, 'Marketing', 'Emily Davis');
INSERT INTO departments VALUES (3, 'Engineering', 'Michael Chen');
INSERT INTO departments VALUES (4, 'HR', 'Sarah Johnson');

INSERT INTO employees VALUES (1, 'Alice Brown', 1, 52000, '2019-03-15');
INSERT INTO employees VALUES (2, 'Bob Wilson', 2, 61000, '2018-07-22');
INSERT INTO employees VALUES (3, 'Carol White', 3, 85000, '2020-01-10');
INSERT INTO employees VALUES (4, 'David Lee', 1, 48000, '2021-06-01');
INSERT INTO employees VALUES (5, 'Eve Martinez', 4, 57000, '2017-11-30');
INSERT INTO employees VALUES (6, 'Frank Taylor', 3, 92000, '2016-09-14');
INSERT INTO employees VALUES (7, 'Grace Anderson', 2, 63000, '2022-02-28');
INSERT INTO employees VALUES (8, 'Henry Thomas', 4, 54000, '2020-08-19');
INSERT INTO employees VALUES (9, 'Iris Jackson', 1, 49000, '2023-01-05');
INSERT INTO employees VALUES (10, 'James White', 3, 78000, '2019-12-01');

INSERT INTO performance VALUES (1, 1, 2023, 8);
INSERT INTO performance VALUES (2, 2, 2023, 7);
INSERT INTO performance VALUES (3, 3, 2023, 9);
INSERT INTO performance VALUES (4, 4, 2023, 6);
INSERT INTO performance VALUES (5, 5, 2023, 8);
INSERT INTO performance VALUES (6, 6, 2023, 10);
INSERT INTO performance VALUES (7, 7, 2023, 7);
INSERT INTO performance VALUES (8, 8, 2023, 5);
INSERT INTO performance VALUES (9, 9, 2023, 8);
INSERT INTO performance VALUES (10, 10, 2023, 9);

-- Analysis Queries

-- Q1: Employees with salary above 60,000 ordered by salary
SELECT name, salary FROM employees
WHERE salary>60000
ORDER BY salary DESC

-- Q2: Average salary per department
SELECT dept_id, AVG(salary) as avg_salary
from employees
group by dept_id

-- Q3: Employee names with their department names
SELECT name, dept_name FROM employees
JOIN departments on employees.dept_id=departments.dept_id
  
-- Q4: Departments with average salary above 60,000
SELECT dept_name, AVG(salary) AS avg_salary
FROM employees
JOIN departments ON employees.dept_id=departments.dept_id
GROUP BY dept_name
HAVING AVG(salary)>60000
  
-- Q5: Employee name, department and performance score for 2023
SELECT name, dept_name, score 
FROM employees
JOIN departments ON employees.dept_id=departments.dept_id
JOIN performance ON employees.emp_id=performance.emp_id
where year= 2023

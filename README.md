# SQL Database Schema and Queries

## Introduction
This README provides a comprehensive guide to the SQL schema creation and queries for managing employee data within a company. The database schema includes tables for departments, employees, salaries, titles, department employees, and department managers. Additionally, various SQL queries are provided to perform tasks such as retrieving employee information, department details, and statistical analysis on the employee data.

## Table of Contents
1. Schema Definition
2. SQL Queries

## Schema Definition
The schema includes the following tables:

### 1. departments
- `dept_no` VARCHAR(10) (Primary Key)
- `dept_name` VARCHAR(100)

### 2. dept_emp
- `emp_no` INTEGER
- `dept_no` VARCHAR(10)
  - Primary Key: (emp_no, dept_no)
  - Foreign Key: emp_no -> employees(emp_no), dept_no -> departments(dept_no)

### 3. dept_manager
- `dept_no` VARCHAR(10)
- `emp_no` INTEGER
  - Primary Key: (dept_no, emp_no)
  - Foreign Key: emp_no -> employees(emp_no), dept_no -> departments(dept_no)

### 4. employees
- `emp_no` INTEGER (Primary Key)
- `emp_title_id` VARCHAR(20)
- `birth_date` DATE
- `first_name` VARCHAR(50)
- `last_name` VARCHAR(50)
- `sex` CHAR(1)
- `hire_date` DATE

### 5. salaries
- `emp_no` INTEGER
- `salary` INTEGER
  - Foreign Key: emp_no -> employees(emp_no)

### 6. titles
- `title_id` VARCHAR(20) (Primary Key)
- `title` VARCHAR(30)

## SQL Queries
Below are various SQL queries to retrieve information from the database:

1. **List of Employees with Salary**
```sql
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no;
```

2. **Employees Hired in 1986**
```sql
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';
```

3. **Managers with Department Information**
```sql
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager dm
JOIN departments d ON dm.dept_no = d.dept_no
JOIN employees e ON dm.emp_no = e.emp_no;
```

4. **Employees with Department Information**
```sql
SELECT de.emp_no, e.last_name, e.first_name, de.dept_no, d.dept_name
FROM dept_emp de
JOIN employees e ON de.emp_no = e.emp_no
JOIN departments d ON de.dept_no = d.dept_no;
```

5. **Specific Employee Query**
```sql
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';
```

6. **Employees in Sales Department**
```sql
SELECT e.emp_no, e.last_name, e.first_name, 'Sales' AS department
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';
```

7. **Employees in Sales and Development Departments**
```sql
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');
```

8. **Frequency of Employee Last Names**
```sql
SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;
```

## Conclusion
This README provides a structured overview of the SQL database schema and queries for managing employee data. By following the schema definition and utilizing the provided SQL queries, users can effectively interact with the database to retrieve relevant information for organizational needs.
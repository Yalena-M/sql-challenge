-- Create the departments table
CREATE TABLE departments (
    dept_no VARCHAR(5) PRIMARY KEY, 
    dept_name VARCHAR(100) NOT NULL 
);
-- Create the titles table
CREATE TABLE titles (
    title_id VARCHAR(5) PRIMARY KEY, 
    title VARCHAR(100) NOT NULL 
);
-- Create the employees table
CREATE TABLE employees (
    emp_no INTEGER PRIMARY KEY, 
    emp_title_id VARCHAR(5) NOT NULL, 
    birth_date DATE NOT NULL, 
    first_name VARCHAR(255) NOT NULL, 
    last_name VARCHAR(255) NOT NULL, 
    sex CHAR(1) NOT NULL CHECK (sex IN ('M', 'F')), 
    hire_date DATE NOT NULL, 
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id) 
);
-- Create the dept_emp table
CREATE TABLE dept_emp (
    emp_no INTEGER NOT NULL, 
    dept_no VARCHAR(5) NOT NULL,  
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no) , 
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)  
);
-- Create the dept_manager table
CREATE TABLE dept_manager (
    dept_no VARCHAR(5) NOT NULL, 
    emp_no INTEGER NOT NULL,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no), 
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no) 
);
-- Create the salaries table
CREATE TABLE salaries (
    emp_no INTEGER NOT NULL,
    salary INTEGER NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no) 
);
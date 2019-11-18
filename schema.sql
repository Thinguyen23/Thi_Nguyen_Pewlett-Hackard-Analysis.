-- Creating tables for PH-EmployeeDB
Create table departments(
	dept_no varchar(4) not null,
	dept_name varchar(40) not null,
	primary key (dept_no),
	unique (dept_name)
);
Create table employees(
	emp_no int not null,
	birth_date date not null,
	first_name varchar(20) not null,
	last_name varchar (20) not null,
	gender varchar(5) not null,
	hire_date date not null,
	Primary key (emp_no)
);
Create table dept_manger(
	dept_no varchar(4) not null,
	emp_no int not null,
	from_date date not null,
	to_date date not null,
	Foreign Key (emp_no) References employees (emp_no),
	Foreign Key (dept_no) References departments (dept_no),
	Primary Key (emp_no, dept_no)
);
Create table dept_emp(
	emp_no int not null,
	dept_no varchar(4) not null,
	from_date date not null,
	to_date date not null,
	Foreign Key (dept_no) References departments (dept_no),
	Foreign Key (emp_no) References employees (emp_no),
	Primary Key (emp_no, dept_no)
);
Create table titles(
	emp_no int not null,
	title varchar(50) not null,
	from_date date not null,
	to_date date not null,
	Foreign Key (emp_no) References employees (emp_no)
);
Create table salaries(
	emp_no int not null,
	salary int not null,
	from_date date not null,
	to_date date not null,
	Foreign Key (emp_no) References employees (emp_no),
	Primary Key (emp_no)
);
Select * from dept_emp;








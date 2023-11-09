create table department (
	department_id serial primary key,
	dept_name varchar(255),
	manager_id integer,
	budget float,
	building varchar(255)
);

create table employee(
	employee_id serial primary key,
	first_name varchar(30),
	last_name varchar(30),
	salary float,
	department_id integer,
	foreign key (department_id) references department(department_id)
);
create table departments
( department_no varchar(10) primary key,
  department varchar(20) not null
);

create table titles 
( title_id varchar(10) primary key,
  title varchar(50) not null
);

create table employees
( employee_no int primary key,
  employee_title_id varchar(10) not null,
  birth_date date not null,
  first_name varchar(50) not null,
  last_name varchar(50) not null,
  sex varchar(5) not null,
  hire_date date not null default current_date,
  constraint employee_title_id_fk foreign key(employee_title_id) references titles(title_id)
);

create table salaries
( employee_no int primary key,
  employee_salary int not null,
  constraint employee_no_fk foreign key(employee_no) references employees(employee_no)
);

create table dept_emp_assignments
( employee_no int,
  department_no varchar(10),
  constraint employee_no_fk foreign key(employee_no) references employees(employee_no),
  constraint department_no_fk foreign key(department_no) references departments(department_no),
  unique(employee_no, department_no)  
);

create table dept_mngr_assignments
( department_no varchar(10),
  employee_no int, 
  constraint department_no_fk foreign key(department_no) references departments(department_no), 
  constraint employee_no_fk foreign key(employee_no) references employees(employee_no),
  unique(department_no, employee_no)  
);
 
 
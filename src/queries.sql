--List the following details of each employee: employee number, last name, first name, sex, and salary.
select emp.employee_no, emp.last_name, emp.first_name, sl.employee_salary
  from employees as emp join salaries as sl on emp.employee_no = sl.employee_no;  

--List first name, last name, and hire date for employees who were hired in 1986.
select emp.first_name, emp.last_name, emp.hire_date
  from employees emp
 where extract(year from emp.hire_date) = '1986';
 
--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
select dma.department_no, dp.department, 
       emp.employee_no manager_emp_no, emp.last_name mngr_last_name, emp.first_name mngr_first_name
  from employees as emp 
  join dept_mngr_assignments as dma on emp.employee_no = dma.employee_no
  join departments as dp on dma.department_no = dp.department_no;
   
--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
select emp.employee_no, emp.last_name, emp.first_name, dp.department
  from employees as emp 
  join dept_emp_assignments as dea on emp.employee_no = dea.employee_no
  join departments as dp on dea.department_no = dp.department_no;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select emp.first_name, emp.last_name, emp.sex
  from employees emp
 where upper(emp.first_name) =  'HERCULES' and upper(last_name) like 'B%';

--List all employees in the Sales department, including 
--their employee number, last name, first name, and department name.
select emp.employee_no, emp.last_name, emp.first_name, dpt.department, all_emp_dpt.emp_type working_as
  from employees as emp,
  	   departments as dpt,
  	   ( select employee_no, department_no, 'Employee' emp_type from  dept_emp_assignments  
	     union all 
		 select  employee_no, department_no, 'Manager' emp_type from  dept_mngr_assignments ) all_emp_dpt
 where emp.employee_no = all_emp_dpt.employee_no
   and all_emp_dpt.department_no = dpt.department_no
   and dpt.department = 'Sales'
   --and all_emp_dpt.emp_type = 'Manager'
order by emp.employee_no, emp.last_name, emp.first_name;
 
--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
select emp.employee_no, emp.last_name, emp.first_name, dpt.department, all_emp_dpt.emp_type working_as
  from employees as emp,
  	   departments as dpt,
  	   ( select employee_no, department_no, 'Employee' emp_type from  dept_emp_assignments  
	     union all 
		 select  employee_no, department_no, 'Manager' emp_type from  dept_mngr_assignments ) all_emp_dpt
 where emp.employee_no = all_emp_dpt.employee_no
   and all_emp_dpt.department_no = dpt.department_no
   and dpt.department in ('Sales', 'Development')
   --and all_emp_dpt.emp_type = 'Manager'
order by emp.employee_no, emp.last_name, emp.first_name;

--In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
select last_name, count(employee_no) 
  from employees emp
group by last_name
order by 2 desc;


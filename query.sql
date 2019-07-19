/*** Data Anlysis 1 ***/

select e.emp_no as "employee number", e.last_name as "last name", e.first_name as "first name", e.gender, s.salary
	from public."Employees" e 
		inner join public."Salaries" s on e.emp_no = s.emp_no;

/*** Data Analysis 2 ***/

select emp_no, first_name, last_name
	from public."Employees" 
	where extract(year from hire_date) = 1986;
	
/*** Data Analysis 3 ***/

select d.dept_no as "department number", d.dept_name as "department name", 
		dm.emp_no as "manager employee number", e.last_name as "last name", e.first_name as "first name",
		dm.from_date as "start employment dates", dm.to_date as "end employment date"
	from public."Departments" d
		inner join public."Dept_Manager" dm on d.dept_no = dm.dept_no
		inner join public."Employees" e on e.emp_no = dm.emp_no;

/*** Data Analysis 4 ***/

select e.emp_no as "employee number", e.last_name as "last name", e.first_name as "first name", d.dept_name as "department name" 
	from public."Employees" e 
		inner join public."Dept_Emp" de on e.emp_no = de.emp_no
		inner join public."Departments" d on de.dept_no = d.dept_no;
	
/*** Data Analysis 5 ***/

select first_name as "first name", last_name as "last name" 
	from public."Employees"
	where first_name = 'Hercules' and left(last_name, 1) = 'B';
	
/*** Data Analysis 6 ***/

select e.emp_no as "employee number", e.last_name as "last name", e.first_name as "first name", d.dept_name as "department name" 
	from public."Employees" e 
		inner join public."Dept_Emp" de on e.emp_no = de.emp_no
		inner join public."Departments" d on de.dept_no = d.dept_no
	where d.dept_name = 'Sales';
	
/*** Data Analysis 7 ***/

select e.emp_no as "employee number", e.last_name as "last name", e.first_name as "first name", d.dept_name as "department name" 
	from public."Employees" e 
		inner join public."Dept_Emp" de on e.emp_no = de.emp_no
		inner join public."Departments" d on de.dept_no = d.dept_no
	where d.dept_name in ('Sales','Development');
	
/*** Data Analysis 8 ***/

select last_name as "last name", count(*) 
	from public."Employees"
	group by last_name
	order by count desc;
	
/*** Bonus ***/

select t.title, round(avg(s.salary), 2) as average
	from public."Titles" t 
		inner join public."Salaries" s on t.emp_no = s.emp_no
	group by t.title
	order by t.title asc;

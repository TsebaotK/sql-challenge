-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT 
	employees.emp_no, 
	employees.last_name, 
	employees.first_name, 
	employees.sex, 
	salaries.salary
FROM employees
INNER JOIN salaries on salaries.emp_no = employees.emp_no;


-- 2.List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT 
	employees.first_name, 	
	employees.last_name,  
	employees.hire_date
FROM employees
WHERE EXTRACT(YEAR FROM employees.hire_date) = '1986';


-- 3.List the manager of each department along with their department number, 
--   department name, employee number, last name, and first name.
SELECT 
	dept_manager.dept_no, 
	departments.dept_name, 
	employees.emp_no, 
	employees.last_name,
	employees.first_name,
	titles.title 
FROM employees
INNER JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
INNER JOIN departments ON  dept_manager.dept_no = departments.dept_no
INNER JOIN titles ON employees.emp_title_id = titles.title_id
WHERE titles.title = 'Manager';


-- 4.List the department number for each employee along with that employee’s employee number, 
--   last name, first name, and department name.
SELECT 
	dept_manager.dept_no, 
	employees.emp_no, 
	employees.last_name,
	employees.first_name, 
	departments.dept_name
FROM employees
INNER JOIN dept_manager ON  employees.emp_no = dept_manager.emp_no 
INNER JOIN departments ON  dept_manager.dept_no = departments.dept_no;


-- 5.List first name, last name, and sex of each employee whose first name is Hercules and 
--   whose last name begins with the letter B.
SELECT 
	employees.first_name,
	employees.last_name,
	employees.sex 
FROM employees
WHERE employees.first_name ='Hercules' AND employees.last_name LIKE 'B%' ;


-- 6.List each employee in the Sales department, including their employee number, last name, 
--   and first name.
SELECT 
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM employees
INNER JOIN dept_emp ON  employees.emp_no = dept_emp.emp_no 
INNER JOIN departments ON  dept_emp.dept_no = departments.dept_no 
WHERE departments.dept_name = 'Sales';
--WHERE employees.emp_no IN
--	(
--	SELECT dept_emp.emp_no
--	FROM dept_emp
--	WHERE dept_emp.dept_no IN
--		(
--		SELECT departments.dept_no
--		FROM departments
--		WHERE departments.dept_name = 'Sales'
--		)
--	);


-- 7.List each employee in the Sales and Development departments, including their employee number, 
--   last name, first name, and department name.
SELECT 
	employees.emp_no,
	employees.last_name,
	employees.first_name, 
	departments.dept_name
FROM employees
INNER JOIN dept_emp ON  employees.emp_no = dept_emp.emp_no 
INNER JOIN departments ON  dept_emp.dept_no = departments.dept_no 
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development'
--WHERE employees.emp_no IN
--   (
--	SELECT dept_emp.emp_no
--	FROM dept_emp
--	WHERE dept_emp.dept_no IN
--	   (
--		SELECT departments.dept_no
--		FROM departments
--		WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development'
--	   ) 
--);


-- 8.List the frequency counts, in descending order, of all the employee last names 
--   (that is, how many employees share each last name).
SELECT employees.last_name, count(employees.last_name) AS "Last Name frequency counts"
FROM employees
GROUP BY employees.last_name
ORDER BY "Last Name frequency counts" DESC ;

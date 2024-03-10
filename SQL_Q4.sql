use ineuron_fsda;

-- Create the employee table
CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    salary DECIMAL(10, 2),
    manager_id INT
);

-- Insert data into the employee table
INSERT INTO employee (emp_id, emp_name, salary, manager_id) VALUES
(10, 'Anil', 50000.00, 18),
(11, 'Vikas', 75000.00, 16),
(12, 'Nisha', 40000.00, 18),
(13, 'Nidhi', 60000.00, 17),
(14, 'Priya', 80000.00, 18),
(15, 'Mohit', 45000.00, 18),
(16, 'Rajesh', 90000.00, NULL),
(17, 'Raman', 55000.00, 16),
(18, 'Santosh', 65000.00, 17);


SELECT
    e.manager_id,
    m.emp_name AS manager_name,
    AVG(e.salary) AS avg_salary_under_manager
FROM
    employee e
LEFT JOIN
    employee m ON e.manager_id = m.emp_id
WHERE
    e.manager_id IS NOT NULL
GROUP BY
    e.manager_id, m.emp_name
ORDER BY
    e.manager_id;

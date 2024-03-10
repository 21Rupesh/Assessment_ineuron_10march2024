use ineuron;

SELECT Manager_ID, 
       (SELECT Emp_Name FROM Employee WHERE Emp_ID = Manager_ID) AS Manager,
       AVG(Salary) AS Average_Salary_Under_Manager
FROM Employee
GROUP BY ManagerID;
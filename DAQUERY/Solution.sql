Use DA

--1.Select all columns from Employees
select *
from Employees

--2.Select first and last names from Employees.
select FirstName , LastName
from Employees

--3.Get distinct departments from Employees

select distinct(DepartmentID)
from Employees

--4.Get all employees in the "IT" department
SELECT e.*
FROM Employees e
    JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'IT';

--5.Find employees with a salary > 50,000

select Concat(FirstName,' ',LastName) as 'Name' , Salary
from Employees
where Salary>50000

--6.Get employees who joined after 2020
SELECT Concat(FirstName,' ',LastName) as 'Name', JoiningDate
from Employees
where YEAR(JoiningDate)>2020

--7.Order employees by salary descending.
select *
from Employees
order by Salary desc

--8.Limit result to top 5 earners
select top(5)
    *
from Employees
order by Salary desc

--9.Find employees whose first name starts with 'A'.
Select FirstName
from Employees
where FirstName Like 'A%'

--10.Get all employees not in the �HR� department

select E.FirstName, D.DepartmentName
from Employees E
    join Departments D
    ON E.DepartmentID=D.DepartmentID
WHERE D.DepartmentName !='HR'

--11.Find null DepartmentID entries in Employees
SELECT *
FROM Employees
WHERE DepartmentID IS NULL;

--12.Select employees with salary between 50k and 80k

SELECT FirstName, Salary
from Employees
where Salary Between 50000 and 80000

--13.Find length of employee first names
select len(FirstName) , FirstName
from Employees

--14.Count total employees
select count(EmployeeID)
from Employees

--15.Find average salary of employees.

select avg(salary) as 'Average Salary'
from Employees

--16.List employees grouped by department

select COUNT(E.EmployeeID), D.DepartmentName
from Employees E
    join Departments D
    on E.DepartmentID=D.DepartmentID
GROUP BY D.DepartmentName

--17.Select all employees except one with EmployeeID = 101.
SELECT *
FROM Employees
WHERE NOT EmployeeID = '101';

--18.Join Employees and Departments to get department names
SELECT E.FirstName, D.DepartmentName
FROM Employees E
    JOIN Departments D
    ON E.DepartmentID=D.DepartmentID

--19.List employees and their project names
SELECT E.FirstName, P.ProjectName
FROM Employees E
    JOIN Projects P
    ON E.DepartmentID=P.DepartmentID

--20.List projects and corresponding departments.
SELECT P.ProjectName, D.DepartmentName
from Departments D
    JOIN Projects P
    ON D.DepartmentID=P.DepartmentID
--21.Find employees who worked on more than 1 project.

SELECT e.EmployeeID, e.FirstName, e.LastName, COUNT(ep.ProjectID) AS ProjectCount
FROM Employees e
    JOIN EmployeeProjects ep ON e.EmployeeID = ep.EmployeeID
GROUP BY e.EmployeeID, e.FirstName, e.LastName
HAVING COUNT(ep.ProjectID) > 1;

--22.Get total hours worked by each employee across all projects
SELECT SUM(EP.HoursWorked) AS 'Total hrs Work', E.FirstName
FROM
    Employees E
    join EmployeeProjects EP
    on E.EmployeeID=EP.EmployeeID
GROUP BY E.FirstName
ORDER BY SUM(EP.HoursWorked) DESC

--23.Get department-wise project counts

select count(P.ProjectID) as 'Total Project' , D.DepartmentName
from Departments D
    JOIN Projects P
    on D.DepartmentID=P.DepartmentID
group by D.DepartmentName

--24.Join Employees, Departments, and Projects in a single query
Select *
from Employees E
    join Departments D on D.DepartmentID=E.DepartmentID
    join Projects P on P.DepartmentID=D.DepartmentID

--25.List employees not assigned to any project.
SELECT e.EmployeeID, e.FirstName, e.LastName
FROM Employees e
    LEFT JOIN EmployeeProjects ep ON e.EmployeeID = ep.EmployeeID
WHERE ep.ProjectID IS NULL;

--29.List projects that no employee is assigned to
SELECT ProjectID, ProjectName
FROM Projects
WHERE ProjectID NOT IN (
    SELECT DISTINCT ProjectID
FROM EmployeeProjects
);

-- or 

SELECT p.ProjectID, p.ProjectName
FROM Projects p
    LEFT JOIN EmployeeProjects ep ON p.ProjectID = ep.ProjectID
WHERE ep.EmployeeID IS NULL;

--30.Find the max salary in each department.
SELECT
    E.DepartmentID,
    D.DepartmentName,
    MAX(E.Salary) AS max_salary
FROM
    Employees E
    JOIN
    Departments D ON E.DepartmentID = D.DepartmentID
GROUP BY 
    E.DepartmentID, D.DepartmentName;
--31.Show employees along with their latest salary from Salaries.

SELECT E.FirstName, S.SalaryAmount, S.EffectiveFrom
FROM Employees E
    JOIN Salaries S ON S.EmployeeID = E.EmployeeID
WHERE S.EffectiveFrom = (
    SELECT MAX(S2.EffectiveFrom)
FROM Salaries S2
WHERE S2.EmployeeID = S.EmployeeID
);

--32.Get total salary cost per department.

select sum(E.Salary), D.DepartmentName
from Employees E
    join Departments D
    on D.DepartmentID=E.DepartmentID
group by D.DepartmentName
order by sum(E.salary) desc

-- 33.Join employees with departments using LEFT JOIN
select E.FirstName, D.DepartmentName
from Employees E
    left join Departments D
    on E.DepartmentID=D.DepartmentID

--34.Use RIGHT JOIN to find departments with no employees

SELECT D.DepartmentName
FROM Employees E
    RIGHT JOIN Departments D
    ON E.DepartmentID = D.DepartmentID
--- E.DepartmentID First Table , D.DepartmentID Second Table 
WHERE E.EmployeeID IS NULL;

-- 35 Use FULL OUTER JOIN to get all combinations of employee and department.

select D.DepartmentName, E.FirstName
from Departments D
    Full outer join Employees E
    on D.DepartmentID=E.EmployeeID

--36.Use CROSS JOIN between Departments and Projects
select *
from Departments
cross join Projects

-- 38.Join EmployeeProjects with Employees and Projects
select
    E.FirstName,
    EP.HoursWorked,
    P.ProjectName
from
    Projects P
    jOIN EmployeeProjects EP on P.ProjectID = EP.ProjectID
    JOIN Employees E ON E.EmployeeID = EP.EmployeeID

-- 40.Get department name and average hours worked on their projects.
select D.DepartmentName , avg(EP.HoursWorked)
from Departments D
    Join Employees E
    on D.DepartmentID=E.DepartmentID
    JOIN EmployeeProjects EP
    ON EP.EmployeeID=E.EmployeeID
GROUP BY D.DepartmentName
ORDER BY avg(EP.HoursWorked) DESC

--41.Department-wise employee count.
select count(E.EmployeeID) As 'Total Employees', D.DepartmentName
from Departments D
    JOIN Employees E on E.DepartmentID=D.DepartmentID
group by D.DepartmentID,D.DepartmentName
order by count(E.EmployeeID) DESC

--42.Average salary per department.
select AVG(Salary) AS 'Avg Salary', D.DepartmentName
from Employees E
    JOIN Departments D ON D.DepartmentID=E.DepartmentID
group by D.DepartmentName
ORDER by [Avg Salary] DESC

--43.Total salary paid per department

SELECT SUM(S.SalaryAmount) AS 'Total Salary', D.DepartmentName
from Employees E
    JOIN Salaries S on s.EmployeeID=E.EmployeeID
    join Departments D on D.DepartmentID=E.DepartmentID
GROUP BY D.DepartmentName

-- 44. Highest and lowest salary in each department
SELECT Max(S.SalaryAmount) AS 'Highest Salary', MIN(S.SalaryAmount) AS 'Lowest Salary', D.DepartmentName
from Employees E
    JOIN Salaries S on s.EmployeeID=E.EmployeeID
    join Departments D on D.DepartmentID=E.DepartmentID
GROUP BY D.DepartmentName

--45.Total hours worked per project.

select SUM(EP.HoursWorked) AS 'Total Worked', P.ProjectName
from EmployeeProjects EP
    join Projects P
    on p.ProjectID=EP.ProjectID
GROUP BY P.ProjectName
ORDER BY [Total Worked] desc

-- 47.Find departments with avg salary > 60000.
SELECT AVG(S.SalaryAmount) AS 'Average Salary', D.DepartmentName
from Employees E
    JOIN Salaries S on s.EmployeeID=E.EmployeeID
    join Departments D on D.DepartmentID=E.DepartmentID
GROUP BY D.DepartmentName
HAVING AVG(S.SalaryAmount) >60000

--48.Group employees by year of joining.
SELECT YEAR(JoiningDate) AS JoiningYear,
    STRING_AGG(FirstName, ', ') AS Employees
FROM Employees
GROUP BY YEAR(JoiningDate)
ORDER BY JoiningYear desc
;

--Top 3 departments with the most employees.

SELECT
    Top (3)
    count(EmployeeID) as 'No of Employee',
    D.DepartmentName
from
    Employees E
    join Departments D on E.DepartmentID = D.DepartmentID
group by
    D.DepartmentName

--Employees who earn above department average.

SELECT
    E.EmployeeID,
    E.FirstName,
    D.DepartmentName,
    S.SalaryAmount
FROM Employees E
    JOIN
    Salaries S ON S.EmployeeID = E.EmployeeID
    JOIN
    Departments D ON D.DepartmentID = E.DepartmentID
    JOIN (
    SELECT
        E.DepartmentID,
        AVG(S.SalaryAmount) AS AvgSalary
    FROM
        Employees E
        JOIN
        Salaries S ON S.EmployeeID = E.EmployeeID
    GROUP BY 
        E.DepartmentID
) DeptAvg ON E.DepartmentID = DeptAvg.DepartmentID
WHERE 
    S.SalaryAmount > DeptAvg.AvgSalary;

--Compare project hours per employee

select E.FirstName, P.ProjectName, SUM(EP.HoursWorked) AS'Total Hours'
from Employees E
    JOIN EmployeeProjects EP
    on EP.EmployeeID=E.EmployeeID
    JOIN Projects P
    ON P.ProjectID=EP.ProjectID
GROUP BY P.ProjectName,E.FirstName
ORDER BY SUM(EP.HoursWorked) DESC

-- Number of employees with salary brackets (40–60k, 60–80k, etc.)
SELECT
    CASE
        WHEN Salary BETWEEN 40000 AND 60000 THEN '40k-60k'
        WHEN Salary BETWEEN 60001 AND 80000 THEN '60k-80k'
        WHEN Salary BETWEEN 80001 AND 100000 THEN '80k-100k'
        ELSE 'Other'
    END AS Salary_Group,
    COUNT(*) AS Employees_Count
FROM Employees
GROUP BY 
    CASE
        WHEN Salary BETWEEN 40000 AND 60000 THEN '40k-60k'
        WHEN Salary BETWEEN 60001 AND 80000 THEN '60k-80k'
        WHEN Salary BETWEEN 80001 AND 100000 THEN '80k-100k'
        ELSE 'Other'
    END;

-- Monthly joining trend of employees.
SELECT FORMAT(JoiningDate,'MMMM') AS "Month Name", COUNT(EmployeeID)
AS "No of Employee"
FROM Employees
GROUP by FORMAT(JoiningDate,'MMMM')

--Department with max total hours worked.
select D.DepartmentName , Max(EP.HoursWorked) as "MaxTotalWork" from Employees E
join Departments D on E.DepartmentID=D.DepartmentID
join EmployeeProjects EP on EP.EmployeeID=E.EmployeeID
GROUP BY D.DepartmentName
ORDER BY MaxTotalWork desc
-- Number of unique projects per department.
select Distinct count(P.DepartmentID),D.DepartmentName,p.ProjectName
from Departments D
join Projects P
on D.DepartmentID=P.DepartmentID
group by D.DepartmentName,p.ProjectName

--------or
SELECT D.DepartmentName, COUNT(P.ProjectID) AS TotalProjects,
       STRING_AGG(P.ProjectName, ', ') AS ProjectNames
FROM Departments D
JOIN Projects P ON D.DepartmentID = P.DepartmentID
GROUP BY D.DepartmentName

--Projects with total hours above average.

SELECT 
    p.ProjectName,
    SUM(ep.HoursWorked) AS TotalHours
FROM 
    EmployeeProjects ep
JOIN 
    Projects p ON p.ProjectID = ep.ProjectID
GROUP BY 
    p.ProjectName
HAVING 
    SUM(ep.HoursWorked) > (
        SELECT 
            AVG(TotalHours)
        FROM (
            SELECT 
                ProjectID,
                SUM(HoursWorked) AS TotalHours
            FROM 
                EmployeeProjects
            GROUP BY 
                ProjectID
        ) AS AvgTable
    );

-- Find employee count grouped by project.
select count(Ep.EmployeeID) as 'Number of Employee ',P.ProjectName,
STRING_AGG(E.FirstName,',') as 'EmpName'
from Projects P
join EmployeeProjects Ep
on P.ProjectID=Ep.ProjectID
join Employees E
ON E.EmployeeID=EP.EmployeeID
GROUP by P.ProjectName

-- Group by multiple columns: department and salary range.

select E.Salary,D.DepartmentName
from Employees E
join Departments D
on E.DepartmentID=D.DepartmentID
group by E.Salary , D.DepartmentName

-- Count employees per department per joining year.
select count(E.EmployeeID),year(s.EffectiveFrom),D.DepartmentName
from Employees E
join Salaries S
on E.EmployeeID=S.EmployeeID
JOIN Departments D
on D.DepartmentID=E.DepartmentID
group by year(s.EffectiveFrom),D.DepartmentName

-- Employees with salary greater than average salary.
SELECT FirstName,Salary
FROM Employees
WHERE Salary > (
    SELECT AVG(Salary) 
    FROM Employees
);

-- Employees in departments with >5 employees.

SELECT E.*
FROM Employees E
JOIN (
    SELECT DepartmentID
    FROM Employees
    GROUP BY DepartmentID
    HAVING COUNT(*) > 5
) AS Sub
ON E.DepartmentID = Sub.DepartmentID;

-- Employees who worked on most projects

SELECT E.FirstName, COUNT(EP.ProjectID) AS ProjectCount
FROM Employees E
JOIN EmployeeProjects EP ON E.EmployeeID = EP.EmployeeID
GROUP BY E.FirstName
ORDER BY ProjectCount DESC;

-- Top employee(s) who worked on the most projects
SELECT E.FirstName, COUNT(EP.ProjectID) AS ProjectCount
FROM Employees E
JOIN EmployeeProjects EP ON E.EmployeeID = EP.EmployeeID
GROUP BY E.FirstName
HAVING COUNT(EP.ProjectID) = (
    SELECT MAX(ProjectTotal)
    FROM (
        SELECT COUNT(EP2.ProjectID) AS ProjectTotal
        FROM EmployeeProjects EP2
        JOIN Employees E2 ON EP2.EmployeeID = E2.EmployeeID
        GROUP BY E2.FirstName
    ) AS ProjectCounts
);

--Projects with highest total hours

SELECT P.ProjectName, SUM(EP.HoursWorked) AS TotalWorked
FROM EmployeeProjects EP
JOIN Projects P ON EP.ProjectID = P.ProjectID
GROUP BY P.ProjectName
HAVING SUM(EP.HoursWorked) = (
    SELECT MAX(ProjectTotal)
    FROM (
        SELECT SUM(EP2.HoursWorked) AS ProjectTotal
        FROM EmployeeProjects EP2
        JOIN Projects P2 ON EP2.ProjectID = P2.ProjectID
        GROUP BY P2.ProjectName
    ) AS TotalWorkedSubquery
);

-- Departments with the highest average salary
SELECT D.DepartmentName, AVG(E.Salary) AS AvgSalary
FROM Departments D
JOIN Employees E ON D.DepartmentID = E.DepartmentID
GROUP BY D.DepartmentName
HAVING AVG(E.Salary) = (
    SELECT MAX(DeptAvgSalary)
    FROM (
        SELECT AVG(E2.Salary) AS DeptAvgSalary
        FROM Departments D2
        JOIN Employees E2 ON D2.DepartmentID = E2.DepartmentID
        GROUP BY D2.DepartmentName
    ) AS AvgSalarySub
);

--Employees who joined earliest.

select firstname,JoiningDate from Employees 
where joiningDate= (select min(JoiningDate)from Employees)
-- Projects with no employees assigned
SELECT P.ProjectName
FROM Projects P
LEFT JOIN EmployeeProjects EP ON P.ProjectID = EP.ProjectID
WHERE EP.EmployeeID IS NULL;
-- Find second highest salary
SELECT firstname, salary
FROM Employees
WHERE salary = (
    SELECT MAX(salary)
    FROM Employees
    WHERE salary < (
        SELECT MAX(salary)
        FROM Employees
    )
);

-- Find N-th highest salary.
SELECT *
FROM (
    SELECT FirstName, Salary, DENSE_RANK() OVER (ORDER BY Salary DESC) AS salary_rank
    FROM Employees
) AS RankedSalaries
WHERE salary_rank = 2;

-- Employee(s) with the maximum salary
select firstname , salary from Employees
where salary=(select max(salary) from Employees)

-- List employees who joined on same date
SELECT FirstName, JoiningDate
FROM Employees
WHERE JoiningDate IN (
    SELECT JoiningDate
    FROM Employees
    GROUP BY JoiningDate
    HAVING COUNT(*) > 1
);

-- List employees who joined on same Month
SELECT FirstName, JoiningDate
FROM Employees
WHERE MONTH(JoiningDate) IN (
    SELECT MONTH(JoiningDate)
    FROM Employees
    GROUP BY MONTH(JoiningDate)
    HAVING COUNT(*) > 1
);

-- Find duplicate first names.
SELECT FirstName, COUNT(*) AS Count
FROM Employees
GROUP BY FirstName
HAVING COUNT(*) > 1;
--Employees with salary greater than their department’s average.
SELECT E.FirstName, E.Salary, E.DepartmentID
FROM Employees E
JOIN (
    SELECT DepartmentID, AVG(Salary) AS AvgDeptSalary
    FROM Employees
    GROUP BY DepartmentID
) D ON E.DepartmentID = D.DepartmentID
WHERE E.Salary > D.AvgDeptSalary;


-- Employees who worked more than average hours
SELECT e.FirstName
FROM Employees e
JOIN EmployeeProjects ep 
    ON e.EmployeeID = ep.EmployeeID
WHERE ep.HoursWorked > (
    SELECT AVG(HoursWorked) 
    FROM EmployeeProjects
);

-- Employees whose total hours > average total hours
WITH EmpTotal AS (
    SELECT ep.EmployeeID, SUM(ep.HoursWorked) AS TotalHours
    FROM EmployeeProjects ep
    GROUP BY ep.EmployeeID
)
SELECT e.FirstName, et.TotalHours
FROM Employees e
JOIN EmpTotal et ON e.EmployeeID = et.EmployeeID
WHERE et.TotalHours > (
    SELECT AVG(TotalHours) FROM EmpTotal
);


-- Rank : Rank function is used for ke rankong provide ki jati hai but 
-- one key rule is that ke agr value same hui like salary 1000 kisi bhi do rows ke liye to
-- dono rows ko same rank allocated ho jaegi let say 3 rank hui then next row ke liye 5th rank hi allocated hogi
-- 4 rank skipped ho jaegi 


-- Using DENSE_RANK()
--Same values → same rank.
--Next rank not skipped (no gaps)

--Using ROW_NUMBER()
--Ignores ties completely.
--Each row gets a unique number.

--Rank employees by salary without partition 
SELECT 
    EmployeeID, 
    Salary, 
    FirstName,
    RANK() OVER (ORDER BY Salary DESC) AS Rank
FROM Employees;

SELECT 
    EmployeeID, 
    Salary, 
    FirstName,
    DENSE_RANK() OVER (ORDER BY Salary DESC) AS Rank
FROM Employees;

SELECT 
    EmployeeID, 
    Salary, 
    FirstName,
    ROW_NUMBER() OVER (ORDER BY Salary DESC) AS Rank
FROM Employees;


-- Partition : Is used for ke result for part wise me divide kiya jae and 
-- then har part ko rank allocated ki jae like that ke hr department wise 
-- meko chaeye rank ke is department me 1st , 2nd ,3rd like that 

--Rank employees by salary with partition 
SELECT 
    EmployeeID, 
    FirstName,
    DepartmentID,
    Salary,
    RANK() OVER (
        PARTITION BY DepartmentID 
        ORDER BY Salary DESC
    ) AS DeptRank
FROM Employees;

-- Using DENSE_RANK()
--Same values → same rank.
--Next rank not skipped (no gaps)

--Using ROW_NUMBER()
--Ignores ties completely.
--Each row gets a unique number.

SELECT 
    EmployeeID, 
    FirstName,
    DepartmentID,
    Salary,
    DENSE_RANK() OVER (
        PARTITION BY DepartmentID 
        ORDER BY Salary DESC
    ) AS DeptRank
FROM Employees;

update Employees set Salary=85000 where EmployeeID=101

select * from employees

-- Dense rank employees by salary.
select EmployeeID , FirstName , salary ,
DENSE_RANK() over (ORDER BY salary desc ) rank from Employees

-- .Row number of each employee in department based on salary

select FirstName,EmployeeID,Salary,
ROW_NUMBER() over (order by salary desc) rank from Employees

-- Running total of salaries.
select EmployeeID,FirstName,Salary ,
sum(salary) over (order by EmployeeID ) as runningtotal from Employees

-- Cumulative sum of hours worked per employee
--UNBOUNDED PRECEDING = “start from the first row of this partition”
--CURRENT ROW = “include the current row”


SELECT 
    EmployeeID,
    HoursWorked,
    SUM(HoursWorked) OVER (
        PARTITION BY EmployeeID 
        ORDER BY ProjectID ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS CumulativeHours
FROM EmployeeProjects;

-- Lead function to get next joining date
-- The LEAD() function is a window function in SQL Server.
-- It is used to look ahead (forward) in your result set and get the 
-- value from the next row

SELECT 
    FirstName,
    JoiningDate,
    LEAD(JoiningDate) OVER (ORDER BY JoiningDate) AS NextJoiningdate
FROM Employees;


-- opposite function LAG() (to look at the previous row)


SELECT 
    FirstName,
    Salary,
    LAG(Salary) OVER (ORDER BY Salary) AS priviousSalary
FROM Employees;
-- Compare salary with department average using window function.

SELECT 
    EmployeeID,
    DepartmentID,
    Salary,
    AVG(Salary) OVER (PARTITION BY DepartmentID) AS DeptAvgSalary
FROM Employees;

--Partition employee data by department

SELECT 
    EmployeeID, 
    FirstName,
    DepartmentID,
    Salary,
    RANK() OVER (
        PARTITION BY DepartmentID 
        ORDER BY Salary DESC
    ) AS DeptRank
FROM Employees;


-- Group employees by project and rank them by hours worked
SELECT 
    ProjectID,
    EmployeeID,
    HoursWorked,
    RANK() OVER (
        PARTITION BY ProjectID 
        ORDER BY HoursWorked DESC
    ) AS WorkRank
FROM EmployeeProjects;

-- Percent rank of salaries
select EmployeeID,FirstName,
PERCENT_RANK() over (PARTITION BY DepartmentID order by salary desc)  as PercentRank
from Employees


select * from Employees
select * from EmployeeProjects












--Employees who joined in last 6 months.
SELECT EmployeeID, FirstName, JoiningDate 
FROM Employees
WHERE joiningDate >= DATEADD(month, -6, GETDATE());

--Extract year and month from joining date.

select year(JoiningDate),MONTH(JoiningDate),FORMAT(JoiningDate, 'MMMM') 
AS MonthName from Employees

--Group employees by quarter

SELECT 
    DATEPART(QUARTER, joiningDate) AS Quarter,
    COUNT(*) AS EmployeeCount
FROM 
    Employees
GROUP BY 
    DATEPART(QUARTER, joiningDate)
ORDER BY 
    Quarter;
-- Employees who joined on a weekend.
select count(EmployeeID) from employees
where DATEPART(WEEKDAY, joiningDate) IN (1, 7);
-- Days since joining.

SELECT FirstName, DATEDIFF(DAY, JoiningDate, GETDATE()) AS Days_Since_Joining
FROM Employees;

-- Find leap year joiners.
SELECT COUNT(*) AS NumEmployeesJoinedInLeapYear
FROM Employees
WHERE (
    (YEAR(JoiningDate) % 4 = 0 AND YEAR(JoiningDate) % 100 != 0)
    OR YEAR(JoiningDate) % 400 = 0
);

-- Employees who joined in a specific month (e.g., March)
select FirstName from Employees
where MONTH(JoiningDate)='3'

-- or 
SELECT FirstName 
FROM Employees
WHERE DATENAME(MONTH, JoiningDate) = 'March';

-- Employees who joined in 2020 Q2

select FirstName from Employees
where YEAR(JoiningDate)=2020 and 
MONTH(JoiningDate) BETWEEN 4 and 6
-- Calculate age assuming DOB column exists.
ALTER TABLE Employees
ADD DOB Date;

UPDATE Employees
SET DOB = '1999-02-12' --  year-month-date
WHERE FirstName = 'Alice';

UPDATE Employees
SET DOB = '1996-03-25'
WHERE FirstName = 'Bob' 

UPDATE Employees
SET DOB = '2000-08-19'
WHERE FirstName = 'Charlie' 

UPDATE Employees
SET DOB = '1988-02-27'
WHERE FirstName = 'Diana' 

UPDATE Employees
SET DOB = '2002-01-26'
WHERE FirstName = 'Evan' 

select FirstName ,DATEDIFF(YEAR,DOB,GETDATE())  as Age from Employees
-- Find employees with anniversaries this month.
Select FirstName,MONTH(JoiningDate) as 'Month Name' from Employees
where Month(JoiningDate)=Month(GETDATE())
-- Add 6 months to joining date
UPDATE Employees
SET JoiningDate = DATEADD(MONTH, 6, JoiningDate);

--Difference in months between now and joining.
select
DATEDIFF(MONTH,JoiningDate,GETDATE()) as "Diffrence between them"
,FirstName,JoiningDate from Employees

select DATEDIFF(year,JoiningDate,GETDATE()) as "Total year"
,FirstName,JoiningDate  from Employees

--Combine employee lists from two different tables

-- Union: UNION removes duplicates.
-- UNION ALL: keeps duplicates. 
-- For union there is one must condition which is nessecary
-- and that is in the select statment no of columns from both table must be same 
-- and corresponded column's data type must be same 
-- Lets union Employee and Department

select EmployeeID,FirstName from Employees
UNION 
Select DepartmentID,DepartmentName from Departments
-- Find common employees in two departments (using INTERSECT).
select EmployeeID FROM Employees
where DepartmentID=1

INTERSECT

select EmployeeID FROM Employees
where DepartmentID=2

-- Employees in IT but not in HR (using EXCEPT).

--SELECT employee_name
--FROM employees
--WHERE department = 'IT'

--EXCEPT

--SELECT employee_name
--FROM employees
--WHERE department = 'HR';
--Use UNION to get unique department names from two tables

--SELECT department_name FROM current_departments
--UNION
--SELECT department_name FROM archived_departments;

--Employees who worked in multiple departments

SELECT FirstName
FROM employees
GROUP BY FirstName
HAVING COUNT(DISTINCT DepartmentID) > 1;

--Employees who worked in all available projects

SELECT EmployeeID
FROM EmployeeProjects

GROUP BY EmployeeID
HAVING COUNT(DISTINCT ProjectID) = (SELECT COUNT(DISTINCT ProjectID) FROM EmployeeProjects);

SELECT*
FROM Projects

SELECT *
FROM Employees

SELECT*
FROM EmployeeProjects

SELECT *
FROM Employees

SELECT *
FROM Departments



select * from Salaries




USE employee_db;
-- Query 1: Average Salary by Department
SELECT
    Department,
    ROUND(AVG(MonthlyIncome),2) AS Avg_Salary
FROM hr_analytics
GROUP BY Department
ORDER BY Avg_Salary DESC;
-- 2. Highest-Paid Employees
SELECT
    EmpID,
    Department,
    JobRole,
    MonthlyIncome
FROM hr_analytics
ORDER BY MonthlyIncome DESC
LIMIT 10;
-- Query 3: Employee Attrition
SELECT
    Attrition,
    COUNT(*) AS Employees
FROM hr_analytics
GROUP BY Attrition;
-- Query 4: Attrition Rate
SELECT
ROUND(
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
    * 100.0 / COUNT(*), 2
) AS Attrition_Rate
FROM hr_analytics;
-- Query 5: Employees by Experience Group
SELECT
CASE
    WHEN TotalWorkingYears BETWEEN 0 AND 5 THEN '0-5 Years'
    WHEN TotalWorkingYears BETWEEN 6 AND 10 THEN '6-10 Years'
    WHEN TotalWorkingYears BETWEEN 11 AND 20 THEN '11-20 Years'
    ELSE '20+ Years'
END AS Experience_Group,
COUNT(*) AS Employees
FROM hr_analytics
GROUP BY Experience_Group
ORDER BY Employees DESC;
-- Query 6: Department-wise Employee Count
SELECT
    Department,
    COUNT(*) AS Total_Employees
FROM hr_analytics
GROUP BY Department
ORDER BY Total_Employees DESC;
-- Query 7: Gender Distribution
SELECT
    Gender,
    COUNT(*) AS Employees
FROM hr_analytics
GROUP BY Gender;
-- Query 8: Average Salary by Job Role
SELECT
    JobRole,
    ROUND(AVG(MonthlyIncome),2) AS Average_Salary
FROM hr_analytics
GROUP BY JobRole
ORDER BY Average_Salary DESC;
-- Query 9: Attrition by Department
SELECT
    Department,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left
FROM hr_analytics
GROUP BY Department
ORDER BY Employees_Left DESC;
-- Query 10: Age Group Distribution
SELECT
    AgeGroup,
    COUNT(*) AS Employees
FROM hr_analytics
GROUP BY AgeGroup
ORDER BY Employees DESC;



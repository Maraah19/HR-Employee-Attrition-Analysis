USE amara2
GO
SELECT * from [HR-Employee-Attrition]
--1) Average age of employees
select AVG(age) AS AverageAge from [HR-Employee-Attrition]
--2) Average monthly income for each job role
select Job_Role, avg(Monthly_Income) as AverageMonthlyIncome from [HR-Employee-Attrition]
group by Job_Role
--3) Average years at company by department 
SELECT Department, avg(Years_At_Company) as AverageYearsStayed from [HR-Employee-Attrition]
group by Department
order by AverageYearsStayed
--4)Job role with the highest average job satisfaction
select top 1 Job_Role, avg(Job_Satisfaction) as AverageJobSatisfaction from [HR-Employee-Attrition]
group by Job_Role
order by AverageJobSatisfaction desc
--5) What is the attrition rate by education field
select Attrition, Education_Field, count(*) as Total from [HR-Employee-Attrition] 
group by Education_Field, Attrition
--6)Top 10 highest earning employees
select top 10 * from [HR-Employee-Attrition]
order by Monthly_Income desc
--7)what is the average work life balance by department
select Department, avg(Work_Life_Balance) as AverageWorkLifeBalance from [HR-Employee-Attrition]
group by Department
order by AverageWorkLifeBalance
--8) employees with more than 5 years since last promotion
select * from [HR-Employee-Attrition]
where Years_Since_Last_Promotion > 5
--9)count employees whose distance from home is more than 20km and see how many of them left and how many remained
select count (*) AS TotalEmployee, Attrition from [HR-Employee-Attrition]
where Distance_From_Home_km > 20
group by Attrition
order by TotalEmployee
--10) Average monthly income by job role for employee who left and those who stayed
select avg(Monthly_Income) as AverageMonthlyIncome, Job_Role,  Attrition from [HR-Employee-Attrition]
group by Job_Role, Attrition
--11) show the average monthly rate by Gender of those who left
select avg(Monthly_Rate) as AverageRate, Gender, Attrition FROM [HR-Employee-Attrition]
where Attrition = 0
group by Gender, Attrition
order by AverageRate
--12) Show the minimum daily rate of those that stayed
select Attrition, MIN(Daily_Rate) as MinRate from [HR-Employee-Attrition]
where Attrition = 1
GROUP BY Attrition


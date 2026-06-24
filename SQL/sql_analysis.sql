use hr_analytics;

# Total number of employees -1470
select count(employeenumber) as total_emp
from cleaned_data;

# first 10 records
select * from cleaned_data
limit 10;

#unique department 
select distinct(department) as department
from cleaned_data;

#how many unique department -3
select count(distinct(department)) as total_dep
from cleaned_data;

#unique jobroles
select distinct(jobrole)
from cleaned_data;

#employees who left the company-237
select count(*) from cleaned_data
where attrition="Yes";

# employee with overtime
select row_number() OVER() as NO,employeenumber as employee, overtime
from cleaned_data
where overtime="Yes";

#emp older than 40
select row_number() over() as NO,age, jobrole, department from cleaned_data
where age>40;

# emp from human resource
select row_number() over() as no, employeeNumber,department from cleaned_data
where department="Human Resources";

#which roles earning more than 10000
select ROW_NUMBER() OVER() AS No, employeenumber,jobrole
from cleaned_data
where MonthlyIncome>10000;

# max & minof monthly income
select max(MonthlyIncome) from cleaned_data;
select min(MonthlyIncome) from cleaned_data;  

# avg monthly incme and age
select avg(MonthlyIncome) from cleaned_data;
select avg(age) from cleaned_data;

#15

#emp num in each depart
select count(employeenumber) as empcount, department 
from cleaned_data
group by department;

#emplyees stayed vs left
select attrition, count(employeenumber) as empcount
from cleaned_data
group by attrition;

#Avg salry by department
select round(avg(monthlyincome),2) as avgsalary, department
from cleaned_data
group by department;

#empl for each jobrole
select count(*) as empcount, jobrole
from cleaned_data
group by jobrole 
order by empcount desc;

#empcount overtime vs non over time
select overtime,count(*) as countemp
from cleaned_data
group by overtime;

#depart with highest avgsalary
select department, avg(monthlyincome) as avgsalary
from cleaned_data
group by department
order by avgsalary desc
limit 1;

# top 10 highest paid emp
select age, employeenumber, jobrole, monthlyincome 
from cleaned_data
order by monthlyincome  desc
limit 10;

# top 5 common job roles
select jobrole, count(*) as  totalemp
from cleaned_data
group by jobrole
order by totalemp desc
limit 5;

select count(jobrole) as myjobrole, employeenumber
from cleaned_data
group by jobrole
having myjobrole >1
order by myjobrole desc
limit 5;

# job role with highest attrition
select attrition, jobrole, count(*) as total
from cleaned_data
where  attrition="Yes"
group by jobrole
order by total desc; 

# department wise attrition 
select Department, attrition, count(*) as total
from cleaned_data
where attrition="Yes"
group by Department
order by total desc;

#overtime effects attrition?
select overtime, attrition , count(*) as total
from cleaned_data
group by overtime,attrition
having attrition="Yes"
order by total desc;

#worklife balance distribution
-------------
select WorkLifeBalance, attrition,count(*) as total
from cleaned_data
where WorkLifeBalance(1)="Bad" OR WorkLifeBalance(2)="good" OR WorkLifeBalance(3)="very good" OR WorkLifeBalance(4)="excellent"
group by WorkLifeBalance,attrition
having attrition="Yes"
order by total desc;

#avg jobsatisfaction by department
select round(avg(jobsatisfaction),1) as avgjobsatisfaction,department,count(*) as total
from cleaned_data
group by department
order by avgjobsatisfaction desc;

#exp and slaraly connection
select yearsatcompany, round(avg(monthlyincome),2) as avgsalary
from cleaned_data
group by yearsatcompany
order by avgsalary desc;

#avg income jobrole
select round(avg(monthlyincome),2) as avgsalary,jobrole
from cleaned_data
group by jobrole
order by avgsalary;

#total payroll expense
SELECT SUM(MonthlyIncome) AS total_payroll
FROM cleaned_data;

#emp with overtime and low jobsatisfaction
select overtime, jobsatisfaction,count(*) as countemp
from cleaned_data
where jobsatisfaction<=2
and overtime="Yes"
GROUP BY overtime, jobsatisfaction
order by countemp desc;

SELECT employeenumber,overtime,jobsatisfaction
FROM cleaned_data
WHERE OverTime='Yes'
AND JobSatisfaction<=2;

#emp highsalry still left company
select monthlyincome ,attrition, jobrole
from cleaned_data
where attrition="Yes"
and monthlyincome>10000
limit 5;

#overall attrition percent
SELECT
ROUND(
100.0 * SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
/ COUNT(*),2
) AS attrition_percentage
FROM employee_attrition;

#which age grp has high attrition
select age, count(attrition ) as attrit
from cleaned_data
where attrition="Yes"
group by age
order by attrit desc;

#department with low jobsatisfaction
select department, jobsatisfaction,count(*) as countemp
from cleaned_data
where jobsatisfaction=1
group by department
order by countemp desc;

#Attrition Across Travel Categories
SELECT BusinessTravel,
Attrition,
COUNT(*) AS total
FROM cleaned_data
GROUP BY BusinessTravel, Attrition;

#employee with long tenure
SELECT 
    jobrole,
    department, 
    yearsatcompany,
    COUNT(*) AS empcount
FROM cleaned_data
GROUP BY jobrole, department, yearsatcompany
ORDER BY empcount DESC, department, jobrole;

SELECT JobSatisfaction,
OverTime,
Attrition,
COUNT(*) AS total
FROM cleaned_data
GROUP BY JobSatisfaction, OverTime, Attrition;

#Satisfaction + Overtime + Attrition Insights
SELECT JobSatisfaction,
OverTime,
Attrition,
COUNT(*) AS total
FROM cleaned_data
GROUP BY JobSatisfaction, OverTime, Attrition;
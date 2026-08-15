
                                                            ---— CUSTOMER PROFILE
								
1. What is the average age of applicants?
select avg(age) as avg_age 
from loan_applications;

2. What is the gender distribution?
select gender,count(gender) as gender_distribution 
from loan_applications group by gender;

3. Which education level has the most applicants?
select education_level,
       count(application_id) as Total_applicants
from loan_applications 
group by education_level
order by Total_applicants desc;

4. Which employment status is most common?
select employment_status,
       count(application_id) as Total_applicants
from loan_applications 
group by employment_status
order by Total_applicants desc;

5. What is the average annual income?
select round(avg( annual_income),2) as avg_annual 
from loan_applications;

6. What is the average credit score?
select round(avg(credit_score),2) as avg_credit
from loan_applications;

7. What is the average number of dependents?
select round(avg(dependents),2) as avg_dependents
from loan_applications;

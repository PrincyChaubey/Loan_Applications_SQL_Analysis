                                                    ------ LOAN PORTFOLIO OVERVIEW-------
Q1. How many total loan applications were received?
select count(application_id) as total_application 
from loan_applications;

Q2. How many applications were approved?
select * from loan_applications limit 10;
select count(loan_approved) as approved_applicaion 
from loan_applications
where loan_approved ='Approved'


Q3. How many were rejected?
select count(case when loan_approved='Rejected' then 1 end) as approved_application 
from loan_applications


Q4. What is the overall loan approval rate?
select round(count(case when loan_approved='Rejected' then 1 end)*100.0/ count (*),2)as approval_rate 
from loan_applications ;

Q5. What is the total loan amount requested?
select sum(loan_amount)as amount_requested 
from loan_applications

Q6. What is the total approved loan amount?
select sum(approved_amount) as approved_loan 
from loan_applications;

Q7. What is the average loan amount?
select round(avg(loan_amount),2) as avg_loan_amount 
from loan_applications

Q8. What is the average approved amount?
select round(avg(approved_amount),2) as avg_approved_loan 
from loan_applications;

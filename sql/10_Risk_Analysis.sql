                                                              - ----RISK ANALYSIS
							
1. Which applicants have the highest risk?
select application_id,
       risk_score 
from loan_applications 
where risk_score=(select max(risk_score) from loan_applications);
---got all the application_id where risk score is 100.


2 Are high-risk applicants receiving large loan amounts?
select * from loan_applications 

3. What is the average approved amount by risk category?
select risk_category 
from loan_applications ;

4. Does Risk_Score correspond to Default_Risk?

select avg(risk_score),default_risk 
from loan_applications 
group by default_risk

                                                          -- — APPROVAL AMOUNT ANALYSIS
							  

1. Which loan purpose has the highest approval ratio?
select  count(loan_approved) as approved_,
        loan_purpose 
from loan_applications
where loan_approved ='Approved'
group by loan_purpose
order by approved_ desc;

   --or

select  sum(case when loan_approved='Approved' then 1 end) as approved_,
        loan_purpose 
from loan_applications
group by loan_purpose
order by approved_ desc;

2. Which risk category receives the highest approval ratio?
select 
     case
	    when risk_score >80 then 'high_risk'
		when risk_score <= 80 and risk_score > 60 then 'medium_risk'
		else 'low_risk'
	 end as risk_category,
	 avg(interest_rate) as avg_rate 
from loan_applications
group by risk_category
order by avg_rate desc;

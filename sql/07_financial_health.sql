                                                        ----FINANCIAL HEALTH
1. Does income affect approval?
 select 
     case
	    when annual_income > 150000 then 'high_income'
		when  annual_income<=150000  and annual_income > 80000 then 'medium_income'
		else 'low_income'
	 end as income_category,
	 count(*)filter(where loan_approved='Approved') as total_approved,
	 round(count(*)filter(where loan_approved='Approved')*100.0/count(*),2) as approval_rate		
from loan_applications 
group by income_category
order by approval_rate desc;
---yes it is affecting ,higher the income higher the approval rate

2. Does debt-to-income ratio affect approval?
 select 
     case
	    when debt_to_income_ratio > 30 then 'high_ratio'
		when debt_to_income_ratio<=30 and debt_to_income_ratio > 15 then 'medium_ratio'
		else 'low_ratio'
	 end as ratio_category,
	 count(*)filter(where loan_approved='Approved') as total_approved,
	 round(count(*)filter(where loan_approved='Approved')*100.0/count(*),2) as approval_rate		
from loan_applications 
group by ratio_category
order by approval_rate desc;
---lower ratio leads to higher approval rate.


3. Does savings balance affect approval?
select 
     case
	    when savings_balance > 60000 then 'high_saving'
		when savings_balance<=60000 and savings_balance > 40000 then 'medium_saving'
		else 'low_saving'
	 end as saving_category,
	 count(*)filter(where loan_approved='Approved') as total_approved,
	 round(count(*)filter(where loan_approved='Approved')*100.0/count(*),2) as approval_rate		
from loan_applications 
group by saving_category
order by approval_rate desc;
--yes high saving leads to high approval rate.



                                                        ---- LOAN CHARACTERISTICS
1. Which loan purpose is most common?
select loan_purpose ,
       count(application_id) as total_applicant 
from loan_applications 
group by loan_purpose
order by total_applicant desc;

2. Which loan purpose has the highest approval rate?
select 
      loan_purpose,
	  count(*)filter(where loan_approved='Approved') as total_approved,
	  round(count(*)filter(where loan_approved='Approved')*100.0/count(*),2) as approval_rate		
from loan_applications 
group by loan_purpose
order by approval_rate desc;

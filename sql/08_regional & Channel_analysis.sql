                                                         ----REGIONAL ANALYSIS
				 
1. Which region has the most applications?
select region,count(application_id) as total_applications 
from loan_applications
group by region
order by total_applications desc;
 ---south
 
2. Which region has the highest approval rate?
select  region,
        count(*)filter(where loan_approved='Approved') as total_approved,
		count(*) as total_applicant,
		round(count(*)filter(where loan_approved='Approved')*100.0/count(*),2) as approval_rate		
from loan_applications 
group by region
order by approval_rate desc;

3. Which region requests the highest average loan amount?
select region, 
       avg(loan_amount) as avg_loan 
from loan_applications 
group by region
order by avg_loan desc;
---west

4. Which region has the highest average income?
select region, 
       avg(annual_income) as avg_annual
from loan_applications 
group by region
order by avg_annual desc;
--east
 
                                                            --- CHANNEL ANALYSIS
					 
1. Which application channel receives the most applications?
select application_channel,
       count(application_id) 
from loan_applications
group by application_channel
order by count(application_id) desc;
---yes online application are highest

2. Which channel has the highest approval rate?
select  application_channel,
        count(*)filter(where loan_approved='Approved') as total_approved,
		count(*) as total_applicant,
		round(count(*)filter(where loan_approved='Approved')*100.0/count(*),2) as approval_rate		
from loan_applications 
group by application_channel
order by approval_rate desc;
---mobile app has the highest approval rate .

3. Which channel has the highest average loan amount?
select  application_channel,
		round(avg(Loan_amount),2) as approved_amount		
from loan_applications 
group by application_channel
order by approved_amount desc;

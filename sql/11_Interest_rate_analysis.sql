                                                              ---— INTEREST RATE ANALYSIS
						 
1. What is the average interest rate?

select round(avg(interest_rate),2)as avg_rate 
from loan_applications;

2. Does higher risk correspond to higher interest rates?

select 
     case
	    when risk_score >80 then 'high_risk'
		when risk_score <= 80 and risk_score > 60 then 'medium_risk'
		else 'low_risk'
	 end as "risk_category",
	 avg(interest_rate) as avg_rate 
from loan_applications
group by risk_category
order by avg_rate desc;

---Yes interest rate is higher in high_risk.

3. Does credit score affect interest rate?
select 
     case
	    when credit_score >600 then 'high_score'
		when credit_score <= 600 and credit_score > 500 then 'medium_score'
		else 'low_score'
	 end as score_category,
	 avg(interest_rate) as avg_rate 
from loan_applications
group by score_category
order by avg_rate desc;
---Yes low credit score leads to higher interest rate. 

4. Does loan amount affect interest rate?
select * from loan_applications limit 10
select 
     case
	    when Loan_amount > 300000 then 'high_amount'
		when Loan_amount <= 300000 and Loan_amount > 100000 then 'medium_amount'
		else 'low_amount'
	 end as Loan_amount_category,
	 avg(interest_rate) as avg_rate 
from loan_applications
group by Loan_amount_category
order by avg_rate desc;

--low loan amount category leads higher rate.

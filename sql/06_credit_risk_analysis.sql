                                                          --- APPROVAL ANALYSIS

1. What is the approval rate by employment status?
select employment_status,
       count(loan_approved) as total_number,
	   count(case when loan_approved='Approved'then 1 end)as approved_number,
	  round(count(case when loan_approved='Approved'then 1 end)*100.0/count(loan_approved),2) as approval_rate
from loan_applications
group by employment_status;


 
                                                         -----CREDIT RISK ANALYSIS-----
						 
1. Does credit score affect loan approval?
select 
     case
	    when credit_score >600 then 'high_score'
		when credit_score <= 600 and credit_score > 500 then 'medium_score'
		else 'low_score'
	 end as score_category,
	 count(case when loan_approved='Approved' then 1 end) as total_approval,
	 count(loan_approved) as total_application,
	 round(count(case when loan_approved='Approved' then 1 end)*100.0/count(loan_approved),2) as approval_rate	 
from loan_applications
group by score_category
order by total_approval desc;

---higher the score higher the approval

2. What is the average credit score of approved vs rejected applicants?
select  loan_approved,
        avg(credit_score) as avg_score 
from loan_applications group by loan_approved;



3. What is the approval rate by Default_Risk?
select  default_risk,
        count(*)filter(where loan_approved='Approved') as total_approved,
		round(count(*)filter(where loan_approved='Approved')*100.0/count(*),2) as approval_rate		
from loan_applications 
group by default_risk;


4. Does previous loan status affect approval?

select  previous_loan_status,
        count(*)filter(where loan_approved='Approved') as total_approved,
		count(*) as total_applicant,
		round(count(*)filter(where loan_approved='Approved')*100.0/count(*),2) as approval_rate		
from loan_applications 
group by previous_loan_status
order by approval_rate;


5. Does late payment history affect approval?
select  late_payments_last_2_years,
        count(*)filter(where loan_approved='Approved') as total_approved,
		count(*) as total_applicant,
		round(count(*)filter(where loan_approved='Approved')*100.0/count(*),2) as approval_rate		
from loan_applications 
group by late_payments_last_2_years
order by approval_rate desc;

                                                                ---yes it is affecting.

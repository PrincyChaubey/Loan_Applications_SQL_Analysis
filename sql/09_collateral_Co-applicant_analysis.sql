                                                        ---- COLLATERAL & PROPERTY
			  
1. Does having collateral increase approval rate?
select  collateral,
        count(*)filter(where loan_approved='Approved') as total_approved,
		count(*) as total_applicant,
		round(count(*)filter(where loan_approved='Approved')*100.0/count(*),2) as approval_rate		
from loan_applications 
group by collateral
order by approval_rate desc;
---yes


2. Does property ownership affect approval?
select  property_ownership,
        count(*)filter(where loan_approved='Approved') as total_approved,
		count(*) as total_applicant,
		round(count(*)filter(where loan_approved='Approved')*100.0/count(*),2) as approval_rate		
from loan_applications 
group by property_ownership
order by approval_rate desc;

3. Does residential status affect approval?
select  residential_status,
        count(*)filter(where loan_approved='Approved') as total_approved,
		count(*) as total_applicant,
		round(count(*)filter(where loan_approved='Approved')*100.0/count(*),2) as approval_rate		
from loan_applications 
group by residential_status
order by approval_rate desc;

---no significant affect 


                                                          ---— CO-APPLICANT ANALYSIS
	
1. Does having a co-applicant affect approval?

select  co_applicant,
        count(*)filter(where loan_approved='Approved') as total_approved,
		count(*) as total_applicant,
		round(count(*)filter(where loan_approved='Approved')*100.0/count(*),2) as approval_rate		
from loan_applications 
group by co_applicant
order by approval_rate desc;
----yes 

2. Does having a co-applicant affect approved loan amount?
select  co_applicant,
		round(avg(loan_amount)filter(where loan_approved='Approved'),2) as approval_amount		
from loan_applications 
group by co_applicant
order by approval_amoun desc;

---no big difference


3. Does having collateral + co-applicant produce higher approval rates?
select  co_applicant,
        collateral,
        count(*)filter(where loan_approved='Approved') as total_approved,
		count(*) as total_applicant,
		round(count(*)filter(where loan_approved='Approved')*100.0/count(*),2) as approval_rate		
from loan_applications 
group by co_applicant,collateral
order by approval_rate desc;
----yes 

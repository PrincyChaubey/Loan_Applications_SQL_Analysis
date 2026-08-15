                                                      --Data cleaning & validation
 --checking duplicate_id

select application_id,
       count(*) as duplicant_count 
from loan_applications 
group by application_id 
having count(*)>1;

--Count total unique applications

select count(distinct application_id)as total_application 
from loan_applications;


                                                          --Data Cleaning --
                                                     --- Basic Data Understanding

1. How many rows are present in the dataset?
select count(*) from loan_applications;
--30000

2. How many columns are present?
select
    count(column_name)    
from information_schema.columns
where table_name = 'loan_applications'
--36

3. What are the data types of all columns?
select
    column_name,
    data_type
from information_schema.columns
where table_name = 'loan_applications'
order by ordinal_position;


4. Is `Application_ID` unique for every application?
select distinct (application_id) 
from loan_applications;
  --getting 30000 rows that means it is unique.

5. Are there any duplicate applications?
select application_id,
       count(*) as duplicant_count 
from loan_applications 
group by application_id 
having count(*)>1;

6. Are there any completely duplicated rows?
select count(distinct application_id)as total_application 
from loan_applications;

                                                         ----  Missing Values----

1. Which columns contain NULL values?
select count(age) as missing_age 
from loan_applications
where age is null 

select count(*) as total_rows,
     count(age) as age_present,
	 count(gender) as gender_present,
	 count(annual_income) as incume_present,
	 count(credit_score) as score_present,
	 count(loan_amount) as loan_present,
	 count(default_risk) as risk_present
from loan_applications
--No null values found in any of the column in the dataset



                                                    ---- Data Quality and Invalid Values-----

1. Are there negative values in `Age`?
select age 
from loan_applications 
where age <0;

2. Are there unrealistic values in `Age`?
select age 
from loan_applications 
where age >100;

3. Are there negative values in `Annual_Income`?
select annual_income
from loan_applications 
where annual_income<0;

4. Are there negative values in `Monthly_Income`?
select monthly_income
from loan_applications 
where monthly_income<0;

5. Does `Monthly_Income` approximately correspond to `Annual_Income / 12`?
select count(monthly_income)
from loan_applications 
where monthly_income = annual_income/12;

Not every monthly_income is =`Annual_Income / 12`?

6. Are there negative values in `Credit_Score`?
select credit_score
from loan_applications 
where credit_score<0;


7. Are there negative values in `Credit_History_Years`?
select Credit_History_Years
from loan_applications 
where Credit_History_Years<0;

8. Are there negative values in `Existing_Loans`?
select Existing_Loans
from loan_applications 
where Existing_Loans<0;

9. Are there negative values in `Late_Payments_Last_2_Years`?
select Late_Payments_Last_2_Years
from loan_applications 
where Late_Payments_Last_2_Years<0;

10. Are there negative values in `Loan_Amount`?
select Loan_Amount
from loan_applications 
where Loan_Amount<0;


11. Are there negative values in `Interest_Rate`?
select Interest_Rate
from loan_applications 
where Interest_Rate<0;


12. Are there negative values in `Savings_Balance`?
select Savings_Balance
from loan_applications 
where Savings_Balance<0;

13. Are there negative values in `Checking_Balance`?
select Checking_Balance
from loan_applications 
where Checking_Balance<0;

14. Are there negative values in `Total_Assets`?
select Total_Assets
from loan_applications 
where Total_Assets<0;

15. Are there negative values in `Total_Liabilities`?
select Total_Liabilities
from loan_applications 
where Total_Liabilities<0;

16. Are there negative values in `Monthly_Debt_Payment`?
select Monthly_Debt_Payment
from loan_applications 
where Monthly_Debt_Payment<0;

17. Are there negative values in `Dependents`?
select Dependents
from loan_applications 
where Dependents<0;

18. Are there negative values in `Bank_Account_Age_Years`?
select Bank_Account_Age_Years
from loan_applications 
where Bank_Account_Age_Years<0

19. Are there negative values in `Risk_Score`?
select Risk_Score
from loan_applications 
where Risk_Score<0;

20. Are there negative values in `Approved_Amount`?
select Approved_Amount
from loan_applications 
where Approved_Amount<0;

--- from above quesries we got to know that no invalid value found in any of the column

                                                           ----  Categorical Data Cleaning----

1. What unique values exist in `Gender`?
select distinct(gender) 
from loan_applications;


2. What unique values exist in `Marital_Status`?
select distinct(marital_status) 
from loan_applications;


3. What unique values exist in `Education_Level`?
select distinct(education_level) 
from loan_applications;


4. What unique values exist in `Employment_Status`?
select distinct(employment_status) 
from loan_applications;

5. What unique values exist in `Loan_Purpose`?
select distinct(Loan_Purpose) 
from loan_applications;

6. What unique values exist in `Property_Ownership`?
select distinct(Property_Ownership) 
from loan_applications;

7. What unique values exist in `Residential_Status`?
select distinct(Residential_Status) 
from loan_applications;

8. What unique values exist in `Co_Applicant`?
select distinct(Co_Applicant) 
from loan_applications;

9. What unique values exist in `Collateral`?
select distinct(Collateral) 
from loan_applications;

10. What unique values exist in `Application_Channel`?
select distinct(Application_Channel) 
from loan_applications;

11. What unique values exist in `Region`?
select distinct(Region) 
from loan_applications;

12. What unique values exist in `Previous_Loan_Status`?
select distinct(Previous_Loan_Status) 
from loan_applications;

13. What unique values exist in `Default_Risk`?
select distinct(Default_Risk) 
from loan_applications;

14. What unique values exist in `Loan_Approved`?
select distinct(Loan_Approved) 
from loan_applications;
                            
                                ---we have check all the hygiene check ,Dataset is almost clean---

create database bank_analytics;
use bank_analytics;
select*from main_datap;

kpi1 Year wise loan amount Stats

SELECT YEAR(issue_d) AS loan_year, SUM(loan_amnt) AS total_loan_amount
FROM main_datap
GROUP BY loan_year
ORDER BY loan_year;


2 Grade and sub grade wise revol_bal

SELECT grade, sub_grade, SUM(revol_bal) AS total_revol_bal
FROM main_datap 
GROUP BY grade, sub_grade
ORDER BY grade, sub_grade;


3 Total Payment for Verified Status Vs Total Payment for Non Verified Status

SELECT verification_status,round(SUM(total_pymnt),2)as Total_payment
FROM main_datap
GROUP BY 
    verification_status;
    
 4   State wise loan status
    
SELECT addr_state,last_credit_pull_d,loan_status, COUNT(*) AS count_of_loans
FROM main_datap
GROUP BY addr_state,last_credit_pull_d,loan_status
ORDER BY addr_state,last_credit_pull_d,loan_status;

5 Month wise loan status

SELECT monthname(issue_d) AS month,
       loan_status,
       COUNT(*) AS count_of_loans
FROM main_datap
GROUP BY month, loan_status
ORDER BY month, loan_status;

6 other kpis
avg loan size

SELECT AVG(loan_amnt) AS average_loan_size
FROM main_datap;

home ownership vs last payment
SELECT home_ownership, last_pymnt_d, round(sum(total_pymnt),2) AS total_payments
FROM main_datap 
GROUP BY home_ownership, last_pymnt_d 
ORDER BY home_ownership, last_pymnt_d;




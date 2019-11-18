# Pewlett-Hackard-Analysis.
In this analysis, I help Bobby, an HR analyst from Pewlett Hackard (PH) analyze employment data from PH with the purpose of solving the complexities of retirement at PH.

Using Postgres SQL, I was able to extract data from the 6 database given and create new tables that fit the criteria.

The first step in my analysis is mapping the relationships between tables (including primary keys and foreign keys) in the database using Quick Database Diagrams.

![EmployeeDB](https://github.com/Thinguyen23/Thi_Nguyen_Pewlett-Hackard-Analysis./blob/master/EmployeeDB.png)

My next step is creating queries to create tables and import data from csv files. 
The queries for this step is saved at https://github.com/Thinguyen23/Thi_Nguyen_Pewlett-Hackard-Analysis./blob/master/schema.sql .

Once the tables are created, my tasks now is writing a variety of queries in order to extract required data and save for later use. 
The queries for this step is saved at https://github.com/Thinguyen23/Thi_Nguyen_Pewlett-Hackard-Analysis./blob/master/queries.sql along with the result table:
Retiring employees who is born between 1952 and 1955, hired from 1985 to 1988 and last date of employment is 9999-01-01  https://github.com/Thinguyen23/Thi_Nguyen_Pewlett-Hackard-Analysis./blob/master/Data/current_emp.csv
 
 As shown in this table, 33118 PH employees are eligible for retirement.
    
The challenge I was given is to create a new list of potential mentors with their latest titles who are current employees that are retiring, and a list of newly hired employees who are in need of mentorship. These are the steps I took in order to complete the challenge:

(queries can be found at https://github.com/Thinguyen23/Thi_Nguyen_Pewlett-Hackard-Analysis./blob/master/Thi_challenge_queries.sql)

- First, use right join to create a list of current employees of each title that are presently eligible for retirement 
    - Table retirement_titles: https://github.com/Thinguyen23/Thi_Nguyen_Pewlett-Hackard-Analysis./blob/master/Data/retirement_titles.csv
    ![retirement_titles](https://github.com/Thinguyen23/Thi_Nguyen_Pewlett-Hackard-Analysis./blob/master/retirement_titles.png)
    
 - Second, use group by to find employees that have duplicate titles from the retirement_titles
    - Table duplicate_records: https://github.com/Thinguyen23/Thi_Nguyen_Pewlett-Hackard-Analysis./blob/master/Data/duplicate_records.csv
    ![duplicate_records](https://github.com/Thinguyen23/Thi_Nguyen_Pewlett-Hackard-Analysis./blob/master/duplicate_records.png)
    
  - Third, use partition to delete duplicates and keep the latest title for employees in retirement_titles. These are individuals available for mentorship role
    - Table latest_titles: https://github.com/Thinguyen23/Thi_Nguyen_Pewlett-Hackard-Analysis./blob/master/Data/latest_titles.csv
    ![latest_titles](https://github.com/Thinguyen23/Thi_Nguyen_Pewlett-Hackard-Analysis./blob/master/latest_titles.png)
    
- Fourth, use inner join to find list of current employees that are born in 1965. These individuals represent the young demographics at PH who are ready for a mentor.
  - Table mentorship: https://github.com/Thinguyen23/Thi_Nguyen_Pewlett-Hackard-Analysis./blob/master/Data/mentorship.csv
    ![mentorship](https://github.com/Thinguyen23/Thi_Nguyen_Pewlett-Hackard-Analysis./blob/master/mentorship.png)



### Recommendation for further analysis on the data set: 
These are my suggested analysis on the employment database to better understand the problem of retirement at PH:
- A list of managers that are retiring with titles and salaries as well as a list of potential current employees that can be candidates for manager positions since managers are key members of PH and are in priority of replacement
- A clean list of newly hired employees without duplicate titles using partition



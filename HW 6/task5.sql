-- 1
SELECT T1.first_name, T1.surname, T2.bill_date,
COUNT(T2.bill_no) AS number_of_bills
FROM restStaff T1
JOIN restBill T2
ON T1.staff_no = T2.waiter_no
GROUP BY T1.first_name, T1.surname, T2.bill_date
HAVING COUNT(T2.bill_no) >=2;
-- 2
SELECT room_name,
COUNT(table_no) AS number_of_tables
FROM restRest_table
WHERE no_of_seats > 6
GROUP BY room_name;
-- 3
SELECT T2.room_name,
SUM(T1.bill_total) AS total_bill
FROM restBill T1
JOIN restRest_table T2 ON T1.table_no = T2.table_no
GROUP BY T2.room_name;
-- 4
SELECT T1.first_name, T1.surname,
SUM(T2.bill_total) AS total_bill_amount
FROM restStaff T1
JOIN restRoom_management T3
ON T1.staff_no = T3.headwaiter
JOIN restBill T2
ON T3.room_name = (
    SELECT room_name
    FROM restRest_table
    WHERE table_no = T2.table_no)
GROUP BY T1.first_name, T1.surname
ORDER BY total_bill_amount DESC;

-- 5
SELECT cust_name
FROM restBill
GROUP BY cust_name
HAVING AVG(bill_total) > 400;
-- 6
SELECT T1.first_name, T1.surname, T2.bill_date,
COUNT(T2.bill_no) AS numof_bills
FROM restStaff T1
JOIN restBill T2
ON T1.staff_no = T2.waiter_no
GROUP BY T1.first_name, T1.surname, T2.bill_date
HAVING COUNT(T2.bill_no) >=3;
-- 1
CREATE VIEW samsBills
AS( SELECT T1.first_name, T1.surname, T2.bill_date, T2.cust_name, T2.bill_total
FROM restStaff T1
INNER JOIN restBill T2
ON T1.staff_no = T2.waiter_no
WHERE T1.first_name = 'Sam' AND T1.surname = 'Pitt');
-- 2
SELECT *
FROM samsBills
WHERE bill_total > 400;
-- 3
CREATE VIEW roomTotals
AS 
SELECT T1.room_name, SUM(T3.bill_total) AS total_sum
FROM restRoom_management T1
JOIN restRest_table T2 
ON T1.room_name = T2.room_name
JOIN restBill T3 
ON T2.table_no = T3.table_no
GROUP BY T1.room_name;
-- 4
CREATE VIEW teamTotals
AS SELECT CONCAT(T1.first_name,' ', T1.surname)
AS headwaiter_name,
SUM (T2.bill_total) AS total_sum
FROM restStaff T1
JOIN restRoom_management T3 ON T1.staff_no = T3.headwaiter
JOIN restRest_table T4 ON T3.room_name = T4.room_name
JOIN restBill T2 ON T4.table_no = T2.table_no
GROUP BY T1.first_name, T1.surname;


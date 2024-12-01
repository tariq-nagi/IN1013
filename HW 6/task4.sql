-- 1
SELECT DISTINCT cust_name
FROM restBill
WHERE bill_total > 450
AND table_no in (
SELECT table_no
FROM restRest_table
WHERE room_name IN (
SELECT room_name
FROM restRoom_management
WHERE headwaiter = 010
)
);
-- 2
SELECT first_name, surname
FROM restStaff
WHERE staff_no = (
SELECT headwaiter
FROM restRoom_management
WHERE room_name = (
SELECT table_no
FROM restBill
WHERE cust_name = 'Nerida Smith'
AND bill_date = 160111
)
AND room_date = 160111
);
-- 3
SELECT cust_name
FROM restBill
WHERE bill_total = (
SELECT MIN(bill_total)
FROM restBill
);
-- 4
SELECT first_name,surname
FROM restStaff
WHERE staff_no NOT IN (
SELECT DISTINCT waiter_no
FROM restBill
);
-- 5
SELECT T1.cust_name, T2.first_name, T2.surname, T3.room_name 
FROM restBill T1
JOIN restRest_table T4 ON T1.table_no = T4.table_no
JOIN restRoom_management T3 ON T4.room_name = T3.room_name 
                            AND T1.bill_date = T3.room_date
JOIN restStaff T2 ON T3.headwaiter = T2.staff_no
WHERE T1.bill_total = (
    SELECT MAX(bill_total)
    FROM restBill
);



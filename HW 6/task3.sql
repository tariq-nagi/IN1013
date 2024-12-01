-- 1
SELECT T2.first_name, T2.surname
FROM restBill T1
INNER JOIN restStaff T2 
ON T1.waiter_no = T2.staff_no
WHERE t1.cust_name = 'Tanya Singh';
-- 2
SELECT DISTINCT T1.room_date
FROM restRoom_management T1
INNER JOIN reststaff T2
ON T1.headwaiter = T2.staff_no
WHERE T2.first_name ='Charles'
AND T1.room_name = 'Green'
AND T1.room_date BETWEEN 160201 AND 160229
-- 3
SELECT T2.first_name, T2.surname
FROM restStaff T1
INNER JOIN restStaff T2
ON T1.headwaiter = T2.staff_no
WHERE T1.first_name = 'Zoe' AND T1.surname='Ball'
AND T1.staff_no != T2.staff_no;
-- 4
SELECT T1.cust_name, T1.bill_total, T2.first_name, T2.surname
FROM restBill T1
INNER JOIN restStaff T2
ON T1.waiter_no = T2.staff_no
ORDER BY T1.bill_total DESC;
-- 5
SELECT DISTINCT T2.first_name, T2.surname
FROM restBill T1
INNER JOIN restStaff T2 
ON T1.waiter_no = T2.staff_no
WHERE T1.waiter_no IN(
SELECT waiter_no
FROM restBill
WHERE bill_no IN (14,17)
);
-- 6
SELECT DISTINCT T2.first_name, T2.surname
FROM restRoom_management T1
JOIN restStaff T2
ON T1.headwaiter = T1.room_date= 160312
UNION
SELECT DISTINCT T2.first_name, T2.surname
FROM restStaff T2
WHERE T2.headwaiter = (
SELECT headwaiter
FROM restroom_management
WHERE room_name = 'blue' and room_date = 160312
);




/* Question 1 */
SELECT g.first_name, g.last_name, ro.room_number, 
rs.start_date, rs.end_date 
FROM reservations rs 
INNER JOIN guests g USING (guest_number) 
INNER JOIN room_occupancy ro USING (reservation_number) 
WHERE MONTH(end_date) = 7 AND YEAR(end_date) = 2023;
/* Question 2 */
SELECT g.first_name, g.last_name, ro.room_number, rs.start_date, rs.end_date 
FROM rooms rm 
INNER JOIN amenity_packages a USING (amenity_package_number) 
INNER JOIN room_occupancy ro USING (room_number) 
INNER JOIN reservations rs USING (reservation_number)
INNER JOIN guests g USING (guest_number) 
WHERE a.jacuzzi_available = 1;
/* Question 3 */
SELECT g.first_name, g.last_name, ro.room_number, rs.start_date, 
(ro.number_of_adults + ro.number_of_children) AS number_of_guest 
FROM guests g
INNER JOIN reservations rs USING (guest_number)
INNER JOIN room_occupancy ro USING (reservation_number)
WHERE g.first_name = 'MACK' AND g.last_name = 'Simmer';
/* Question 4 */
SELECT rm.room_number, ro.reservation_number, ro.total_room_cost 
FROM rooms rm 
LEFT JOIN room_occupancy ro USING (room_number);
/* Question 5 */
SELECT ro.room_number FROM room_occupancy ro 
INNER JOIN reservations rs USING (reservation_number)
WHERE (ro.number_of_adults + ro.number_of_children) >= 3 
AND (
	(MONTH (rs.start_date) <= 4 AND YEAR(rs.start_date) <= 2023) AND
	(MONTH (rs.end_date) >= 4 AND YEAR(rs.end_date) >= 2023)
);
/* Question 6 */
SELECT g.first_name, g.last_name, COUNT(rs.guest_number) AS number_of_reservations 
FROM guests g
LEFT JOIN reservations rs USING (guest_number)
GROUP BY (g.guest_number)
ORDER BY COUNT(rs.guest_number) DESC, g.last_name;
/* Question 7 */
SELECT first_name, last_name address, phone 
FROM guests 
WHERE phone = '8347271001';
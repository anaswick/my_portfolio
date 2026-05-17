CREATE TABLE users (
   user_id INT PRIMARY KEY,
   user_name VARCHAR(100),
   country VARCHAR(50),
   device_type VARCHAR(20)
);

CREATE TABLE hotel_searches (
   search_id INT PRIMARY KEY,
   user_id INT,
   search_time TIMESTAMP,
   city VARCHAR(100),
   check_in_date DATE,
   check_out_date DATE,
   FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE bookings (
   booking_id INT PRIMARY KEY,
   user_id INT,
   booking_time TIMESTAMP,
   city VARCHAR(100),
   total_amount NUMERIC(10,2),
   FOREIGN KEY (user_id) REFERENCES users(user_id)
);


INSERT INTO users (user_id, user_name, country, device_type)
VALUES
(1, 'Andi', 'Indonesia', 'Android'),
(2, 'Budi', 'Indonesia', 'iOS'),
(3, 'Citra', 'Malaysia', 'Web'),
(4, 'Dina', 'Singapore', 'Android'),
(5, 'Evan', 'Indonesia', 'iOS');

INSERT INTO hotel_searches (
   search_id,
   user_id,
   search_time,
   city,
   check_in_date,
   check_out_date
)
VALUES
(101, 1, '2026-05-01 08:00:00', 'Bali', '2026-06-01', '2026-06-03'),
(102, 2, '2026-05-01 09:00:00', 'Jakarta', '2026-06-10', '2026-06-12'),
(103, 3, '2026-05-01 10:00:00', 'Bangkok', '2026-06-15', '2026-06-18'),
(104, 1, '2026-05-02 11:00:00', 'Bandung', '2026-06-20', '2026-06-21'),
(105, 4, '2026-05-02 13:00:00', 'Tokyo', '2026-07-01', '2026-07-05'),
(106, 5, '2026-05-03 14:00:00', 'Bali', '2026-06-08', '2026-06-10');

INSERT INTO bookings (
   booking_id,
   user_id,
   booking_time,
   city,
   total_amount
)
VALUES
(201, 1, '2026-05-01 08:30:00', 'Bali', 2500000),
(202, 3, '2026-05-01 11:00:00', 'Bangkok', 4200000),
(203, 5, '2026-05-03 15:00:00', 'Bali', 3100000);



SELECT
   u.user_id,
   u.user_name,
   u.device_type,
   hs.city AS searched_city
FROM users u
INNER JOIN hotel_searches hs
   ON u.user_id = hs.user_id
LEFT JOIN bookings b
   ON u.user_id = b.user_id
WHERE b.booking_id IS NULL;

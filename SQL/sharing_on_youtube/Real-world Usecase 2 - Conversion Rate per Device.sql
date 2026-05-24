CREATE TABLE users (
   user_id INT PRIMARY KEY,
   user_name VARCHAR(100),
   device_type VARCHAR(20)
);

CREATE TABLE hotel_searches (
   search_id INT PRIMARY KEY,
   user_id INT,
   search_time TIMESTAMP,
   city VARCHAR(100),
   FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE bookings (
   booking_id INT PRIMARY KEY,
   user_id INT,
   booking_time TIMESTAMP,
   total_amount NUMERIC(10,2),
   FOREIGN KEY (user_id) REFERENCES users(user_id)
);


INSERT INTO users (user_id, user_name, device_type)
VALUES
(1, 'Andi', 'Android'),
(2, 'Budi', 'iOS'),
(3, 'Citra', 'Web'),
(4, 'Dina', 'Android'),
(5, 'Evan', 'iOS'),
(6, 'Farah', 'Android'),
(7, 'Gilang', 'Web');

INSERT INTO hotel_searches (
   search_id,
   user_id,
   search_time,
   city
)
VALUES
(101, 1, '2026-05-01 08:00:00', 'Bali'),
(102, 2, '2026-05-01 09:00:00', 'Jakarta'),
(103, 3, '2026-05-01 10:00:00', 'Bangkok'),
(104, 4, '2026-05-01 11:00:00', 'Tokyo'),
(105, 5, '2026-05-01 12:00:00', 'Bali'),
(106, 6, '2026-05-01 13:00:00', 'Singapore'),
(107, 7, '2026-05-01 14:00:00', 'Seoul');

INSERT INTO bookings (
   booking_id,
   user_id,
   booking_time,
   total_amount
)
VALUES
(201, 1, '2026-05-01 08:30:00', 2500000),
(202, 3, '2026-05-01 10:30:00', 4200000),
(203, 5, '2026-05-01 12:30:00', 3100000),
(204, 6, '2026-05-01 13:45:00', 2800000);

select * from users;
select * from hotel_searches;
select * from bookings;

-- kunci jawaban

SELECT
   u.device_type,
   COUNT(DISTINCT hs.user_id) AS total_search_users,
   COUNT(DISTINCT b.user_id) AS total_booking_users,
   ROUND(
       COUNT(DISTINCT b.user_id)::NUMERIC
       / COUNT(DISTINCT hs.user_id),
       2
   ) AS conversion_rate
FROM users u
INNER JOIN hotel_searches hs
   ON u.user_id = hs.user_id
LEFT JOIN bookings b
   ON u.user_id = b.user_id
GROUP BY u.device_type
ORDER BY conversion_rate DESC;


drop table users, hotel_searches, bookings;
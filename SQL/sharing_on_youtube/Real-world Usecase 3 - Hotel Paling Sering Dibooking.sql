-- 1. Query Table Creation
CREATE TABLE hotels (
   hotel_id INT PRIMARY KEY,
   hotel_name VARCHAR(100),
   city VARCHAR(100),
   star_rating INT
);

CREATE TABLE users (
   user_id INT PRIMARY KEY,
   user_name VARCHAR(100),
   country VARCHAR(50)
);

CREATE TABLE bookings (
   booking_id INT PRIMARY KEY,
   user_id INT,
   hotel_id INT,
   booking_time TIMESTAMP,
   check_in_date DATE,
   check_out_date DATE,
   total_amount NUMERIC(10,2),
   FOREIGN KEY (user_id) REFERENCES users(user_id),
   FOREIGN KEY (hotel_id) REFERENCES hotels(hotel_id)
);

-- 2. Query Data Insertion
INSERT INTO hotels (
   hotel_id,
   hotel_name,
   city,
   star_rating
)
VALUES
(1, 'Sunrise Bali Resort', 'Bali', 5),
(2, 'Jakarta City Hotel', 'Jakarta', 4),
(3, 'Bangkok Grand Palace', 'Bangkok', 5),
(4, 'Tokyo Sakura Inn', 'Tokyo', 4);

INSERT INTO users (
   user_id,
   user_name,
   country
)
VALUES
(101, 'Andi', 'Indonesia'),
(102, 'Budi', 'Indonesia'),
(103, 'Citra', 'Malaysia'),
(104, 'Dina', 'Singapore'),
(105, 'Evan', 'Indonesia');

INSERT INTO bookings (
   booking_id,
   user_id,
   hotel_id,
   booking_time,
   check_in_date,
   check_out_date,
   total_amount
)
VALUES
(1001, 101, 1, '2026-05-01 08:00:00', '2026-06-01', '2026-06-03', 2500000),
(1002, 102, 1, '2026-05-02 09:30:00', '2026-06-10', '2026-06-12', 2700000),
(1003, 103, 2, '2026-05-03 10:15:00', '2026-06-15', '2026-06-17', 1800000),
(1004, 104, 1, '2026-05-04 11:45:00', '2026-07-01', '2026-07-05', 3200000),
(1005, 105, 3, '2026-05-05 13:00:00', '2026-07-10', '2026-07-14', 4100000),
(1006, 101, 2, '2026-05-06 14:30:00', '2026-08-01', '2026-08-03', 2000000),
(1007, 102, 1, '2026-05-07 15:20:00', '2026-08-15', '2026-08-18', 3500000);


select * from hotels;

select * from bookings;
-- kunci jawaban

SELECT
   h.hotel_name,
   h.city,
   COUNT(b.booking_id) AS total_bookings
FROM hotels h
INNER JOIN bookings b
   ON h.hotel_id = b.hotel_id
GROUP BY
   h.hotel_name,
   h.city
ORDER BY total_bookings desc;


-- drop tables jika sudah selesai

drop table users,hotels, bookings;
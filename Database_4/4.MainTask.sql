-- 반려동물 주인 테이블
CREATE TABLE Customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,  -- 고객 고유 ID
    name VARCHAR(45),                             -- 고객 이름
    phone VARCHAR(20),                            -- 연락처
    email VARCHAR(45)                             -- 이메일
);

-- 반려동물 테이블
CREATE TABLE Pet (
    pet_id INT AUTO_INCREMENT PRIMARY KEY,        -- 반려동물 고유 ID
    name VARCHAR(50),                             -- 이름
    species VARCHAR(30),                          -- 종
    breed VARCHAR(30),                            -- 품종
    customer_id INT,                              -- 주인 ID
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

-- 객실 테이블
CREATE TABLE Room (
    room_id INT AUTO_INCREMENT PRIMARY KEY,       -- 객실 고유 ID
    room_number VARCHAR(10),                      -- 객실 번호
    type VARCHAR(20),                             -- 객실 타입
    price DECIMAL(10,2)                           -- 1박당 가격
);

-- 예약 테이블
CREATE TABLE Reservation (
    reservation_id INT AUTO_INCREMENT PRIMARY KEY, -- 예약 고유 ID
    customer_id INT,                               -- 고객 ID
    pet_id INT,                                    -- 반려동물 ID
    room_id INT,                                   -- 객실 ID
    reservation_date DATE,                          -- 예약 날짜
    total_price DECIMAL(10,2),                     -- 총 금액
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (pet_id) REFERENCES Pet(pet_id),
    FOREIGN KEY (room_id) REFERENCES Room(room_id)
);

-- 서비스 테이블
CREATE TABLE Service (
    service_id INT AUTO_INCREMENT PRIMARY KEY,    -- 서비스 고유 ID
    reservation_id INT,                            -- 예약 ID
    name VARCHAR(45),                              -- 서비스 이름
    price DECIMAL(10,2),                           -- 서비스 가격
    FOREIGN KEY (reservation_id) REFERENCES Reservation(reservation_id)
);

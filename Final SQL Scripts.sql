-- 1. Create Users Table
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL
);

-- 2. Create Doctors Table
CREATE TABLE Doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    specialization VARCHAR(50) NOT NULL,
    available_time_slots VARCHAR(255) NOT NULL
);

-- 3. Create Appointments Table
CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    doctor_id INT,
    problem_description TEXT,
    appointment_date_time DATETIME,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

-- 4. Create Patient History Table
CREATE TABLE Patient_History (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    doctor_id INT,
    consultation_date DATETIME,
    notes TEXT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

--1. Insert Data into Doctors Table
INSERT INTO Doctors (name, specialization, available_time_slots) 
VALUES 
('Dr. Alice Johnson', 'General Physician', '2024-10-10 10:00 AM, 2024-10-10 11:00 AM, 2024-10-10 2:00 PM, 2024-10-11 4:00 PM'),
('Dr. Mark Smith', 'General Physician', '2024-10-12 9:00 AM, 2024-10-12 12:00 PM, 2024-10-12 3:00 PM, 2024-10-12 5:00 PM'),
('Dr. Sarah Williams', 'Cardiologist', '2024-10-13 9:00 AM, 2024-10-13 11:00 AM, 2024-10-13 1:00 PM, 2024-10-13 3:00 PM'),
('Dr. David Brown', 'Cardiologist', '2024-10-14 10:30 AM, 2024-10-14 12:30 PM, 2024-10-14 2:30 PM, 2024-10-14 4:30 PM'),
('Dr. Emily Davis', 'Neurologist', '2024-10-15 8:30 AM, 2024-10-15 10:30 AM, 2024-10-15 1:30 PM, 2024-10-15 3:30 PM'),
('Dr. James Wilson', 'Neurologist', '2024-10-16 9:00 AM, 2024-10-16 11:00 AM, 2024-10-16 2:00 PM, 2024-10-16 4:00 PM');


ALTER TABLE Users
ADD COLUMN user_type ENUM('User', 'Admin') DEFAULT 'User';

-- 2. Insert Admin Data into Users Table
INSERT INTO Users (full_name, email, password, phone, user_type)
VALUES 
    ('Admin User', 'admin@cmuhealthcare.com', 'Admin@1234', '1234567890', 'Admin');
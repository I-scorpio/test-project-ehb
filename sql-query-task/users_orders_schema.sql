-- Create Users table with UserID as primary key
-- **UserID**: Auto-incremented for each user
-- **Name**: `VARCHAR(100)` field to store the user's name, marked as `NOT NULL`
-- **SignupDate**: `DATE` field to store signup date, also marked as `NOT NULL`
CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    SignupDate DATE NOT NULL
);

-- Create Orders table with OrderID as primary key
-- **OrderID**: Auto-incremented for each order.
-- **UserID**: A foreign key to ensure that each order is linked to a valid user.
-- **OrderDate**: `DATE` field to store the order date, marked as `NOT NULL`.
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT NOT NULL,
    OrderDate DATE NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Insert data into Users table
INSERT INTO Users (Name, SignupDate) VALUES
('Ivy', '2023-01-01'),
('Ray', '2023-03-15'),
('Andrew', '2023-05-10'),
('Carol', '2023-07-05'),
('Dave', '2023-08-12');

-- Insert data into Orders table
INSERT INTO Orders (UserID, OrderDate) VALUES
(1, '2024-04-10'),  -- Ivy's order in April
(1, '2024-06-20'),  -- Ivy's additional order in June
(1, '2024-08-15'),  -- Ivy's additional order in August
(1, '2024-05-01'),  -- Ivy's additional order in May
(1, '2024-05-15'),  -- Ivy's additional order in May
(1, '2024-06-01'),  -- Ivy's additional order in June
(1, '2024-07-01'),  -- Ivy's additional order in July

(2, '2024-07-18'),  -- Ray's order in July
(2, '2024-09-10'),  -- Ray's additional order in September
(2, '2024-10-01'),  -- Ray's additional order in October
(2, '2024-05-05'),  -- Ray's additional order in May
(2, '2024-06-15'),  -- Ray's additional order in June
(2, '2024-07-10'),  -- Ray's additional order in July
(2, '2024-08-01'),  -- Ray's additional order in August
(2, '2024-08-15'),  -- Ray's additional order in August

(3, '2024-09-25'),  -- Andrew's order in September
(3, '2024-10-05'),  -- Andrew's additional order in October

(4, '2024-05-10'),  -- Carol's order in May
(4, '2024-06-15'),  -- Carol's additional order in June
(4, '2024-07-05'),  -- Carol's order in July
(4, '2024-08-20'),  -- Carol's additional order in August
(4, '2024-09-15'),  -- Carol's order in September
(4, '2024-10-10'),  -- Carol's additional order in October

(5, '2024-08-15'),  -- Dave's order in August
(5, '2024-09-20'),  -- Dave's additional order in September
(5, '2024-10-15');  -- Dave's additional order in October
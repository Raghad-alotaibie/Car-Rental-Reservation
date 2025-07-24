-- ===============================================
-- Car Rental Reservation System - Oracle SQL
-- Description: This file includes table creation, sample data, and queries
-- ===============================================

-- =====================
--  1. Create Tables
-- =====================

-- Clients Table
CREATE TABLE Clients (
    client_id NUMBER PRIMARY KEY,
    full_name VARCHAR2(100),
    id_number VARCHAR2(20) UNIQUE,
    email VARCHAR2(100)
);

-- Items / Date_Prices Table
CREATE TABLE Date_Prices (
    item_number NUMBER PRIMARY KEY,
    item_name VARCHAR2(100),
    daily_price NUMBER(10, 2)
);

-- Reservations Table
CREATE TABLE Reservations (
    reservation_id NUMBER PRIMARY KEY,
    client_id NUMBER,
    item_number NUMBER,
    reservation_days NUMBER,
    FOREIGN KEY (client_id) REFERENCES Clients(client_id),
    FOREIGN KEY (item_number) REFERENCES Date_Prices(item_number)
);

-- ======================
--  2. Insert Sample Data
-- ======================

-- Clients
INSERT INTO Clients VALUES (1, 'Sara Khalid', '1234567890', 'sara@example.com');
INSERT INTO Clients VALUES (2, 'Faisal Alharbi', '9876543210', 'faisal@example.com');
INSERT INTO Clients VALUES (3, 'Ahlam Ahmad', '1122334455', 'ahlam@example.com');

-- Items (Date_Prices)
INSERT INTO Date_Prices VALUES (101, 'Toyota Corolla 2020', 150.00);
INSERT INTO Date_Prices VALUES (102, 'Hyundai Sonata 2022', 200.00);
INSERT INTO Date_Prices VALUES (103, 'Chevrolet Tahoe 2021', 350.00);

-- Reservations
INSERT INTO Reservations VALUES (1, 1, 101, 3);
INSERT INTO Reservations VALUES (2, 2, 102, 2);
INSERT INTO Reservations VALUES (3, 3, 103, 4);

-- ==========================
--  3. Useful SELECT Queries
-- ==========================

-- A. Show all clients
SELECT * FROM Clients;

-- B. Show all rental items and prices
SELECT * FROM Date_Prices;

-- C. Show all reservations with client and item details
SELECT 
    r.reservation_id,
    c.full_name AS client_name,
    i.item_name,
    r.reservation_days,
    (i.daily_price * r.reservation_days) AS total_price
FROM Reservations r
JOIN Clients c ON r.client_id = c.client_id
JOIN Date_Prices i ON r.item_number = i.item_number;

-- D. Show most expensive item
SELECT item_name, daily_price
FROM Date_Prices
ORDER BY daily_price DESC
FETCH FIRST 1 ROWS ONLY;

-- E. Show total revenue from all reservations
SELECT 
    SUM(r.reservation_days * i.daily_price) AS total_revenue
FROM Reservations r
JOIN Date_Prices i ON r.item_number = i.item_number;

-- F. Show reservations longer than 3 days
SELECT * 
FROM Reservations
WHERE reservation_days > 3;

-- G. Show all clients who rented the 'Chevrolet Tahoe 2021'
SELECT DISTINCT c.full_name
FROM Clients c
JOIN Reservations r ON c.client_id = r.client_id
JOIN Date_Prices i ON r.item_number = i.item_number
WHERE i.item_name = 'Chevrolet Tahoe 2021';
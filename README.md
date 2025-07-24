# Car Rental Reservation System 

this is my SQL database project for a car rental reservation system.

This system was built using **Oracle SQL** and **Oracle APEX**, and it allows users to manage clients, items, and reservations efficiently through structured database design.

---

## Project Contents

- `car_rental-reservation.sql`: All SQL commands (create tables, insert data, queries)
- `README.md`: This file

---

## Database Structure

### Clients Table
- `client_id`
- `full_name`
- `id_number`
- `email`

### Date_Prices Table
- `item_number`
- `item_name`
- `daily_price`

### Reservations Table
- `reservation_id`
- `client_id`
- `item_number`
- `reservation_days`

---

## Sample Features (via SQL queries)

- View all clients
- Show all items and prices
- Join reservations with client/item data
- Calculate total rental cost per reservation
- Show most expensive item
- Total income from all reservations

---

## Tools Used

- Oracle SQL
- Oracle APEX App Builder
- SQL Workshop

---

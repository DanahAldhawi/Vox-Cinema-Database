# Vox Cinema Database
## Project Overview
The Vox Cinema Database System is designed to manage movies, theaters, employees, and customer reservations. Each cinema is uniquely identified and linked to multiple screens, movies, and employees, with the ability to assign managers. Customers can reserve tickets, and the system tracks movie details, theaters, seating, and employee information.

## Features
- Cinema Management: Store cinema details and assign managers.
- Movie Management: Track titles, genres, and release dates.
- Theater & Screens: Assign movies to theaters with seat tracking.
- Customer Reservations: Manage bookings and retrieve details.
- Employee Records: Manage staff salaries, roles, and hierarchy.
  
## Database Design
- Entity Relationship Diagram (ERD)
- Relational Schema
- Normalization & Constraints
  
## Project Structure
- cinema → Cinema details (ID, Name)
- movie → Movie details (title, release_year, release_month)
- movie_genres → Links movies with genres
- screens → Maps movies to cinemas
- theater → Screens and seats
- show → Shows assigned to screens
- customer → Customer details
- employee → Employee details & manager hierarchy
- reserve → Reservations (customer + movie)

## SQL Features Demonstrated
- DDL: Create, drop, and alter tables with constraints.
- DML: Insert, update, delete, and select queries.
- Joins & Grouping: Retrieve combined employee, cinema, and customer details.
- Aggregation: MIN, MAX, HAVING, and GROUP BY queries.
- Constraints: Primary Keys, Foreign Keys, and composite constraints.

## This project is developed as part of Database Systems Course, By:
- Danah Aldhawi
- Haifa Alghafis
- Raghad Alduaij
- Amani Alhusseini
- Raghad Bin Huzaim

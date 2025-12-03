# Logistics Operations SQL Project

This project is a structured SQL portfolio built around a Logistics Operations database.  
It showcases real-world SQL skills across multiple categories, including joins, subqueries, unions, date functions, case expressions, and analytical problem solving.

The project mirrors the structure of advanced SQL learning repositories, but all examples and problems are built entirely on **my own Logistics database schema**.

---

## Project Structure
assets/
logistics_sql/
dates/
cases/
joins/
subqueries/
unions/
problems/
README.md


Each folder represents a specific SQL skill category and contains curated queries written for the Logistics schema.

---

## Entity Relationship Diagram (ERD)

Below is the ERD used throughout the project:

![Logistics ERD](assets/assetsERD.png)

---

## Folder Overview

### **`dates/`**
Contains queries involving date extraction, delivery duration calculations, maintenance intervals, and temporal grouping.

### **`cases/`**
Case-based logic such as shipment weight classification, route categorization, maintenance levels, and customer value tiers.

### **`joins/`**
Join operations across core tables to combine shipments, customers, vehicles, routes, drivers, and logs.

### **`subqueries/`**
Analytical SQL using nested queries:  
- Vehicles with above-average maintenance cost  
- Customers with above-average shipment revenue  
- Drivers outperforming average workload  
- Routes with higher-than-average shipment weight  

### **`unions/`**
Union and union-all examples combining routes, drivers, vehicles, logs, and operational activity into unified datasets.

### **`problems/`**
A set of 8 challenge-style SQL problems designed to reflect real analysis tasks in logistics organizations, including:

1. Top revenue-generating customers  
2. Vehicle with highest maintenance cost  
3. Most frequently assigned driver  
4. Most active route  
5. Worst fuel efficiency vehicle  
6. Late delivery detection  

---

## About the Logistics Database

The project is built on a custom logistics schema containing tables:

- **Customers**  
- **Routes**  
- **Vehicles**  
- **Drivers**  
- **Shipments**  
- **Assignments**  
- **Fuel_Log**  
- **Maintenance_Log**

Together, these tables represent operations in a transportation and logistics company:
tracking deliveries, drivers, vehicles, costs, and operational performance.

---

## Skills Demonstrated

This portfolio demonstrates:

- Joins (INNER, LEFT, CROSS)  
- Subqueries & nested aggregation  
- Date and time calculations  
- CASE expressions  
- UNION and UNION ALL  
- Aggregation and performance metrics  
- CTEs for clean analytical workflows  
- Real-world problem solving  

---

## How to Use This Project

1. Clone the repository  
2. Load the SQL schema into PostgreSQL  
3. Insert sample data (optional)  
4. Explore the `logistics_sql` folders  
5. Run queries and modify as needed  

---

## Purpose of This Project

This repository is designed to serve as:

- A **SQL portfolio** showcasing analytical skills  
- A **learning resource** for structured SQL practice  
- A **demonstration project** for data roles in logistics, analytics, BI, or operations  

---

## Contact

If you'd like to connect or collaborate, feel free to reach out!


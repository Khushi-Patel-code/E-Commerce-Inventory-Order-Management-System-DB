# 🛍️ E-Commerce Inventory & Order Management System  

## 📘 Overview  
This project implements a **Relational Database Schema** for a complete **E-Commerce Inventory & Order Management System**.  
It is designed to efficiently manage **users, customers, suppliers, products, orders, inventory, payments**, and more, following **database normalization** and **referential integrity** principles.

The database supports key e-commerce operations including:
- Product and supplier management  
- Inventory tracking across multiple warehouses  
- Order and payment processing  
- Review system for customer feedback  
- Automated inventory adjustments via triggers  

## 📂 Repo Structure

```
📦 E-Commerce-Inventory-Order-Management-System
│
├── 📁 SQL
│ └── 
│
├── 📁 CSV
│ ├── customers.csv # Sample customer data
│ ├── suppliers.csv # Sample supplier data
│ ├── products.csv # Product catalog data
│ ├── orders.csv # Example order dataset
│ └── payments.csv # Example payment records
│
├── 📁 Diagrams
│ ├── ER_Schema_Initial.png # Initial ER diagram (without reviews table)
│ ├── ER_Schema_Updated.png # Updated ER diagram (with reviews table added)
│ └── Schema_Relationships.pdf # Annotated schema relationship chart
│
└── README.md
```

## 🧱 Database Design Summary  

#### **Core Entities**
- **Users & Roles:** For managing admins, staff, and customers.  
- **Customers & Suppliers:** For maintaining business relationships and logistics.  
- **Products & Categories:** For product classification and catalog organization.  
- **Warehouses & Inventory:** For stock tracking and movement across locations.  
- **Orders & Payments:** For managing order processing and financial transactions.  
- **Reviews:** Allows users to rate and comment on purchased products.


### ⚙️ Key Features  

- ✅ **Normalized relational schema (3NF)** to avoid redundancy  
- ✅ **Foreign key constraints** for maintaining data integrity  
- ✅ **Triggers** for automatic inventory updates upon order changes  
- ✅ **ENUM constraints** for predefined order and payment states  
- ✅ **Indexing** to improve query performance  
- ✅ **Many-to-many** product-supplier relationship table  
- ✅ **Timestamps & audit trails** for all key activities

### Diagrams
<img width="1333" height="1697" alt="image" src="https://github.com/user-attachments/assets/cc9cd3fe-16b7-43f4-bd12-eab820ab30b7" />
EER Diagram

------------------------------------------------------------------------------------------------------------------------------------------

<img width="1574" height="1676" alt="image" src="https://github.com/user-attachments/assets/c9b7b2b7-3dd1-4e50-8ce4-f090b3e8bc80" />
ER Conceptual Diagram

------------------------------------------------------------------------------------------------------------------------------------------

<img width="1164" height="1646" alt="image" src="https://github.com/user-attachments/assets/6695d59c-5f10-4367-b9f2-0e3bd49b6e81" />
Schema Diagram





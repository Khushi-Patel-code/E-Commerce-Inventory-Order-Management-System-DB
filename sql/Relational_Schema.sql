-- Phase II Part A: Relational Schema for E-Commerce Inventory & Order Management System
-- Run as a single script in MySQL (MySQL 8+ recommended)

-- 1) Drop database if exists (safe for re-run)
DROP DATABASE IF EXISTS ecommerce_db;
CREATE DATABASE ecommerce_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE ecommerce_db;

-- 2) Helper lookup tables
-- Roles for users (admin, staff, customer)
CREATE TABLE IF NOT EXISTS roles (
  role_id INT AUTO_INCREMENT PRIMARY KEY,
  role_name VARCHAR(20) NOT NULL UNIQUE
) ENGINE=InnoDB; -- modern storage engine used by table

INSERT INTO roles (role_name) VALUES ('admin'), ('staff'), ('customer');

-- 3) Users table (for system users: admin/staff)
CREATE TABLE IF NOT EXISTS users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL UNIQUE,
  email VARCHAR(150) NOT NULL UNIQUE,
  password_hash VARCHAR(255) NOT NULL,
  role_id INT NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,  -- date and time when the account was created and default is current
  last_login DATETIME NULL,  -- Null means no login yet
  is_active TINYINT(1) DEFAULT 1,  -- status flag for the user acc
  CONSTRAINT fk_users_role FOREIGN KEY (role_id) REFERENCES roles(role_id)
    ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

-- 4) Customers table
CREATE TABLE IF NOT EXISTS customers (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(80) NOT NULL,
  last_name VARCHAR(80) NOT NULL,
  email VARCHAR(150) NOT NULL UNIQUE,
  phone VARCHAR(30),
  billing_address VARCHAR(255),
  shipping_address VARCHAR(255),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  is_active TINYINT(1) DEFAULT 1
) ENGINE=InnoDB;

-- 5) Suppliers
CREATE TABLE IF NOT EXISTS suppliers (
  supplier_id INT AUTO_INCREMENT PRIMARY KEY,
  supplier_name VARCHAR(150) NOT NULL,
  contact_name VARCHAR(120),
  email VARCHAR(150),
  phone VARCHAR(30),
  address VARCHAR(255),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- 6) Categories (eg: Electronics, Clothes, Accessories)
CREATE TABLE IF NOT EXISTS categories (
  category_id INT AUTO_INCREMENT PRIMARY KEY,
  category_name VARCHAR(100) NOT NULL UNIQUE,
  description TEXT NULL
) ENGINE=InnoDB;

-- 7) Products
CREATE TABLE IF NOT EXISTS products (
  product_id INT AUTO_INCREMENT PRIMARY KEY,
  sku VARCHAR(50) NOT NULL UNIQUE,  -- stock keeping unit a unique code for each product
  product_name VARCHAR(200) NOT NULL,
  description TEXT,
  category_id INT,
  price DECIMAL(10,2) NOT NULL CHECK (price >= 0),  -- cant be negative
  retail_price DECIMAL(10,2) NULL CHECK (retail_price >= 0), -- cant be negative
  active TINYINT(1) DEFAULT 1,  -- product active or discontinued
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,  -- timestamp when product was added
  CONSTRAINT fk_products_category FOREIGN KEY (category_id) REFERENCES categories(category_id)
    ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB;

-- 8) Warehouses (for multi-warehouse inventory)
CREATE TABLE IF NOT EXISTS warehouses (
  warehouse_id INT AUTO_INCREMENT PRIMARY KEY,
  warehouse_name VARCHAR(120) NOT NULL,
  location VARCHAR(255),
  contact_phone VARCHAR(30),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP  -- when the warehouse was added to the system
) ENGINE=InnoDB;

-- 9) Inventory (quantity per product per warehouse)
CREATE TABLE IF NOT EXISTS inventory (
  inventory_id INT AUTO_INCREMENT PRIMARY KEY,
  product_id INT NOT NULL,
  warehouse_id INT NOT NULL,
  quantity INT NOT NULL DEFAULT 0 CHECK (quantity >= 0), -- no. of units in warehouse, cant be negative
  last_updated DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,  -- tracks when inventory is added/changed
  UNIQUE KEY uq_product_warehouse (product_id, warehouse_id),  -- ensures each product-warehouse pair is unique
  CONSTRAINT fk_inventory_product FOREIGN KEY (product_id) REFERENCES products(product_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_inventory_warehouse FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

-- 10) Orders (placed by customers)
CREATE TABLE IF NOT EXISTS orders (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  order_number VARCHAR(50) NOT NULL UNIQUE,
  customer_id INT NOT NULL,
  order_status ENUM('pending','processed','shipped','delivered','cancelled') NOT NULL DEFAULT 'pending',
  order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  shipping_address VARCHAR(255),
  billing_address VARCHAR(255) DEFAULT NULL, -- will default to customer's billing address
  subtotal DECIMAL(12,2) NOT NULL DEFAULT 0,
  tax DECIMAL(12,2) NOT NULL DEFAULT 0,
  shipping_fee DECIMAL(12,2) NOT NULL DEFAULT 0,
  total DECIMAL(12,2) NOT NULL DEFAULT 0,
  last_updated DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  created_by INT NULL, -- user_id of the staff/admin  who created/processed the order
  CONSTRAINT fk_orders_customer FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_orders_user FOREIGN KEY (created_by) REFERENCES users(user_id)
    ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB;

-- 11) Order items (line items - each product line in an order)
CREATE TABLE IF NOT EXISTS order_items (
  order_item_id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT NOT NULL,
  product_id INT NOT NULL,
  warehouse_id INT NULL, -- from which warehouse the item is shipped
  quantity INT NOT NULL CHECK (quantity > 0),
  unit_price DECIMAL(10,2) NOT NULL CHECK (unit_price >= 0), 
  line_total DECIMAL(12,2) NOT NULL,  -- Total cost for this line/order = quantity * unit_price
  CONSTRAINT fk_orderitems_order FOREIGN KEY (order_id) REFERENCES orders(order_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_orderitems_product FOREIGN KEY (product_id) REFERENCES products(product_id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_orderitems_warehouse FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id)
    ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB;

-- 12) Payments (for orders - transactions)
CREATE TABLE IF NOT EXISTS payments (
  payment_id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT NOT NULL,
  payment_method ENUM('card','paypal','cod','bank_transfer','apple_pay','google_pay','gift_card','crypto','other') NOT NULL,
  payment_status ENUM('pending','processing','completed','failed','refunded','cancelled','chargeback') NOT NULL DEFAULT 'pending',
  amount DECIMAL(12,2) NOT NULL CHECK (amount >= 0),
  paid_at DATETIME NULL,
  transaction_ref VARCHAR(255),  -- transaction reference from bank
  CONSTRAINT fk_payments_order FOREIGN KEY (order_id) REFERENCES orders(order_id)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

-- 13) Product_Supplier (many-to-many)
CREATE TABLE IF NOT EXISTS product_suppliers (
  product_id INT NOT NULL,
  supplier_id INT NOT NULL,
  supplier_sku VARCHAR(100),
  lead_time_days INT DEFAULT 0 CHECK (lead_time_days >= 0),  -- number of days supplier takes to deliver products
  min_order_qty INT DEFAULT 0 CHECK (min_order_qty >= 0), -- min quantity u must order from the supplier
  PRIMARY KEY (product_id, supplier_id),  -- unique combination of product-supplier
  CONSTRAINT fk_ps_product FOREIGN KEY (product_id) REFERENCES products(product_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_ps_supplier FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

-- 14) Stock movements / adjustments (audit trail)
CREATE TABLE IF NOT EXISTS stock_movements (
  stock_movement_id INT AUTO_INCREMENT PRIMARY KEY,
  product_id INT NOT NULL,
  warehouse_id INT NOT NULL,
  movement_type ENUM('purchase','sale','adjustment','return') NOT NULL,
  reference_id VARCHAR(100), -- e.g., order number, purchase invoice
  quantity_change INT NOT NULL, -- positive = increase, negative = decrease
  note VARCHAR(255), -- explanation for the movement
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  created_by INT NULL,  -- Staff/admin who made the stock movement
  CONSTRAINT fk_stockmov_product FOREIGN KEY (product_id) REFERENCES products(product_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_stockmov_warehouse FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_stockmov_user FOREIGN KEY (created_by) REFERENCES users(user_id)
    ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB;

-- 15) User Reviews
CREATE TABLE IF NOT EXISTS reviews (
  review_id INT AUTO_INCREMENT PRIMARY KEY,
  product_id INT NOT NULL,
  user_id INT NOT NULL,
  rating INT CHECK (rating BETWEEN 1 AND 5),
  comment TEXT,
  review_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_review_product FOREIGN KEY (product_id) REFERENCES products(product_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_review_user FOREIGN KEY (user_id) REFERENCES users(user_id)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

-- 16) Indexes to speed frequent queries
CREATE INDEX idx_products_name ON products(product_name);
CREATE INDEX idx_orders_customer ON orders(customer_id);
CREATE INDEX idx_inventory_product ON inventory(product_id);
CREATE INDEX idx_orderitems_order ON order_items(order_id);
CREATE INDEX idx_stockmov_product ON stock_movements(product_id);

-- 17) Optional triggers (example): keep inventory quantity consistent when an order item is inserted/removed.
-- WARNING: triggers should be used carefully; here's a safe example for demonstration — comment out if not desired.

DELIMITER $$  -- treat everything until $$ as one statement

-- When inserting an order_item, decrease inventory quantity (best-effort: will run and update if inventory row exists)
CREATE TRIGGER trg_orderitem_after_insert
AFTER INSERT ON order_items
FOR EACH ROW
BEGIN
  -- When a new order item is added, the database automatically reduces the inventory quantity for that product.
  -- If a warehouse is specified decrease inventory from that warehouse,If no warehouse, decrease from the first available warehouse
  IF NEW.warehouse_id IS NOT NULL THEN
    UPDATE inventory
    SET quantity = GREATEST(0, quantity - NEW.quantity),
        last_updated = NOW()
    WHERE product_id = NEW.product_id AND warehouse_id = NEW.warehouse_id;
  ELSE
    -- If no warehouse specified, try to decrement across warehouses in FIFO order (simple approach: top warehouse first)
    UPDATE inventory
    SET quantity = GREATEST(0, quantity - NEW.quantity),  -- quantity never goes negative
        last_updated = NOW()
    WHERE product_id = NEW.product_id
    ORDER BY inventory_id
    LIMIT 1;
  END IF;
END$$

-- When an order item is removed (e.g., order cancelled), it adds the quantity back to inventory.
-- if a warehouse exists, update that one; otherwise, update the first available warehouse.
CREATE TRIGGER trg_orderitem_after_delete
AFTER DELETE ON order_items
FOR EACH ROW
BEGIN
  IF OLD.warehouse_id IS NOT NULL THEN
    UPDATE inventory
    SET quantity = quantity + OLD.quantity,
        last_updated = NOW()
    WHERE product_id = OLD.product_id AND warehouse_id = OLD.warehouse_id;
  ELSE
    UPDATE inventory
    SET quantity = quantity + OLD.quantity,
        last_updated = NOW()
    WHERE product_id = OLD.product_id
    ORDER BY inventory_id
    LIMIT 1;
  END IF;
END$$

CREATE TRIGGER trg_orders_before_insert
BEFORE INSERT ON orders
FOR EACH ROW
BEGIN
    -- If billing_address is NULL, set it to customer's billing_address
    IF NEW.billing_address IS NULL THEN
        SELECT billing_address
        INTO @cust_billing
        FROM customers
        WHERE customer_id = NEW.customer_id;
        
        SET NEW.billing_address = @cust_billing;
    END IF;
END$$

DELIMITER ;

-- End of schema

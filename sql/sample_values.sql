USE ecommerce_db;
INSERT INTO users (username, email, password_hash, role_id, created_at, last_login, is_active)
VALUES
('rabab.raza', 'rabab.raza@example.com', '$2b$12$Tg9j4xwF8Qa1qkXH.8N6DeXfTzB1plrHCuEqS8F5Mpa9o0zYVvV1O', 1, '2025-10-01 09:15:00', '2025-10-25 11:42:00', 1),
('prabhnoor.saini', 'prabhnoor.saini@example.com', '$2b$10$P4f1Qe3zM7lYqN5KjR9n0u1WcDxv2ErX6OaK7YcRf9tW1UpB9sPJe', 1, '2025-09-20 14:30:00', '2025-10-29 08:50:00', 1),
('khushi.patel', 'khushi.patel@example.com', '$2a$12$kH8FvE5D2lM9xR1TqC3nZeB8JdH4qPpW7zGmYhUeJr2sM0aXoTtKe', 1, '2025-09-10 10:00:00', '2025-10-30 19:25:00', 1),
('jayden.mallari', 'jayden.mallari@example.com', '$2b$10$V5zXfQ8LkU1pE2sO9wHnZaL3qTjU4cNbD5mYiHuPjW9rG3vXkR2tC', 1, '2025-10-05 12:10:00', '2025-10-31 17:45:00', 1),
('emily.fernandez', 'emily.fernandez@example.com', '$2y$10$R9eS8uXfC2qJ4lO6vM1dNhG5wTtZrH8pYjXbN2mLcV3qF9rEoA6uL', 2, '2025-08-25 15:40:00', '2025-10-26 16:00:00', 1),
('daniel.cho', 'daniel.cho@example.com', '$2a$12$B7mH2cR9nP5jK8uT1xQeFwV2oDzL6rA9gS3yHfE4wM8bJ2sNcPzVh', 2, '2025-09-15 09:00:00', '2025-10-20 13:10:00', 1),
('sofia.kim', 'sofia.kim@example.com', '$2b$10$E6pQvX9yT2nM3rL8sJ5kUoC4hD7bF1aG9tHqP5mW6zN2xV4eR1jS', 2, '2025-07-18 16:25:00', '2025-10-28 18:30:00', 1),
('aarav.shah', 'aarav.shah@example.com', '$2b$12$K9xW3qL1eT8mV5oH2pR7uF4zN6dC3aG8yJ1kS0bD5wE9nZ4sT7cU', 2, '2025-10-10 20:45:00', '2025-10-30 21:05:00', 1);

INSERT INTO customers (first_name, last_name, email, phone, billing_address, shipping_address, created_at, is_active) 
VALUES
('Aarav', 'Patel', 'aarav.patel@example.com', '+1-416-555-1123', '12 Queen St W, Toronto, ON M5H 3X4', '12 Queen St W, Toronto, ON M5H 3X4', '2025-01-10 14:32:00', 0),
('Sofia', 'Nguyen', 'sofia.nguyen@example.com', '+1-647-555-2299', '88 Bay St, Toronto, ON M5J 0B6', '102 Front St E, Toronto, ON M5A 4P8', '2025-02-03 10:20:00', 1),
('Ethan', 'Johnson', 'ethan.johnson@example.com', '+1-905-555-7712', '432 Main St, Oshawa, ON L1H 8A7', '432 Main St, Oshawa, ON L1H 8A7', '2025-02-15 18:45:00', 1),
('Ashley', 'West', 'ashley.west@example.com', '+1-289-555-9934', '25 Dundas Sq, Toronto, ON M5B 1B7', '80 Gerrard St E, Toronto, ON M5B 2P7', '2025-03-01 11:10:00', 1),
('Liam', 'Wong', 'liam.wong@example.com', '+1-437-555-6421', '300 Richmond St W, Toronto, ON M5V 1X2', '300 Richmond St W, Toronto, ON M5V 1X2', '2025-03-09 16:30:00', 1),
('Isabella', 'Garcia', 'isabella.garcia@example.com', '+1-416-555-7654', '57 King St E, Toronto, ON M5C 1G9', '130 Bloor St W, Toronto, ON M5S 1N5', '2025-03-22 09:50:00', 1),
('Noah', 'Williams', 'noah.williams@example.com', '+1-705-555-8883', '90 Simcoe St N, Oshawa, ON L1G 4S2', '90 Simcoe St N, Oshawa, ON L1G 4S2', '2025-04-02 13:22:00', 0),
('Olivia', 'Martinez', 'olivia.martinez@example.com', '+1-613-555-1129', '10 Rideau St, Ottawa, ON K1N 9J7', '10 Rideau St, Ottawa, ON K1N 9J7', '2025-04-15 08:45:00', 1),
('William', 'Brown', 'william.brown@example.com', '+1-519-555-3571', '220 King St W, Toronto, ON M5H 1K4', '150 University Ave, Toronto, ON M5H 3Y9', '2025-04-28 19:15:00', 1),
('Aisha', 'Ali', 'aisha.ali@example.com', '+1-905-555-6662', '45 Harwood Ave S, Ajax, ON L1S 2H9', '67 Bayly St W, Ajax, ON L1S 7K8', '2025-05-03 12:05:00', 1);

INSERT INTO suppliers (supplier_name, contact_name, email, phone, address, created_at) VALUES
('TechNova Electronics', 'Ravi Mehta', 'ravi.mehta@technova.com', '+1-416-555-9032', '120 Front St W, Toronto, ON M5J 1G6', '2025-01-12 10:45:00'),
('HomeEase Furniture Co.', 'Laura Bennett', 'laura.bennett@homeease.ca', '+1-647-555-2764', '240 King St E, Toronto, ON M5A 1K1', '2025-01-15 14:32:00'),
('GreenLeaf Organics', 'Sanjay Kapoor', 'sanjay.kapoor@greenleaf.ca', '+1-905-555-9321', '88 Dundas St W, Mississauga, ON L5B 1H7', '2025-01-18 09:50:00'),
('PixelPro Tech Supplies', 'Nora Williams', 'nora.williams@pixelpro.com', '+1-437-555-6719', '50 Richmond St E, Toronto, ON M5C 1N7', '2025-02-03 13:15:00'),
('UrbanWear Apparel', 'Jaspreet Kaur', 'jaspreet.kaur@urbanwear.com', '+1-289-555-8824', '190 Yonge St, Toronto, ON M5B 2H1', '2025-02-10 11:40:00'),
('EcoLight Solutions', 'Miguel Santos', 'miguel.santos@ecolight.ca', '+1-613-555-9932', '22 Queen St, Ottawa, ON K1P 5C6', '2025-02-25 16:05:00'),
('PrimeTools Hardware', 'Sarah Johnson', 'sarah.johnson@primetools.ca', '+1-519-555-7889', '320 Weber St N, Waterloo, ON N2J 3H8', '2025-03-01 10:25:00'),
('AquaPure Bottling Co.', 'Daniel Lee', 'daniel.lee@aquapure.ca', '+1-905-555-4420', '78 Water St, Whitby, ON L1N 9T2', '2025-03-10 08:55:00'),
('NextGen Gadgets', 'Anjali Desai', 'anjali.desai@nextgen.com', '+1-416-555-5591', '15 Spadina Ave, Toronto, ON M5V 2K8', '2025-03-15 17:30:00'),
('MapleWood Crafts', 'Oliver Martin', 'oliver.martin@maplewood.ca', '+1-705-555-6627', '55 Bay St, Barrie, ON L4M 3A4', '2025-03-20 12:00:00');

INSERT INTO categories (category_name, description) VALUES
('Electronics', 'Devices such as smartphones, laptops, cameras, and related accessories.'),
('Clothing & Apparel', 'Men’s, women’s, and children’s clothing, including casual, formal, and seasonal wear.'),
('Beauty & Personal Care', 'Products for skincare, cosmetics, and personal hygiene.'),
('Toys & Games', 'Toys, puzzles, and interactive games suitable for all age groups.'),
('Furniture', 'Indoor and outdoor furniture, including office and home collections.'),
('Groceries & Food', 'Packaged foods, beverages, snacks, and fresh produce.'),
('Health & Fitness', 'Fitness gear, supplements, and personal workout equipment.'),
('Office Supplies', 'Stationery, printers, desks, and other office essentials.');

INSERT INTO products (sku, product_name, description, category_id, price, retail_price, active, created_at)
VALUES
-- Electronics (category_id = 1)
('ELEC001', 'Samsung Galaxy S23', 'Flagship Android smartphone with 128GB storage and AMOLED display.', 1, 999.99, 1099.99, 1, '2023-12-15 10:25:33'),
('ELEC002', 'Apple MacBook Air M2', 'Lightweight laptop powered by the M2 chip, 8GB RAM, 256GB SSD.', 1, 1299.00, 1399.00, 1, '2024-01-22 14:10:48'),
('ELEC003', 'Sony WH-1000XM5 Headphones', 'Noise-cancelling wireless headphones with 30-hour battery life.', 1, 379.99, 429.99, 1, '2024-03-05 09:42:15'),
-- Clothing & Apparel (category_id = 2)
('CLO001', 'Men’s Slim Fit Jeans', 'Dark blue denim jeans with stretchable fabric.', 2, 59.99, 79.99, 1, '2024-03-28 17:21:54'),
('CLO002', 'Women’s Summer Dress', 'Light floral cotton dress perfect for warm weather.', 2, 45.00, 60.00, 1, '2024-04-10 13:55:27'),
('CLO003', 'Unisex Hoodie', 'Comfortable fleece hoodie available in multiple colors.', 2, 39.99, 55.00, 1, '2024-05-02 11:30:12'),
-- Beauty & Personal Care (category_id = 3)
('BEAU001', 'Hydrating Face Cream', 'Moisturizing face cream suitable for all skin types.', 3, 24.99, 29.99, 1, '2024-05-15 15:45:09'),
('BEAU002', 'Organic Shampoo', 'Sulphate-free shampoo enriched with natural oils.', 3, 14.99, 18.99, 0, '2024-06-01 10:19:44'),
('BEAU003', 'Matte Lipstick Set', 'Set of 3 matte lipsticks with long-lasting finish.', 3, 22.50, 28.00, 1, '2024-06-22 16:57:33'),
-- Toys & Games (category_id = 4)
('TOY001', 'LEGO Classic Set', 'Creative building block set with 500+ pieces.', 4, 39.99, 49.99, 1, '2024-07-04 12:15:18'),
('TOY002', 'UNO Card Game', 'Classic card game suitable for family fun nights.', 4, 9.99, 12.99, 1, '2024-07-25 09:49:11'),
('TOY003', 'RC Car Turbo Racer', 'Remote control car with rechargeable battery.', 4, 59.99, 74.99, 0, '2024-08-11 18:30:22'),
-- Furniture (category_id = 5)
('FUR001', 'Ergonomic Office Chair', 'Adjustable swivel chair with lumbar support.', 5, 149.00, 179.00, 1, '2024-09-03 10:05:59'),
('FUR002', 'Wooden Coffee Table', 'Solid oak coffee table with modern finish.', 5, 199.99, 229.99, 1, '2024-09-22 14:45:16'),
('FUR003', '3-Seater Sofa', 'Comfortable fabric sofa with wooden legs.', 5, 499.00, 549.00, 1, '2024-10-05 20:12:33'),
-- Groceries & Food (category_id = 6)
('FOOD001', 'Organic Green Tea (Pack of 50)', 'Refreshing and healthy green tea bags.', 6, 9.49, 11.99, 1, '2024-11-10 09:23:17'),
('FOOD002', 'Whole Grain Pasta 1kg', 'High-fiber pasta made from 100% whole grains.', 6, 4.99, 6.99, 1, '2024-12-02 08:41:05'),
('FOOD003', 'Almond Butter 500g', 'Creamy almond butter with no added sugar.', 6, 12.99, 16.99, 0, '2025-01-14 15:33:52'),
-- Health & Fitness (category_id = 7)
('FIT001', 'Yoga Mat', 'Non-slip yoga mat made of eco-friendly materials.', 7, 29.99, 39.99, 1, '2025-02-03 11:14:09'),
('FIT002', 'Adjustable Dumbbell Set', 'Pair of dumbbells adjustable from 5–25 lbs.', 7, 89.99, 109.99, 1, '2025-02-25 17:40:26'),
-- Office Supplies (category_id = 8)
('OFF001', 'Wireless Mouse', 'Ergonomic wireless mouse with long battery life.', 8, 19.99, 24.99, 1, '2025-03-08 12:22:47'),
('OFF002', 'A4 Notebook Pack', 'Set of 5 ruled notebooks for everyday writing.', 8, 14.99, 19.99, 1, '2025-03-25 09:51:18');


INSERT INTO warehouses (warehouse_name, location, contact_phone, created_at)
VALUES
('Central Distribution Center', 'Toronto, ON', '+1-416-782-1456', '2022-03-15 09:34:22'),
('West Coast Logistics Hub', 'Vancouver, BC', '+1-604-889-3175', '2021-07-28 14:50:10'),
('Prairie Storage Facility', 'Calgary, AB', '+1-403-762-9412', '2023-01-19 11:05:37'),
('Eastern Supply Depot', 'Montreal, QC', '+1-514-655-2209', '2022-10-03 17:44:52'),
('GTA South Warehouse', 'Mississauga, ON', '+1-905-331-7764', '2024-04-21 08:19:46'),
('Northern Regional Storage', 'Sudbury, ON', '+1-705-475-8082', '2023-06-12 19:57:18'),
('Maritime Fulfillment Center', 'Halifax, NS', '+1-902-512-4479', '2021-11-09 10:26:31'),
('Ottawa Distribution Hub', 'Ottawa, ON', '+1-613-727-9234', '2022-08-15 13:48:05'),
('Quebec City Storage Unit', 'Quebec City, QC', '+1-418-693-5541', '2023-02-27 16:39:54'),
('Winnipeg Logistics Center', 'Winnipeg, MB', '+1-204-882-6617', '2024-01-06 07:22:43');

INSERT INTO inventory (product_id, warehouse_id, quantity, last_updated)
VALUES
(1, 5, 320, '2025-05-29 14:25:00'),
(2, 1, 180, '2025-09-06 14:30:00'),
(3, 2, 250, '2025-03-02 14:45:00'),
(4, 3, 600, '2025-02-13 15:00:00'),
(5, 4, 480, '2025-08-28 15:10:00'),
(7, 9, 750, '2025-10-26 15:20:00'),
(10, 7, 400, '2025-08-05 15:35:00'),
(13, 8, 120, '2025-02-07 15:45:00'),
(17, 6, 540, '2025-04-14 16:00:00'),
(20, 10, 260, '2025-06-30 16:15:00');

INSERT INTO orders 
(order_number, customer_id, order_status, order_date, shipping_address, billing_address, subtotal, tax, shipping_fee, total, last_updated, created_by)
VALUES
('ORD-1001', 2, 'processed', '2025-02-10 11:20:00', '102 Front St E, Toronto, ON M5A 4P8', '88 Bay St, Toronto, ON M5J 0B6', 249.99, 32.50, 10.00, 292.49, '2025-02-11 08:00:00', 3),
('ORD-1002', 3, 'shipped', '2025-02-18 14:10:00', '432 Main St, Oshawa, ON L1H 8A7', '432 Main St, Oshawa, ON L1H 8A7', 89.99, 11.70, 7.00, 108.69, '2025-02-19 09:25:00', 4),
('ORD-1003', 4, 'pending', '2025-03-03 09:40:00', '80 Gerrard St E, Toronto, ON M5B 2P7', '25 Dundas Sq, Toronto, ON M5B 1B7', 59.99, 7.80, 5.00, 72.79, '2025-03-03 10:15:00', 6),
('ORD-1004', 5, 'delivered', '2025-03-10 13:15:00', '300 Richmond St W, Toronto, ON M5V 1X2', '300 Richmond St W, Toronto, ON M5V 1X2', 1199.00, 155.87, 15.00, 1369.87, '2025-03-15 12:05:00', 2),
('ORD-1005', 6, 'cancelled', '2025-03-25 10:00:00', '130 Bloor St W, Toronto, ON M5S 1N5', '57 King St E, Toronto, ON M5C 1G9', 74.50, 9.68, 0.00, 84.18, '2025-03-26 08:10:00', 7),
('ORD-1006', 8, 'processed', '2025-04-16 15:45:00', '10 Rideau St, Ottawa, ON K1N 9J7', '10 Rideau St, Ottawa, ON K1N 9J7', 499.99, 65.00, 10.00, 574.99, '2025-04-18 10:30:00', 4),
('ORD-1007', 9, 'delivered', '2025-04-30 12:05:00', '150 University Ave, Toronto, ON M5H 3Y9', '220 King St W, Toronto, ON M5H 1K4', 189.00, 24.57, 8.00, 221.57, '2025-05-02 11:00:00', 1),
('ORD-1008', 10, 'shipped', '2025-05-05 17:30:00', '67 Bayly St W, Ajax, ON L1S 7K8', NULL, 329.99, 42.90, 10.00, 382.89, '2025-05-06 09:40:00', 5),
('ORD-1009', 2, 'pending', '2025-05-20 09:25:00', '102 Front St E, Toronto, ON M5A 4P8', '88 Bay St, Toronto, ON M5J 0B6', 39.99, 5.20, 5.00, 50.19, '2025-05-21 08:10:00', 3),
('ORD-1010', 3, 'processed', '2025-06-02 14:00:00', '432 Main St, Oshawa, ON L1H 8A7', '432 Main St, Oshawa, ON L1H 8A7', 149.00, 19.37, 8.00, 176.37, '2025-06-03 12:50:00', 2),
('ORD-1011', 5, 'shipped', '2025-07-10 11:25:00', '300 Richmond St W, Toronto, ON M5V 1X2', '300 Richmond St W, Toronto, ON M5V 1X2', 699.00, 90.87, 12.00, 801.87, '2025-07-12 10:00:00', 7),
('ORD-1012', 6, 'delivered', '2025-07-18 16:00:00', '130 Bloor St W, Toronto, ON M5S 1N5', NULL, 49.99, 6.50, 5.00, 61.49, '2025-07-20 08:45:00', 4),
('ORD-1013', 8, 'cancelled', '2025-08-10 10:10:00', '10 Rideau St, Ottawa, ON K1N 9J7', '10 Rideau St, Ottawa, ON K1N 9J7', 79.99, 10.40, 0.00, 90.39, '2025-08-11 09:00:00', 6),
('ORD-1014', 9, 'pending', '2025-09-02 13:45:00', '150 University Ave, Toronto, ON M5H 3Y9', '220 King St W, Toronto, ON M5H 1K4', 899.00, 116.87, 15.00, 1030.87, '2025-09-03 12:00:00', 1),
('ORD-1015', 10, 'delivered', '2025-10-01 18:25:00', '67 Bayly St W, Ajax, ON L1S 7K8', '45 Harwood Ave S, Ajax, ON L1S 2H9', 229.00, 29.77, 7.00, 265.77, '2025-10-03 11:15:00', 5);

INSERT INTO order_items (order_id, product_id, warehouse_id, quantity, unit_price, line_total)
VALUES
(1, 1, 1, 1, 999.99, 999.99),
(1, 3, 1, 2, 379.99, 759.98),
(2, 4, 3, 3, 59.99, 179.97),
(2, 6, 5, 1, 39.99, 39.99),
(3, 10, 2, 1, 39.99, 39.99), 
(4, 14, 4, 1, 199.99, 199.99),
(5, 2, 1, 1, 1299.00, 1299.00),
(6, 20, 5, 2, 89.99, 179.98),
(7, 16, 6, 4, 4.99, 19.96),
(8, 21, 8, 3, 19.99, 59.97);

INSERT INTO payments (order_id, payment_method, payment_status, amount, paid_at, transaction_ref)
VALUES
(1, 'card', 'completed', 292.49, '2025-02-11 09:10:00', 'TRX-CA-458739201'),
(2, 'paypal', 'completed', 108.69, '2025-02-19 10:05:00', 'PP-20250219-871263'),
(3, 'cod', 'pending', 72.79, NULL, NULL),
(4, 'bank_transfer', 'completed', 1369.87, '2025-03-15 12:45:00', 'BT-INTL-98745123'),
(5, 'gift_card', 'refunded', 84.18, '2025-03-26 09:30:00', 'GC-20250326-41782'),
(6, 'apple_pay', 'completed', 574.99, '2025-04-18 11:20:00', 'AP-20250418-990673'),
(7, 'google_pay', 'completed', 221.57, '2025-05-02 12:10:00', 'GPAY-20250502-55388'),
(8, 'crypto', 'failed', 382.89, '2025-05-06 10:25:00', 'BTC-TX-4F9A23BC'),
(9, 'card', 'processing', 50.19, '2025-05-21 09:00:00', 'TRX-CA-459002114'),
(10, 'other', 'completed', 176.37, '2025-06-03 13:25:00', 'OTH-20250603-AB9321');

INSERT INTO product_suppliers (product_id, supplier_id, supplier_sku, lead_time_days, min_order_qty)
VALUES
(1, 1, 'TN-ELEC001-S23', 7, 20),
(2, 9, 'NG-MAC-M2', 10, 10),
(3, 4, 'PP-SONY-XM5', 5, 30),
(4, 5, 'UW-JEANS-SLIM', 6, 50),
(14, 2, 'HE-FUR002', 12, 15),
(16, 3, 'GL-FOOD001', 4, 100),
(19, 7, 'PT-FIT001', 8, 40),
(21, 4, 'PP-OFF001', 3, 60),
(7, 3, 'GL-BEAU001', 5, 80),
(15, 2, 'HE-FUR003', 14, 5);

INSERT INTO stock_movements (product_id, warehouse_id, movement_type, reference_id, quantity_change, note, created_at, created_by)
VALUES
(1, 1, 'purchase', 'PO-2025-001', 50, 'Received new shipment from TechNova Electronics', '2025-10-01 09:30:00', 1),
(2, 2, 'sale', 'SO-2025-015', -5, 'Sold to retail partner order #SO-2025-015', '2025-10-02 14:20:00', 2),
(3, 5, 'purchase', 'PO-2025-002', 80, 'Restocked Sony Headphones from PixelPro', '2025-10-03 10:45:00', 1),
(4, 9, 'sale', 'SO-2025-021', -30, 'Men’s Slim Fit Jeans bulk order dispatched', '2025-10-04 16:10:00', 2),
(7, 3, 'purchase', 'PO-2025-003', 120, 'Hydrating Face Cream order from GreenLeaf Organics', '2025-10-05 11:55:00', 1),
(14, 2, 'return', 'RT-2025-004', 3, 'Customer return due to damaged packaging', '2025-10-06 09:40:00', 2),
(15, 4, 'purchase', 'PO-2025-005', 10, 'New batch of sofas delivered from HomeEase Furniture', '2025-10-07 13:20:00', 1),
(16, 6, 'sale', 'SO-2025-034', -40, 'Shipped Organic Green Tea to online orders', '2025-10-08 15:35:00', 2),
(19, 8, 'adjustment', 'ADJ-2025-006', -2, 'Inventory adjustment due to damaged Yoga Mats', '2025-10-09 08:50:00', 1),
(21, 5, 'purchase', 'PO-2025-007', 100, 'Wireless Mouse restock from PixelPro Tech Supplies', '2025-10-10 12:10:00', 2),
(3, 1, 'sale', 'SO-2025-040', -25, 'Bulk order to electronics distributor', '2025-10-11 17:45:00', 1),
(19, 7, 'return', 'RT-2025-008', 5, 'Returned Yoga Mats from customer order #RT-2025-008', '2025-10-12 10:25:00', 2);

INSERT INTO reviews (product_id, user_id, rating, comment, review_date)
VALUES
(1, 3, 5, 'Absolutely love the Samsung Galaxy S23! The display and camera quality are top-notch.', '2025-09-20 10:15:00'),
(2, 4, 4, 'The MacBook Air M2 is fast and sleek, but I wish it had more ports.', '2025-09-22 14:40:00'),
(3, 6, 5, 'These Sony headphones are incredible for noise cancellation. Worth every penny!', '2025-09-25 09:30:00'),
(4, 7, 3, 'Good jeans for the price, but the fit could be a little better.', '2025-09-27 18:20:00'),
(7, 5, 4, 'Hydrating Face Cream feels smooth and keeps my skin soft all day.', '2025-09-29 11:45:00'),
(14, 2, 5, 'The coffee table looks great in my living room. Sturdy and elegant.', '2025-10-02 16:05:00'),
(15, 3, 4, 'Comfortable sofa and good quality material. Delivery took a bit long.', '2025-10-04 13:50:00'),
(16, 1, 5, 'I love this green tea—refreshing and aromatic. Highly recommend!', '2025-10-06 09:25:00'),
(19, 2, 4, 'The yoga mat is thick and doesn’t slip. Great for daily workouts.', '2025-10-08 17:10:00'),
(21, 4, 5, 'Wireless mouse is responsive and ergonomic. Battery lasts forever!', '2025-10-10 15:35:00');




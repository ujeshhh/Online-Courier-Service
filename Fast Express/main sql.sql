CREATE DATABASE fastexpress;

USE fastexpress;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fullname VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    username VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE express_ship (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    product_dimensions VARCHAR(50),
    product_weight VARCHAR(50),
    product_type VARCHAR(50),
    pickup_time VARCHAR(50),
    product_details TEXT,
    from_address TEXT,
    to_address TEXT,
    parcel_note TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
ALTER TABLE express_ship
ADD COLUMN order_picked_up BOOLEAN DEFAULT FALSE,
ADD COLUMN out_for_delivery BOOLEAN DEFAULT FALSE,
ADD COLUMN delivered BOOLEAN DEFAULT FALSE;
ALTER TABLE express_ship
ADD COLUMN status ENUM('Order Picked Up', 'Out for Delivery', 'Delivered') DEFAULT 'Order Picked Up';

ALTER TABLE express_ship
ADD COLUMN delivered BOOLEAN DEFAULT FALSE;
CREATE TABLE bulk_shipping (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    product_dimensions VARCHAR(255) NOT NULL,
    product_weight VARCHAR(100) NOT NULL,
    product_type VARCHAR(255) NOT NULL,
    pickup_time VARCHAR(50) NOT NULL,
    product_details TEXT,
    from_address TEXT NOT NULL,
    to_address TEXT NOT NULL,
    parcel_note TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE payment (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    card_number VARCHAR(16) NOT NULL,
    expiry_month INT NOT NULL,
    expiry_year INT NOT NULL,
    cvv VARCHAR(3) NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
ALTER TABLE bulk_shipping ADD status VARCHAR(50) DEFAULT 'Pending';

select*from express_ship;
select*from bulk_shipping;
select*from payment;

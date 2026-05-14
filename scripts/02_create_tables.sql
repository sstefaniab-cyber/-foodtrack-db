CREATE TABLE locations (
    location_id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(100) NOT NULL,
    city VARCHAR(100)
);

CREATE TABLE foodtrucks (
    foodtruck_id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(100) NOT NULL,
    location_id INT,

    FOREIGN KEY (location_id)
        REFERENCES locations(location_id)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY IDENTITY(1,1),
    foodtruck_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (foodtruck_id)
        REFERENCES foodtrucks(foodtruck_id)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY IDENTITY(1,1),
    foodtruck_id INT NOT NULL,
    order_date DATETIME DEFAULT GETDATE(),
    total DECIMAL(10,2),

    FOREIGN KEY (foodtruck_id)
        REFERENCES foodtrucks(foodtruck_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY IDENTITY(1,1),
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id),

    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);
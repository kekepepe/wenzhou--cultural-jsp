CREATE DATABASE IF NOT EXISTS wenzhou_travel CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE wenzhou_travel;

-- 1. Table t_user
CREATE TABLE IF NOT EXISTS t_user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    realname VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(100),
    address VARCHAR(255),
    is_admin INT DEFAULT 0 COMMENT '0=User, 1=Admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 2. Table t_food (Wenzhou Food)
CREATE TABLE IF NOT EXISTS t_food (
    id INT AUTO_INCREMENT PRIMARY KEY,
    food_name VARCHAR(100) NOT NULL,
    taste VARCHAR(50),
    price DECIMAL(10, 2),
    description TEXT,
    img_url VARCHAR(255)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 3. Table t_scenery (Wenzhou Scenery)
CREATE TABLE IF NOT EXISTS t_scenery (
    id INT AUTO_INCREMENT PRIMARY KEY,
    scene_name VARCHAR(100) NOT NULL,
    level VARCHAR(10),
    ticket_price DECIMAL(10, 2),
    location VARCHAR(255),
    description TEXT,
    img_url VARCHAR(255)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 4. Table t_culture (Wenzhou Culture)
CREATE TABLE IF NOT EXISTS t_culture (
    id INT AUTO_INCREMENT PRIMARY KEY,
    culture_name VARCHAR(100) NOT NULL,
    type VARCHAR(50),
    history VARCHAR(255),
    significance TEXT,
    description TEXT,
    img_url VARCHAR(255)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data Insertion

-- Admin User
INSERT INTO t_user (username, password, realname, phone, email, address, is_admin)
VALUES ('admin', 'admin123', 'System Administrator', '13800000000', 'admin@wenzhoutravel.com', 'Wenzhou City Hall', 1);

-- Normal User
INSERT INTO t_user (username, password, realname, phone, email, address, is_admin)
VALUES ('user1', '123456', 'Zhang San', '13900000000', 'zhangsan@example.com', 'Lucheng District', 0);

-- Food Data
INSERT INTO t_food (food_name, taste, price, description, img_url)
VALUES 
('Glutinous Rice', 'Savory', 15.00, 'Wenzhou Glutinous Rice (Nuomifan) is a classic breakfast, topped with savory meat sauce and crispy youtiao.', 'nuomifan.jpg'),
('Fish Ball Soup', 'Light', 20.00, 'Authentic Wenzhou Fish Balls are chewy and served in a clear, flavorful broth.', 'fishball.jpg'),
('Duck Tongue', 'Salty-Sweet', 68.00, 'A famous Wenzhou specialty, braised duck tongue with a unique texture.', 'ducktongue.jpg');

-- Scenery Data
INSERT INTO t_scenery (scene_name, level, ticket_price, location, description, img_url)
VALUES 
('Yandang Mountain', '5A', 160.00, 'Yueqing, Wenzhou', 'Known for its unique rock formations and volcanic geology. A World Geopark.', 'yandang.jpg'),
('Nanxi River', '4A', 50.00, 'Yongjia, Wenzhou', 'Famous for its pristine water, ancient villages, and bamboo rafting.', 'nanxi.jpg'),
('Jiangxin Island', '4A', 30.00, 'Lucheng, Wenzhou', 'A historic island in the Oujiang River with twin pagodas and beautiful gardens.', 'jiangxin.jpg');

-- Culture Data
INSERT INTO t_culture (culture_name, type, history, significance, description, img_url)
VALUES 
('Nanxi Opera', 'Intangible Heritage', 'Song Dynasty', 'The earliest form of Chinese opera.', 'Nanxi Opera originated in Wenzhou and is known for its distinct melodies and role types.', 'nanxiopera.jpg'),
('Wenzhou Drum Words', 'Folk Art', 'Qing Dynasty', 'A traditional storytelling art form.', 'performed by a single person playing a flat drum and singing stories in Wenzhou dialect.', 'drumwords.jpg'),
('Ou Embroidery', 'Craft', 'Tang Dynasty', 'One of the famous embroidery styles in Zhejiang.', 'Known for high artistic value and usage in daily items and decorations.', 'ouembroidery.jpg');

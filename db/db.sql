CREATE DATABASE IF NOT EXISTS pet4sitter CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE pet4sitter;

CREATE TABLE IF NOT EXISTS users (
    id_user INT AUTO_INCREMENT,
    id_google VARCHAR(255) UNIQUE,
    name VARCHAR(30) CHARACTER SET utf8mb4 NOT NULL,
    surname VARCHAR(60) CHARACTER SET utf8mb4,
    email VARCHAR(60) CHARACTER SET utf8mb4 NOT NULL unique,
    dni VARCHAR(9) CHARACTER SET utf8mb4,
    password VARCHAR(30) CHARACTER SET utf8mb4 NOT NULL,
    location VARCHAR(50) CHARACTER SET utf8mb4,
    premium TINYINT,
    sitter TINYINT,
    admin TINYINT,
    image longblob,
    PRIMARY KEY (id_user)
) CHARACTER SET utf8mb4;

CREATE TABLE IF NOT EXISTS reviews (
    id_review INT AUTO_INCREMENT PRIMARY KEY,
    valuation INT NOT NULL,
    id_reviewed INT NOT NULL,
    id_reviewer INT NOT NULL,
    FOREIGN KEY (id_reviewed) REFERENCES users(id_user),
    FOREIGN KEY (id_reviewer) REFERENCES users(id_user)
) CHARACTER SET utf8mb4;

CREATE TABLE IF NOT EXISTS products (
    id_product INT AUTO_INCREMENT PRIMARY KEY,
    price DOUBLE NOT NULL,	
    quantity INT NOT NULL,
    description VARCHAR(99) CHARACTER SET utf8mb4,
    image longblob
) CHARACTER SET utf8mb4;

CREATE TABLE IF NOT EXISTS chat (
    id_chat INT AUTO_INCREMENT PRIMARY KEY,
    id_receiver INT NOT NULL,
    id_sender INT NOT NULL,
    messages VARCHAR(255) CHARACTER SET utf8mb4 NOT NULL,
    FOREIGN KEY (id_receiver) REFERENCES users(id_user),
    FOREIGN KEY (id_sender) REFERENCES users(id_user)
) CHARACTER SET utf8mb4;pet4sitter
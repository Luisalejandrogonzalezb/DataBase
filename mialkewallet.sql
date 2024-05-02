CREATE DATABASE AlkeWallet;
USE AlkeWallet;
CREATE TABLE Usuario (
    user_id INT PRIMARY KEY,
    nombre VARCHAR(25) NOT NULL,
    correo_electronico VARCHAR(30) NOT NULL,
    contrasena VARCHAR(15) NOT NULL,
    saldo DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Moneda (
    currency_id INT PRIMARY KEY,
    currency_name VARCHAR(50),
    currency_symbol VARCHAR(10)
);
CREATE TABLE Transaccion (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    sender_user_id INT,
    receiver_user_id INT,
    importe DECIMAL(10,2),
    transaction_date DATE,
    FOREIGN KEY (sender_user_id) REFERENCES Usuario(user_id),
    FOREIGN KEY (receiver_user_id) REFERENCES Usuario(user_id)
);

INSERT INTO Usuario (user_id, nombre, correo_electronico, contrasena, saldo)
VALUES 
(1, 'Yenifer Sepulveda', 'ys@gmail.com', 'ys1234', 345.00),
(2, 'Diego Troncoso', 'dt@gmail.com', 'dt1234', 52.00),
(3, 'Hernan Cortes', 'hc@gmail.com', 'hc1234', 864.00),
(4, 'Matilde Salamanca', 'ms@gmail.com', 'ms1234', 85.00),
(5, 'Rodrigo de Araya', 'ra@gmail.com', 'ra1234', 745.00),
(6, 'Ignacio Riquelme', 'ir@gmail.com', 'ir1234', 5282.00);

SELECT * FROM Usuario;
INSERT INTO Moneda (currency_id, currency_name, currency_symbol) 
VALUES (1, 'Peso Chileno', '$');
SELECT * FROM Moneda;
CREATE TABLE Transaccion (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    sender_user_id INT,
    receiver_user_id INT,
    importe DECIMAL(10,2),
    transaction_date DATE,
    FOREIGN KEY (sender_user_id) REFERENCES Usuario(user_id),
    FOREIGN KEY (receiver_user_id) REFERENCES Usuario(user_id)
);
INSERT INTO Transaccion (sender_user_id, receiver_user_id, importe, transaction_date) 
VALUES (1, 2, 500.00, '2024-05-01');
INSERT INTO Transaccion (sender_user_id, receiver_user_id, importe, transaction_date) 
VALUES (6, 5, 70.00, '2024-05-01');
INSERT INTO Transaccion (sender_user_id, receiver_user_id, importe, transaction_date) 
VALUES (3, 4, 7500.00, '2024-05-01');
INSERT INTO Transaccion (sender_user_id, receiver_user_id, importe, transaction_date) 
VALUES (1, 3, 900.00, '2024-05-01');
INSERT INTO Transaccion (sender_user_id, receiver_user_id, importe, transaction_date) 
VALUES (6, 3, 10.00, '2024-05-01');
SELECT * FROM Transaccion;
SELECT currency_name 
FROM Moneda 
JOIN Usuario ON Moneda.currency_id = Usuario.user_id 
WHERE Usuario.user_id = 1;

SELECT * 
FROM Transaccion 
WHERE sender_user_id = 6 OR receiver_user_id = 6;
UPDATE Usuario 
SET correo_electronico = 'YS1@gmail.com' 
WHERE user_id = 1;
DELETE FROM Transaccion 
WHERE transaction_id = 1;
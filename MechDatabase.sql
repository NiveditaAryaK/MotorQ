CREATE DATABASE Mech;
USE Mech;


CREATE TABLE Vehicles(
    vehicle_id INT PRIMARY KEY,
    make VARCHAR(20),
    model VARCHAR(20),
    year INT NOT NULL,
    fuel_type VARCHAR(20),
    owner_id INT,
    FOREIGN KEY (owner_id) REFERENCES Owners(owner_id)
);

CREATE TABLE Owners(
owner_id INT PRIMARY KEY,
name VARCHAR(20),
contact_info VARCHAR(20)
);

CREATE TABLE Trips(
    trip_id INT PRIMARY KEY,
    vehicle_id INT,
    FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id),
    start_time DATETIME,
    end_time DATETIME,
    start_location VARCHAR(20),
    end_location VARCHAR(20),
    distance_travelled DECIMAL
);
CREATE TABLE Sensors(
    sensor_id INT PRIMARY KEY,
    vehicle_id INT,
    FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id),
    sensor_type VARCHAR(20),
    sensor_reading DECIMAL,
    timestamp DATETIME
);

CREATE TABLE Maintenance(
    maintenance_id INT PRIMARY KEY,
    vehicle_id INT,
    FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id),
    maintenance_type VARCHAR(20),
    maintenance_date DATE,
    maintenance_cost DECIMAL
);

INSERT INTO Owners (owner_id, name, contact_info)
VALUES 
(1, 'John Doe', '123-456-7890'),
(2, 'Jane Smith', '987-654-3210'),
(3, 'Alice Johnson', '555-555-5555'),
(4, 'Bob Brown', '444-444-4444'),
(5, 'Charlie Davis', '333-333-3333');

INSERT INTO Vehicles (vehicle_id, make, model, year, fuel_type, owner_id)
VALUES 
(1, 'Toyota', 'Corolla', 2018, 'Gasoline', 1),
(2, 'Honda', 'Civic', 2019, 'Gasoline', 2),
(3, 'Ford', 'Focus', 2020, 'Diesel', 3),
(4, 'Tesla', 'Model 3', 2021, 'Electric', 4),
(5, 'Chevrolet', 'Bolt', 2022, 'Electric', 5);

ALTER TABLE Trips 
MODIFY distance_travelled DECIMAL(10, 2);

INSERT INTO Trips (trip_id, vehicle_id, start_time, end_time, start_location, end_location, distance_travelled)
VALUES
(1, 1, '2024-09-01 08:00:00', '2024-09-01 09:00:00', 'Home', 'Office', 12.5),
(2, 1, '2024-09-02 10:00:00', '2024-09-02 11:30:00', 'Office', 'Mall', 15.3),
(3, 1, '2024-09-03 09:00:00', '2024-09-03 10:15:00', 'Home', 'Gym', 5.8),
(4, 1, '2024-09-04 11:00:00', '2024-09-04 12:10:00', 'Gym', 'Office', 8.1),
(5, 1, '2024-09-05 14:00:00', '2024-09-05 15:00:00', 'Office', 'Home', 12.2),
(6, 1, '2024-09-06 09:30:00', '2024-09-06 10:20:00', 'Home', 'Work Site', 22.5),
(7, 1, '2024-09-07 11:15:00', '2024-09-07 12:45:00', 'Work Site', 'Market', 14.8),
(8, 1, '2024-09-08 08:10:00', '2024-09-08 09:05:00', 'Market', 'Home', 18.9),
(9, 1, '2024-09-09 07:55:00', '2024-09-09 09:25:00', 'Home', 'Park', 10.5),
(10, 1, '2024-09-10 14:30:00', '2024-09-10 15:40:00', 'Park', 'Office', 15.0);


INSERT INTO Trips (trip_id, vehicle_id, start_time, end_time, start_location, end_location, distance_travelled)
VALUES
(11, 2, '2024-09-01 09:30:00', '2024-09-01 10:20:00', 'Home', 'Office', 11.2),
(12, 2, '2024-09-02 10:45:00', '2024-09-02 11:30:00', 'Office', 'School', 12.6),
(13, 2, '2024-09-03 07:00:00', '2024-09-03 07:50:00', 'Home', 'Supermarket', 5.0),
(14, 2, '2024-09-04 11:15:00', '2024-09-04 12:00:00', 'Supermarket', 'Office', 8.7),
(15, 2, '2024-09-05 13:20:00', '2024-09-05 14:30:00', 'Office', 'Park', 9.4),
(16, 2, '2024-09-06 08:10:00', '2024-09-06 09:05:00', 'Park', 'Gym', 7.3),
(17, 2, '2024-09-07 07:30:00', '2024-09-07 08:40:00', 'Gym', 'Home', 15.1),
(18, 2, '2024-09-08 06:20:00', '2024-09-08 07:00:00', 'Home', 'Market', 8.0),
(19, 2, '2024-09-09 09:10:00', '2024-09-09 10:20:00', 'Market', 'Office', 10.0),
(20, 2, '2024-09-10 08:00:00', '2024-09-10 09:00:00', 'Office', 'Home', 12.8);


INSERT INTO Trips (trip_id, vehicle_id, start_time, end_time, start_location, end_location, distance_travelled)
VALUES
(21, 3, '2024-09-01 10:00:00', '2024-09-01 11:30:00', 'Depot', 'Client Site', 40.0),
(22, 3, '2024-09-02 09:00:00', '2024-09-02 10:00:00', 'Client Site', 'Warehouse', 30.5),
(23, 3, '2024-09-03 08:00:00', '2024-09-03 09:45:00', 'Warehouse', 'Depot', 50.8),
(24, 3, '2024-09-04 10:00:00', '2024-09-04 11:30:00', 'Depot', 'Client Site', 45.0),
(25, 3, '2024-09-05 12:00:00', '2024-09-05 13:30:00', 'Client Site', 'Warehouse', 38.2),
(26, 3, '2024-09-06 11:15:00', '2024-09-06 12:30:00', 'Warehouse', 'Depot', 55.6),
(27, 3, '2024-09-07 09:00:00', '2024-09-07 10:20:00', 'Depot', 'Client Site', 46.5),
(28, 3, '2024-09-08 08:30:00', '2024-09-08 09:45:00', 'Client Site', 'Warehouse', 32.0),
(29, 3, '2024-09-09 10:15:00', '2024-09-09 11:15:00', 'Warehouse', 'Depot', 54.3),
(30, 3, '2024-09-10 14:30:00', '2024-09-10 15:40:00', 'Depot', 'Client Site', 42.7);


INSERT INTO Trips (trip_id, vehicle_id, start_time, end_time, start_location, end_location, distance_travelled)
VALUES
(31, 4, '2024-09-01 09:50:00', '2024-09-01 10:50:00', 'Home', 'Office', 12.4),
(32, 4, '2024-09-02 10:20:00', '2024-09-02 11:25:00', 'Office', 'Supermarket', 8.3),
(33, 4, '2024-09-03 08:30:00', '2024-09-03 09:30:00', 'Supermarket', 'Gym', 15.5),
(34, 4, '2024-09-04 14:10:00', '2024-09-04 15:15:00', 'Gym', 'Home', 10.0),
(35, 4, '2024-09-05 07:45:00', '2024-09-05 08:30:00', 'Home', 'Park', 7.5),
(36, 4, '2024-09-06 12:30:00', '2024-09-06 13:15:00', 'Park', 'Office', 6.5),
(37, 4, '2024-09-07 08:20:00', '2024-09-07 09:05:00', 'Office', 'Market', 9.8),
(38, 4, '2024-09-08 13:00:00', '2024-09-08 13:50:00', 'Market', 'Home', 11.2),
(39, 4, '2024-09-09 07:30:00', '2024-09-09 08:20:00', 'Home', 'Office', 10.1),
(40, 4, '2024-09-10 15:30:00', '2024-09-10 16:20:00', 'Office', 'Home', 12.0);


INSERT INTO Trips (trip_id, vehicle_id, start_time, end_time, start_location, end_location, distance_travelled)
VALUES
(41, 5, '2024-09-01 07:15:00', '2024-09-01 08:00:00', 'Home', 'Office', 12.3),
(42, 5, '2024-09-02 08:30:00', '2024-09-02 09:15:00', 'Office', 'Market', 14.2),
(43, 5, '2024-09-03 11:00:00', '2024-09-03 12:30:00', 'Market', 'Gym', 10.6),
(44, 5, '2024-09-04 09:30:00', '2024-09-04 10:15:00', 'Gym', 'Park', 5.5),
(45, 5, '2024-09-05 12:15:00', '2024-09-05 13:00:00', 'Park', 'Home', 9.9),
(46, 5, '2024-09-06 10:30:00', '2024-09-06 11:15:00', 'Home', 'Office', 11.1),
(47, 5, '2024-09-07 13:00:00', '2024-09-07 14:00:00', 'Office', 'Market', 15.3),
(48, 5, '2024-09-08 07:45:00', '2024-09-08 08:30:00', 'Market', 'Gym', 8.4),
(49, 5, '2024-09-09 06:30:00', '2024-09-09 07:15:00', 'Gym', 'Home', 9.0),
(50, 5, '2024-09-10 08:00:00', '2024-09-10 08:50:00', 'Home', 'Park', 10.2);

DROP TABLE IF EXISTS Sensors;
USE mech;
SHOW TABLES;
CREATE TABLE Sensors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    vehicle_id INT,
    sensor_type VARCHAR(50),
    sensor_reading FLOAT,
    timestamp DATETIME
);

INSERT INTO Sensors (vehicle_id, sensor_type, sensor_reading, timestamp) VALUES
(1, 'Speed', 60, '2024-09-01 08:30:00'),
(1, 'Fuel Level', 0.75, '2024-09-01 08:30:00'),
(1, 'Speed', 65, '2024-09-02 10:30:00'),
(1, 'Fuel Level', 0.50, '2024-09-02 10:30:00'),
(1, 'Speed', 70, '2024-09-03 09:15:00'),
(1, 'Fuel Level', 0.25, '2024-09-03 09:15:00'),
(1, 'Speed', 75, '2024-09-04 11:15:00'),
(1, 'Fuel Level', 0.30, '2024-09-04 11:15:00'),
(1, 'Speed', 55, '2024-09-05 14:15:00'),
(1, 'Fuel Level', 0.60, '2024-09-05 14:15:00'),

(2, 'Speed', 50, '2024-09-11 09:30:00'),
(2, 'Fuel Level', 0.80, '2024-09-11 09:30:00'),
(2, 'Speed', 90, '2024-09-12 10:30:00'), -- Anomaly
(2, 'Fuel Level', 0.40, '2024-09-12 10:30:00'),
(2, 'Speed', 55, '2024-09-13 09:15:00'),
(2, 'Fuel Level', 0.60, '2024-09-13 09:15:00'),
(2, 'Speed', 65, '2024-09-14 11:00:00'),
(2, 'Fuel Level', 0.30, '2024-09-14 11:00:00'),
(2, 'Speed', 80, '2024-09-15 14:15:00'), -- Anomaly
(2, 'Fuel Level', 0.50, '2024-09-15 14:15:00'),

(3, 'Speed', 45, '2024-09-21 09:30:00'),
(3, 'Fuel Level', 0.85, '2024-09-21 09:30:00'),
(3, 'Speed', 85, '2024-09-22 10:30:00'), -- Anomaly
(3, 'Fuel Level', 0.20, '2024-09-22 10:30:00'),
(3, 'Speed', 60, '2024-09-23 09:15:00'),
(3, 'Fuel Level', 0.70, '2024-09-23 09:15:00'),
(3, 'Speed', 70, '2024-09-24 11:00:00'),
(3, 'Fuel Level', 0.45, '2024-09-24 11:00:00'),
(3, 'Speed', 50, '2024-09-25 14:15:00'),
(3, 'Fuel Level', 0.55, '2024-09-25 14:15:00'),

(4, 'Speed', 55, '2024-10-01 09:30:00'),
(4, 'Fuel Level', 0.90, '2024-10-01 09:30:00'),
(4, 'Speed', 75, '2024-10-02 10:30:00'),
(4, 'Fuel Level', 0.40, '2024-10-02 10:30:00'),
(4, 'Speed', 60, '2024-10-03 09:15:00'),
(4, 'Fuel Level', 0.50, '2024-10-03 09:15:00'),
(4, 'Speed', 70, '2024-10-04 11:00:00'),
(4, 'Fuel Level', 0.30, '2024-10-04 11:00:00'),
(4, 'Speed', 80, '2024-10-05 14:15:00'), -- Anomaly
(4, 'Fuel Level', 0.60, '2024-10-05 14:15:00'),

(5, 'Speed', 40, '2024-10-11 09:30:00'),
(5, 'Fuel Level', 0.95, '2024-10-11 09:30:00'),
(5, 'Speed', 78, '2024-10-12 10:30:00'), -- Anomaly
(5, 'Fuel Level', 0.25, '2024-10-12 10:30:00'),
(5, 'Speed', 65, '2024-10-13 09:15:00'),
(5, 'Fuel Level', 0.65, '2024-10-13 09:15:00'),
(5, 'Speed', 72, '2024-10-14 11:00:00'),
(5, 'Fuel Level', 0.40, '2024-10-14 11:00:00'),
(5, 'Speed', 60, '2024-10-15 14:15:00'),
(5, 'Fuel Level', 0.50, '2024-10-15 14:15:00');

INSERT INTO Maintenance (maintenance_id, vehicle_id, maintenance_type, maintenance_date, maintenance_cost) VALUES 
(1, 1, 'Oil Change', '2024-09-10', 50.00), 
(2, 1, 'Tire Rot.', '2024-09-15', 30.00), 
(3, 1, 'Brake Ins.', '2024-09-20', 45.00),  
(4, 2, 'Oil Change', '2024-09-11', 55.00), 
(5, 2, 'Tire Rep.', '2024-09-16', 200.00), 
(6, 2, 'Battery Chk.', '2024-09-21', 25.00),  
(7, 3, 'Oil Change', '2024-09-12', 60.00), 
(8, 3, 'Brake Rep.', '2024-09-17', 150.00), 
(9, 3, 'Trans. Fluid', '2024-09-22', 80.00),  
(10, 4, 'Tire Rot.', '2024-09-13', 35.00), 
(11, 4, 'Battery Rep.', '2024-09-18', 120.00), 
(12, 4, 'Align.', '2024-09-23', 70.00),  
(13, 5, 'Oil Change', '2024-09-14', 50.00), 
(14, 5, 'Brake Ins.', '2024-09-19', 45.00), 
(15, 5, 'Fluid Chk.', '2024-09-24', 20.00);

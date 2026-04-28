USE CarModDB;
GO

INSERT INTO Users (Username, Email, PasswordHash)
VALUES ('JakeV','jake@email.com','hash1'),
       ('SpeedDemon','speed@email.com','hash2'),
       ('TrackKing','track@email.com','hash3');

INSERT INTO Cars (UserID, Make, Model, Year, VIN)
VALUES (1,'Chevrolet','Corvette',2000,'VIN001'),
       (1,'Chevrolet','Corvette',1986,'VIN002'),
       (2,'Ford','Mustang',2018,'VIN003');

INSERT INTO ModCategories (CategoryName)
VALUES ('Performance'), ('Suspension'), ('Cosmetic');

INSERT INTO Mods (CategoryID, Name, Description)
VALUES (1,'Cold Air Intake','Improves airflow'),
       (2,'Lowering Springs','Lower ride height'),
       (3,'Spoiler','Adds style');

INSERT INTO CarMods (CarID, ModID, InstallDate, Cost)
VALUES (1,1,'2025-03-10',350),
       (1,2,'2025-03-15',500),
       (2,3,'2024-08-01',200);

INSERT INTO Shops (ShopName, Location, Phone)
VALUES ('Speed Shop','Minneapolis','555-1111'),
       ('Auto Mods Garage','St Paul','555-2222'),
       ('Performance Plus','Bloomington','555-3333');

INSERT INTO Installations (CarModID, ShopID, InstallDate, LaborCost)
VALUES (1,1,'2025-03-10',150),
       (2,2,'2025-03-15',200),
       (3,3,'2024-08-01',100);

INSERT INTO MaintenanceRecords (CarID, ServiceType, ServiceDate, Cost)
VALUES (1,'Oil Change','2025-02-01',80),
       (2,'Tire Rotation','2025-01-10',60),
       (3,'Brake Pads','2025-03-05',300);
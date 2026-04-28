USE CarModDB;
GO

CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY,
    Username VARCHAR(50),
    Email VARCHAR(100),
    PasswordHash VARCHAR(100)
);

CREATE TABLE Cars (
    CarID INT PRIMARY KEY IDENTITY,
    UserID INT,
    Make VARCHAR(50),
    Model VARCHAR(50),
    Year INT,
    VIN VARCHAR(50),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE ModCategories (
    CategoryID INT PRIMARY KEY IDENTITY,
    CategoryName VARCHAR(50)
);

CREATE TABLE Mods (
    ModID INT PRIMARY KEY IDENTITY,
    CategoryID INT,
    Name VARCHAR(100),
    Description VARCHAR(255),
    FOREIGN KEY (CategoryID) REFERENCES ModCategories(CategoryID)
);

CREATE TABLE CarMods (
    CarModID INT PRIMARY KEY IDENTITY,
    CarID INT,
    ModID INT,
    InstallDate DATE,
    Cost DECIMAL(10,2),
    FOREIGN KEY (CarID) REFERENCES Cars(CarID),
    FOREIGN KEY (ModID) REFERENCES Mods(ModID)
);

CREATE TABLE Shops (
    ShopID INT PRIMARY KEY IDENTITY,
    ShopName VARCHAR(100),
    Location VARCHAR(100),
    Phone VARCHAR(20)
);

CREATE TABLE Installations (
    InstallID INT PRIMARY KEY IDENTITY,
    CarModID INT,
    ShopID INT,
    InstallDate DATE,
    LaborCost DECIMAL(10,2),
    FOREIGN KEY (CarModID) REFERENCES CarMods(CarModID),
    FOREIGN KEY (ShopID) REFERENCES Shops(ShopID)
);

CREATE TABLE MaintenanceRecords (
    MaintenanceID INT PRIMARY KEY IDENTITY,
    CarID INT,
    ServiceType VARCHAR(100),
    ServiceDate DATE,
    Cost DECIMAL(10,2),
    FOREIGN KEY (CarID) REFERENCES Cars(CarID)
);
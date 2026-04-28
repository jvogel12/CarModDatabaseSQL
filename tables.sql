USE CarModDB;
GO

-- USERS TABLE
-- Stores user account information
CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY,
    Username VARCHAR(50),
    Email VARCHAR(100),
    PasswordHash VARCHAR(100)
);

-- CARS TABLE
-- Stores vehicles owned by users
CREATE TABLE Cars (
    CarID INT PRIMARY KEY IDENTITY,
    UserID INT,
    Make VARCHAR(50),
    Model VARCHAR(50),
    Year INT,
    VIN VARCHAR(50),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- MOD CATEGORIES TABLE
-- Groups mods into categories
CREATE TABLE ModCategories (
    CategoryID INT PRIMARY KEY IDENTITY,
    CategoryName VARCHAR(50)
);

-- MODS TABLE
-- Stores all possible modifications
CREATE TABLE Mods (
    ModID INT PRIMARY KEY IDENTITY,
    CategoryID INT,
    Name VARCHAR(100),
    Description VARCHAR(255),
    FOREIGN KEY (CategoryID) REFERENCES ModCategories(CategoryID)
);

-- CARMODS TABLE (JUNCTION TABLE)
-- Connects Cars and Mods (many-to-many relationship)
CREATE TABLE CarMods (
    CarModID INT PRIMARY KEY IDENTITY,
    CarID INT,
    ModID INT,
    InstallDate DATE,
    Cost DECIMAL(10,2),
    FOREIGN KEY (CarID) REFERENCES Cars(CarID),
    FOREIGN KEY (ModID) REFERENCES Mods(ModID)
);

-- SHOPS TABLE
-- Stores shops where mods are installed
CREATE TABLE Shops (
    ShopID INT PRIMARY KEY IDENTITY,
    ShopName VARCHAR(100),
    Location VARCHAR(100),
    Phone VARCHAR(20)
);

-- INSTALLATIONS TABLE
-- Tracks which shop installed which mod
CREATE TABLE Installations (
    InstallID INT PRIMARY KEY IDENTITY,
    CarModID INT,
    ShopID INT,
    InstallDate DATE,
    LaborCost DECIMAL(10,2),
    FOREIGN KEY (CarModID) REFERENCES CarMods(CarModID),
    FOREIGN KEY (ShopID) REFERENCES Shops(ShopID)
);

-- MAINTENANCE RECORDS TABLE
-- Stores routine service information
CREATE TABLE MaintenanceRecords (
    MaintenanceID INT PRIMARY KEY IDENTITY,
    CarID INT,
    ServiceType VARCHAR(100),
    ServiceDate DATE,
    Cost DECIMAL(10,2),
    FOREIGN KEY (CarID) REFERENCES Cars(CarID)
);
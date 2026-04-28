USE CarModDB;
GO

-- PROCEDURE: AddCarMod
-- Inserts a new modification for a car
CREATE PROCEDURE AddCarMod
    @CarID INT,
    @ModID INT,
    @Cost DECIMAL(10,2)
AS
BEGIN
    INSERT INTO CarMods (CarID, ModID, InstallDate, Cost)
    VALUES (@CarID, @ModID, GETDATE(), @Cost);
END;
GO

-- PROCEDURE: GetCarMods
-- Retrieves all mods for a specific car
CREATE PROCEDURE GetCarMods
    @CarID INT
AS
BEGIN
    SELECT m.Name, cm.Cost, cm.InstallDate
    FROM CarMods cm
    JOIN Mods m ON cm.ModID = m.ModID
    WHERE cm.CarID = @CarID;
END;
GO

-- PROCEDURE: DeleteCarMod
-- Deletes a mod record from a car
CREATE PROCEDURE DeleteCarMod
    @CarModID INT
AS
BEGIN
    DELETE FROM CarMods WHERE CarModID = @CarModID;
END;
GO
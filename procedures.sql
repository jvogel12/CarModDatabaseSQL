USE CarModDB;
GO

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

CREATE PROCEDURE DeleteCarMod
    @CarModID INT
AS
BEGIN
    DELETE FROM CarMods WHERE CarModID = @CarModID;
END;
GO
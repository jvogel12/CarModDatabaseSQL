USE CarModDB;
GO

-- VIEW: CarModDetails
-- Shows cars with their installed mods and cost
CREATE VIEW CarModDetails AS
SELECT c.Make, c.Model, m.Name, cm.Cost
FROM Cars c
JOIN CarMods cm ON c.CarID = cm.CarID
JOIN Mods m ON cm.ModID = m.ModID;
GO

-- VIEW: MaintenanceSummary
-- Shows maintenance history for each car
CREATE VIEW MaintenanceSummary AS
SELECT c.Make, c.Model, mr.ServiceType, mr.Cost
FROM Cars c
JOIN MaintenanceRecords mr ON c.CarID = mr.CarID;
GO
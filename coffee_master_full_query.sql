USE coffee_data;
CREATE VIEW all_country_years AS
SELECT Country, Year FROM domestic_consumption
UNION
SELECT Country, Year FROM production
UNION
SELECT Country, Year FROM export_table
UNION
SELECT Country, Year FROM import_data
UNION
SELECT Country, Year FROM importers_consumption
UNION
SELECT Country, Year FROM green_inventory
UNION
SELECT Country, Year FROM re_export;

CREATE VIEW coffee_master_full AS
SELECT 
    a.Country,
    a.Year,
    d.`Coffee type` AS DomesticType,
    p.`Coffee type` AS ProductionType,
    d.DomesticConsumption,
    p.Production,
    e.Export,
    i.Import,
    ic.ImporterConsumption,
    g.GreenInventory,
    r.ReExport

FROM all_country_years a

-- Coffee-type-aware joins
LEFT JOIN domestic_consumption d 
    ON a.Country = d.Country AND a.Year = d.Year

LEFT JOIN production p 
    ON a.Country = p.Country AND a.Year = p.Year

-- Tables WITHOUT coffee type
LEFT JOIN export_table e 
    ON a.Country = e.Country AND a.Year = e.Year

LEFT JOIN import_data i 
    ON a.Country = i.Country AND a.Year = i.Year

LEFT JOIN importers_consumption ic 
    ON a.Country = ic.Country AND a.Year = ic.Year

LEFT JOIN green_inventory g 
    ON a.Country = g.Country AND a.Year = g.Year

LEFT JOIN re_export r 
    ON a.Country = r.Country AND a.Year = r.Year;

CREATE MATERIALIZED VIEW "MV_Monthly_Patients_By_Dept" AS
SELECT
    dd."Year",
    dd."Month",
    dd."MonthName",
    d."DepartmentName",
    COUNT(fv."VisitKey") AS TotalVisits
FROM
    "FactVisits" fv
JOIN
    "DimDate" dd ON fv."DateKey" = dd."DateKey"
JOIN
    "DimDepartment" d ON fv."DepartmentKey" = d."DepartmentKey"
GROUP BY
    dd."Year", 
    dd."Month",
    dd."MonthName",
    d."DepartmentName"
ORDER BY
    dd."Year", 
    dd."Month", 
    TotalVisits DESC;
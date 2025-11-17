CREATE MATERIALIZED VIEW "MV_Avg_Cost_By_Dept" AS
SELECT
    d."DepartmentName",
    AVG(fv."TreatmentCost") AS AverageTreatmentCost,
    SUM(fv."BillAmount") AS TotalBilledAmount
FROM
    "FactVisits" fv
JOIN
    "DimDepartment" d ON fv."DepartmentKey" = d."DepartmentKey"
GROUP BY
    1
ORDER BY
    AverageTreatmentCost DESC;
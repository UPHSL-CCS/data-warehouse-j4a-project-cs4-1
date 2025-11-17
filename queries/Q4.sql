CREATE MATERIALIZED VIEW "MV_Top_Doctors" AS
SELECT
    d."FullName" AS DoctorName,
    COUNT(fv."VisitKey") AS PatientCount
FROM
    "FactVisits" fv
JOIN
    "DimDoctor" d ON fv."DoctorKey" = d."DoctorKey"
GROUP BY
    1
ORDER BY
    PatientCount DESC
LIMIT 10;
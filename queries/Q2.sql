CREATE MATERIALIZED VIEW "MV_Common_Diagnoses" AS
SELECT
    fv."DiagnosisCategory",
    t."TreatmentType",
    COUNT(fv."VisitKey") AS CountOfVisits
FROM
    "FactVisits" fv
JOIN
    "DimTreatment" t ON fv."TreatmentKey" = t."TreatmentKey"
GROUP BY
    1, 2
ORDER BY
    CountOfVisits DESC
LIMIT 20;
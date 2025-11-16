CREATE INDEX idx_fact_date ON "FactVisits" ("DateKey");
CREATE INDEX idx_fact_doctor ON "FactVisits" ("DoctorKey");
CREATE INDEX idx_fact_department ON "FactVisits" ("DepartmentKey");
CREATE INDEX idx_fact_treatment ON "FactVisits" ("TreatmentKey");
CREATE INDEX idx_fact_patient ON "FactVisits" ("PatientKey");

-- Index on frequently filtered descriptive attributes (e.g., Doctor Specialization)
CREATE INDEX idx_dim_doctor_spec ON "DimDoctor" ("Specialization");
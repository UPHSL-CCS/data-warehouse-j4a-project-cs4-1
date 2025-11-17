CREATE TABLE "DimDate" (
	"DateKey" INT PRIMARY KEY,
	"FullDate" DATE NOT NULL,
	"YEAR" SMALLINT NOT NULL,
	"Quarter" SMALLINT NOT NULL,
	"MONTH" SMALLINT NOT NULL,
	"MonthName" VARCHAR(20),
	"Day" SMALLINT NOT NULL,
	"DayOfWeek"	SMALLINT,
	"DayName" VARCHAR(10),
	"WeekOfYear" SMALLINT,
	"IsWeekend" BOOLEAN
	);
	
CREATE TABLE "DimDoctor" (
    "DoctorKey" INT PRIMARY KEY,
    "DoctorID" VARCHAR(50) UNIQUE,
    "FullName" VARCHAR(100),
	"FirstName" VARCHAR(100),
	"LastName" VARCHAR(100),
    "Specialization" VARCHAR(50),
    "DepartmentID" INT,
	"PhoneNumber" INT,
    "YearsExperience" SMALLINT,
	"HospitalBranch" VARCHAR(100),
	"Email" VARCHAR(100)
);

CREATE TABLE "DimPatient" (
	"PatientKey" INT PRIMARY KEY,
	"PatientID" VARCHAR(50) UNIQUE,
    "FullName" VARCHAR(100),
	"FirstName" VARCHAR(100),
	"LastName" VARCHAR(100),
    "Gender" VARCHAR(10),
    "DateOfBirth" DATE,
    "Age" SMALLINT,
    "AgeGroup" VARCHAR(20),
	"City" VARCHAR(50),
	"Address" VARCHAR(50),
	"ContactNumber" INT,
	"Email" VARCHAR(100),
    "InsuranceProvider" VARCHAR(50),
	"InsuranceNumber" VARCHAR(50),
	"RegistrationDate" DATE NOT NULL
);

CREATE TABLE "DimDepartment" (
	"DepartmentID" INT UNIQUE,
	"DepartmentName" VARCHAR(50),
	"DepartmentKey" INT PRIMARY KEY
);

CREATE TABLE "DimTreatment" (
	"TreatmentKey" INT PRIMARY KEY,
	"TreatmentType" VARCHAR(50),
    "Description" VARCHAR(100),
    "AvgCost" NUMERIC(10, 2)
);
CREATE TABLE "FactVisits" (
	"VisitKey" INT PRIMARY KEY,
	"DateKey" INT NOT NULL REFERENCES "DimDate"("DateKey"),
	"PatientKey" INT NOT NULL REFERENCES "DimPatient"("PatientKey"),
    "DoctorKey" INT NOT NULL REFERENCES "DimDoctor"("DoctorKey"),
    "DepartmentKey" INT NOT NULL REFERENCES "DimDepartment"("DepartmentKey"),
	"TreatmentKey" INT NOT NULL REFERENCES "DimTreatment"("TreatmentKey"),
	"AppointmentID" VARCHAR(50),
    "VisitStatus" VARCHAR(50),
    "DiagnosisCategory" VARCHAR(50),
    "TreatmentCost" NUMERIC(10, 2),
    "BillAmount" NUMERIC(10, 2),
    "PaymentStatus" VARCHAR(50)
);

# 📊 Hospital Patient Services Data Warehouse  
### *CS4 Data Warehouse Optimization – Final Project*  

**Group Members:**  
- **Angela Cabanes** – Extraction & Transformation, Visualization  
- **Kelvin Adam Aninang** – Loading, Optimization  
- **Michaela Jornales** – Optimization, Visualization

* Canva Presentation: https://www.canva.com/design/DAG44OGRyy8/CxvuLZp6IpyYnRCZTdEGCA/edit
* PowerBI: https://app.powerbi.com/groups/me/reports/2f6961ec-6d62-4a58-8fdc-971b731f8403/d90934ca70b012367608?experience=power-bi

---

# 🎯 Project Objective

This project aims to **design and implement a complete data warehouse** using the Kimball approach, apply **optimization techniques**, and build **analytical dashboards** that answer key business questions about hospital patient services.

We were required to:

- Design a **data warehouse architecture** (source → integration → presentation)
- Implement **Fact and Dimension tables**
- Perform **ETL or ELT processes**
- Apply **optimization techniques** (indexing, materialized views, partitioning)
- Use **GitHub Classroom** for collaboration
- Connect the DW to a BI tool (Power BI)

---

# 🏥 Business Problem: Hospital Patient Services Analysis

A city hospital needs insights into:

- Hospital department performance  
- Patient visit patterns  
- Treatment costs  
- Doctor workload  

The goal is to support **resource allocation**, **trend analysis**, and **operational planning**.

---

# ❓ Business Questions Answered

1. **Which departments handle the most patients monthly?**
2. **What are the most common diagnoses or treatments?**
3. **What is the average service cost per department?**
4. **Which doctors attend to the most patients?**

---

# 🧰 Tools & Technologies Used

| Layer | Tools |
|------|-------|
| **Source Layer** | Kaggle Dataset (“Hospital Management Dataset”) + Custom `department.csv` |
| **Integration Layer** | Python (Pandas, Jupyter Notebook) |
| **Data Warehouse** | PostgreSQL (hosted via Supabase for BI connectivity) |
| **Optimization** | PostgreSQL Indexing, Materialized Views |
| **Presentation Layer** | Power BI |
| **Version Control** | GitHub Classroom |

---

# 🗂 Data Sources

### ✅ Extracted from Kaggle:
- `patients.csv`  
- `doctors.csv`  
- `appointments.csv`  
- `treatments.csv`  
- `billing.csv`

### ⚠ Missing Data (Solved)
The Kaggle dataset did **not** include a department file.  
We generated a custom:

- `department.csv` (10 hospital departments)

Doctors were mapped to departments based on specialization.

---

# 🔄 ETL Implementation

## **1. Extract (Angela)**  
- Manually downloaded data from Kaggle  
- Generated the missing `department.csv`  
- Stored raw data in `/data/raw`

> Manual extraction is still valid ETL since data came from an external source.

---

## **2. Transform (Angela)**  
Performed in **Python (Pandas)**:

- Cleaned null values  
- Normalized specializations → department mapping  
- Merged appointments + treatments + billing  
- Built surrogate keys  
- Generated the Star Schema tables  

### **Dimensions Created**
- `DimPatient`  
- `DimDoctor`  
- `DimDepartment`  
- `DimDate`  

### **Fact Table**
- `FactVisits`  
  - VisitID  
  - PatientID  
  - DoctorID  
  - DepartmentID  
  - DateKey  
  - DiagnosisCode  
  - ServiceCost  

Exported transformed tables as CSV for loading.

---

## **3. Load (Adam)**  
- Created PostgreSQL schema  
- Loaded all dimension and fact CSVs  
- Enforced **primary and foreign key** constraints  
- Hosted the database on **Supabase** so Power BI could connect securely

---

# ⚙️ Optimization (Adam & Michaela)

### **Implemented Techniques**

#### ✔ **Indexing**
Created indexes on:

- `FactVisits (DateKey)`
- `FactVisits (DepartmentID)`
- `FactVisits (DoctorID)`

Improved join performance significantly.

#### ✔ **Materialized Views**
Created MVs for repeated analytical queries:

- Monthly patients per department  
- Doctor visit frequency  
- Average service cost per department  

#### ✔ (Optional) Partitioning
Not required due to dataset size, but indexing + materialized views already improved performance.

---

# 📊 Visualization (Angela & Michaela)

Connected **Power BI → Supabase PostgreSQL**.

Dashboards included:

- KPIs (Total Visits, Total Cost, Patient Count)  
- Patients by Department (bar chart)  
- Monthly Visit Trends (line chart)  
- Doctor Performance (table / bar chart)  
- Treatment Types Distribution (pie chart)

---

# 🏗 Data Warehouse Architecture

### **Source Layer**  
Kaggle CSVs + Generated Department CSV

### **Integration Layer**  
Python (cleaning, joining, building schemas)

### **Presentation Layer**  
Power BI connected through Supabase PostgreSQL

---

# 📐 Kimball Star Schema

# 📊 Hospital Patient Services Data Warehouse  
### *CS4 Data Warehouse Optimization – Final Project*  

**Group Members:**  
- **Angela Cabanes** – Extraction & Transformation, Visualization  
- **Kelvin Adam Aninang** – Loading, Optimization  
- **Michaela Jornales** – Optimization, Visualization  

---

# 🎯 Project Objective

This project aims to **design and implement a complete data warehouse** using the Kimball approach, apply **optimization techniques**, and build **analytical dashboards** that answer key business questions about hospital patient services.

We were required to:

- Design a **data warehouse architecture** (source → integration → presentation)
- Implement **Fact and Dimension tables**
- Perform **ETL or ELT processes**
- Apply **optimization techniques** (indexing, materialized views, partitioning)
- Use **GitHub Classroom** for collaboration
- Connect the DW to a BI tool (Power BI)

---

# 🏥 Business Problem: Hospital Patient Services Analysis

A city hospital needs insights into:

- Hospital department performance  
- Patient visit patterns  
- Treatment costs  
- Doctor workload  

The goal is to support **resource allocation**, **trend analysis**, and **operational planning**.

---

# ❓ Business Questions Answered

1. **Which departments handle the most patients monthly?**
2. **What are the most common diagnoses or treatments?**
3. **What is the average service cost per department?**
4. **Which doctors attend to the most patients?**

---

# 🧰 Tools & Technologies Used

| Layer | Tools |
|------|-------|
| **Source Layer** | Kaggle Dataset (“Hospital Management Dataset”) + Custom `department.csv` |
| **Integration Layer** | Python (Pandas, Jupyter Notebook) |
| **Data Warehouse** | PostgreSQL (hosted via Supabase for BI connectivity) |
| **Optimization** | PostgreSQL Indexing, Materialized Views |
| **Presentation Layer** | Power BI |
| **Version Control** | GitHub Classroom |

---

# 🗂 Data Sources

### ✅ Extracted from Kaggle:
- `patients.csv`  
- `doctors.csv`  
- `appointments.csv`  
- `treatments.csv`  
- `billing.csv`

### ⚠ Missing Data (Solved)
The Kaggle dataset did **not** include a department file.  
We generated a custom:

- `department.csv` (10 hospital departments)

Doctors were mapped to departments based on specialization.

---

# 🔄 ETL Implementation

## **1. Extract (Angela)**  
- Manually downloaded data from Kaggle  
- Generated the missing `department.csv`  
- Stored raw data in `/data/raw`

> Manual extraction is still valid ETL since data came from an external source.

---

## **2. Transform (Angela)**  
Performed in **Python (Pandas)**:

- Cleaned null values  
- Normalized specializations → department mapping  
- Merged appointments + treatments + billing  
- Built surrogate keys  
- Generated the Star Schema tables  

### **Dimensions Created**
- `DimPatient`  
- `DimDoctor`  
- `DimDepartment`  
- `DimDate`  

### **Fact Table**
- `FactVisits`  
  - VisitID  
  - PatientID  
  - DoctorID  
  - DepartmentID  
  - DateKey  
  - DiagnosisCode  
  - ServiceCost  

Exported transformed tables as CSV for loading.

---

## **3. Load (Adam)**  
- Created PostgreSQL schema  
- Loaded all dimension and fact CSVs  
- Enforced **primary and foreign key** constraints  
- Hosted the database on **Supabase** so Power BI could connect securely

---

# ⚙️ Optimization (Adam & Michaela)

### **Implemented Techniques**

#### ✔ **Indexing**
Created indexes on:

- `FactVisits (DateKey)`
- `FactVisits (DepartmentID)`
- `FactVisits (DoctorID)`

Improved join performance significantly.

#### ✔ **Materialized Views**
Created MVs for repeated analytical queries:

- Monthly patients per department  
- Doctor visit frequency  
- Average service cost per department  

#### ✔ (Optional) Partitioning
Not required due to dataset size, but indexing + materialized views already improved performance.

---

# 📊 Visualization (Angela & Michaela)

Connected **Power BI → Supabase PostgreSQL**.

Dashboards included:

- KPIs (Total Visits, Total Cost, Patient Count)  
- Patients by Department (bar chart)  
- Monthly Visit Trends (line chart)  
- Doctor Performance (table / bar chart)  
- Treatment Types Distribution (pie chart)

---

# 🏗 Data Warehouse Architecture

### **Source Layer**  
Kaggle CSVs + Generated Department CSV

### **Integration Layer**  
Python (cleaning, joining, building schemas)

### **Presentation Layer**  
Power BI connected through Supabase PostgreSQL

---

# 📐 Kimball Star Schema
FactVisits
├── DimPatient
├── DimDoctor
├── DimDepartment
└── DimDate


This schema supports fast analytical queries and visualization.

---

# 🧩 Challenges Encountered & Resolutions

| Challenge | Resolution |
|----------|------------|
| Missing department data | Generated `department.csv` manually |
| PostgreSQL → Power BI connection issues | Used **Supabase**, which supports SSL |
| Kaggle API confusing | Switched to manual extraction (permitted by professor) |
| Small dataset | Cleaned and enriched data enough for analysis and optimization |

---

# ✔ Completed Implementation Summary

- Full ETL pipeline implemented  
- Star Schema successfully deployed  
- Optimization applied (indexing + MVs)  
- Power BI visualization completed  
- Supabase used for secure dashboard connection  
- GitHub Classroom used for collaboration  



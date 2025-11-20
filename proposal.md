# CS4 Data Warehouse Optimization Project: Feasibility Proposal

## Project Objective and Team

| Tool Category | Tool Name |
| :--- | :--- |
| Data Warehouse | PostgreSQL (Chosen Tool) |
| ETL/Loading | Python (Pandas/SQLAlchemy) |
| Visualization | Power BI / Tableau |
| Optimization Focus | Partitioning, Materialized Views, Clustering |
| Version Control | GitHub Classroom |

**Objective:** Implement and analyze data warehouse optimization techniques using PostgreSQL. We will apply partitioning, clustering, and materialized views to measure and demonstrate query performance improvements in a structured Star Schema environment.

**Team:** Angela Cabanes (Visualization, Data Cleaning), Michaela Jornales (Data Extraction), Kelvin Adam Aninang (Data Cleaning, Data Optimization)

---

## Phase 1: Requirements Analysis

The initial phase defines the **"Why"** and **"What"** of the project, focusing on the business need and the scope of the solution.

### Business Problem: Hospital Patient Services Analysis

A city hospital requires a robust data warehouse to analyze its operations, specifically focusing on **patient visits**, **service costs**, and **doctor performance**. This analysis is crucial for resource allocation and identifying health trends.

### Key Business Questions (Project Scope)

1. Which departments handle the most patients monthly?
2. What are the most common diagnoses or treatments?
3. What's the average service cost per department
4. Which doctors attend to the most patients?

### Technical Requirements

| Requirement Type | Description |
| :--- | :--- |
| **Data Model** | Star Schema (Fact and Dimension Tables). |
| **Optimization** | Must support advanced features: Partitioning and Materialized Views. |
| **Data Volume** | Generate sufficient mock data to demonstrate performance issues and gains (e.g., 5M+ fact rows). |

---

## Phase 2: Tool Selection and Feasibility

We evaluated two primary options against key criteria: **Cost**, **Scalability**, and **Security**.

### Tool Comparison: Local DW vs. Cloud DW

| Evaluation Criteria | PostgreSQL + Pentaho (Local/On-Prem) | BigQuery (Serverless Cloud DW) |
| :--- | :--- | :--- |
| **Cost** | **✅ Near Zero (Open Source)**: Only hardware/VM cost. | **❌ High/Variable**: Cost for storage and every query execution. |
| **Scalability** | **🟡 Good**: Scales vertically (requires more resources); limited by single-server power. | **✅ Excellent**: Scales horizontally on demand; virtually limitless. |
| **Security** | **🟡 Good**: Requires manual setup, firewall management, and patching. | **✅ Excellent**: Managed by Google; inherently secure by design. |
| **Optimization Focus** | **✅ Perfect**: Directly supports Partitioning, Clustering, and MVs (our project core). | **🟡 Restricted**: Has specific clustering/partitioning syntax; less direct control over physical storage. |

### Conclusion: Tool Selection

The **PostgreSQL/Python stack** is selected. While BigQuery offers superior scalability, PostgreSQL is the superior choice for a controlled academic project because it is **free**, **easy to deploy locally**, and most importantly, it gives us **direct control** over the database engine to implement and study the desired **optimization techniques** (Partitioning and Materialized Views) without incurring cloud costs.

---

## Phase 3: Architecture Selection

We compared the two leading architectural approaches for Data Warehousing.

### Architecture Comparison

| Feature | Top-Down (Inmon) | Bottom-Up (Kimball) |
| :--- | :--- | :--- |
| **Focus** | Normalize data first (3NF). | De-normalize data for simplicity (Star Schema). |
| **Speed/Agility** | **❌ Slow** to develop; complex joins required for queries. | **✅ Fast** to develop; fast, simple query design. |
| **Flexibility** | **✅ High**: Single source of truth (EDW) for many marts. | **🟡 Moderate**: Focused on specific business processes. |
| **Development** | **EDW -> Data Marts** | **Data Marts -> Optional EDW** |

### Conclusion: Architecture Selection

The **Bottom-up (Kimball) approach** is selected.

* **Rationale:** The Kimball Star Schema is the most **practical, agile, and query-efficient** model for answering our defined business questions. It directly supports our requirement for high-performance query analysis and simplifies the ETL and visualization processes.

---

## Phase 4: Deployment Strategy

The project will deploy the **Kimball Star Schema** using **PostgreSQL** and expose it for visualization.

### Chosen Architecture (Kimball Star Schema)

| Type | Name | Purpose |
| :--- | :--- | :--- |
| **Fact Table** | `FactVisits` | Stores measures (`ServiceCost`, `PatientCount`) and keys for dimensions. |
| **Dimension Tables** | `DimPatient`, `DimDoctor`, `DimDepartment`, `DimDate` | Stores descriptive attributes. |

### Deployment Steps

1. **DDL Execution:** Create the necessary tables (`DimDate`, `DimPatient`, etc.) in PostgreSQL.
2. **ETL Implementation:** Use **Python (Pandas/SQLAlchemy)** to extract, transform, and load data into PostgreSQL.
3. **Visualization Integration:** **Connect Power BI / Tableau** to the PostgreSQL server. This is where **Angela Cabanes (Visualization)** will create dashboards that drive the analytical queries.
4. **Baseline Querying:** Establish initial query execution times from the BI tool to serve as the **un-optimized benchmark**.

---

## Phase 5: Maintenance and Optimization

This is the core execution phase where we focus on improving performance and collaboration.

### Optimization Techniques (PostgreSQL Focus)

We will implement and measure the impact of the following techniques on the `FactVisits` table and aggregate queries:

1. **Partitioning (by Date):** Break the massive `FactVisits` table into smaller, manageable tables based on `DateKey` (e.g., by month or year). This significantly speeds up time-series queries.
2. **Materialized Views (MVs):** Pre-calculate complex aggregates (like "Monthly Patient Volume by Department") and store the results in a dedicated MV. This provides immediate access to frequently requested summary data.
3. **Clustering/Indexing:** Optimize data storage order using PostgreSQL indexing features (like **Cluster/Reindex**) to physically order the fact table based on frequently joined keys, improving read performance.

### Version Control and Collaboration

**GitHub Classroom** will be used for collaborative code management:

* All DDL, Python ETL scripts, and analysis results will be version-controlled.
* This ensures traceability, conflict resolution, and clear visibility into each team member's contributions throughout the project.

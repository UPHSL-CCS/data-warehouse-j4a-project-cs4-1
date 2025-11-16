import pandas as pd
from sqlalchemy import create_engine

db_url = f'postgresql+psycopg2://postgre:SlungusMan@localhost:5432/Hospital'
csv_file = {
    'DimDate': 'transformed_data/DimDate.csv',
    'DimDepartment': 'transformed_data/DimDepartment.csv',
    'DimDoctor': 'transformed_data/DimDoctor.csv',
    'DimPatient': 'transformed_data/DimPatient.csv',
    'DimTreatment': 'transformed_data/DimTreatment.csv',
    'FactVisits': 'transformed_data/FactVisits.csv'
}

# Define the order of loading to respect foreign key dependencies
load_order = ['dim_date', 'dim_department', 'dim_doctor', 'dim_patient', 'dim_treatment', 'fact_visits']

# Database connection
def load_data_to_db():

    # Create database engine
    engine = create_engine(DB_URL)

    for table_name in load_order:
        file_name = csv_file[table_name]

        df = pd.read_csv(file_name)

    if table_name == 'DimDate':
        df['FullDate'] = pd.to_datetime(df['FullDate'])
    if table_name == 'DimPatient':
        df['DateOfBirth'] = pd.to_datetime(df['DateOfBirth'])
        df['RegistrationDate'] = pd.to_datetime(df['RegistrationDate'])

    df.to_sql(table_name, engine, if_exists='replace', index=False, chunksize=1000)

if __name__ == '__main__':
    load_data_to_db()
from airflow import DAG
from airflow.operators.empty import EmptyOperator
from pendulum import datetime
import os

from cosmos import DbtTaskGroup, ProfileConfig, ProjectConfig , ExecutionConfig
from cosmos.profiles import GoogleCloudServiceAccountFileProfileMapping


CONN_BIG_QUERY = "CONN_BIG_QUERY"

profile_config = ProfileConfig(
    
    profile_name = "project_dbt",
    target_name="dev",
    profile_mapping=GoogleCloudServiceAccountFileProfileMapping(        
        conn_id="CONN_BIG_QUERY",       
        profile_args={
            "project": "project-dbt-410613",
            "dataset": "dbt_gustavo"       
        },    
    )
)

with DAG(
    dag_id="data_pipeline",
    start_date=datetime(2022, 11, 27),
    schedule=None,
    catchup=False,
) as dag:    

    Start = EmptyOperator(task_id="Start")

    data_pipeline = DbtTaskGroup(

        group_id="data_pipeline",       
        project_config=ProjectConfig("/usr/local/airflow/dags/dbt/project_dbt/"),
        profile_config=profile_config,
        execution_config=ExecutionConfig(
            dbt_executable_path=f"{os.environ['AIRFLOW_HOME']}/dbt_venv/bin/dbt"
        )

    )    

    End = EmptyOperator(task_id="End")

    Start >> data_pipeline >> End

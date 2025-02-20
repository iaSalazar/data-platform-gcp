from datetime import datetime

from airflow import DAG
from airflow.operators.dummy import DummyOperator

# Default arguments
default_args = {
    'owner': 'airflow',
    'start_date': datetime(2024, 2, 18),  # Past date to allow immediate execution
    'retries': 1,
}

# Define DAG
with DAG(
    dag_id='complex_dummy_dag',
    default_args=default_args,
    schedule_interval=None,  # Manual execution
    catchup=False,
    tags=['test', 'dummy'],
) as dag:

    # Start & End Dummy Tasks
    start = DummyOperator(task_id='start')
    end = DummyOperator(task_id='end')

    # Parallel Branches
    branch_1_task_1 = DummyOperator(task_id='branch_1_task_1')
    branch_1_task_2 = DummyOperator(task_id='branch_1_task_2')

    branch_2_task_1 = DummyOperator(task_id='branch_2_task_1')
    branch_2_task_2 = DummyOperator(task_id='branch_2_task_2')

    branch_3_task_1 = DummyOperator(task_id='branch_3_task_1')
    branch_3_task_2 = DummyOperator(task_id='branch_3_task_2')

    # Merging Task
    merge = DummyOperator(task_id='merge')

    # Define Dependencies
    start >> [branch_1_task_1, branch_2_task_1, branch_3_task_1]  # Parallel execution

    branch_1_task_1 >> branch_1_task_2 >> merge
    branch_2_task_1 >> branch_2_task_2 >> merge
    branch_3_task_1 >> branch_3_task_2 >> merge

    merge >> end  # Final execution step

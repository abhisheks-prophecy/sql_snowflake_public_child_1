def DBT_0():
    settings = {}
    from datetime import timedelta
    from airflow.operators.bash import BashOperator
    envs = {}
    envs["DBT_PROFILES_DIR"] = "/usr/local/airflow/dags"
    envs["DBT_FULL_REFRESH"] = "true"

    return BashOperator(
        task_id = "DBT_0",
        bash_command = "set -euxo pipefail; tmpDir=`mktemp -d`; git clone https://github.com/abhisheks-prophecy/sql_snowflake_public_child_1 --branch dev --single-branch $tmpDir; cd $tmpDir/; dbt deps --profile run_profile_snowflake; dbt seed --profile run_profile_snowflake; dbt run --profile run_profile_snowflake; ",
        env = envs,
        append_env = True,
        **settings
    )

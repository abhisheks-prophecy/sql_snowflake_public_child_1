WITH ALL_TYPE_TABLE_SMALLER AS (

  SELECT * 
  
  FROM {{ source('QA_DATABASE.QA_SIMPLE_SCHEMA', 'ALL_TYPE_TABLE_SMALLER') }}

),

qa_database_qa_simple_schema_ungrouped_customers AS (

  SELECT * 
  
  FROM qa_database.qa_simple_schema.ungrouped_customers

),

Reformat_1 AS (

  SELECT * 
  
  FROM ALL_TYPE_TABLE_SMALLER AS in0

),

raw_customers AS (

  SELECT * 
  
  FROM {{ ref('raw_customers')}}

),

Join_1 AS (

  SELECT 
    in1.C_NUM AS C_NUM,
    in1.C_NUM10 AS C_NUM10,
    in1.C_DEC AS C_DEC,
    in1.C_NUMERIC AS C_NUMERIC,
    in1.C_INT AS C_INT,
    in1.C_INTEGER AS C_INTEGER,
    in1.C_DOUBLE AS C_DOUBLE,
    in1.C_FLOAT AS C_FLOAT,
    in1.C_COUBLE_PRECISION AS C_COUBLE_PRECISION,
    in1.C_REAL AS C_REAL,
    in1.C_VARCHAR AS C_VARCHAR,
    in1.C_VARCHAR50 AS C_VARCHAR50,
    in1.C_CHAR AS C_CHAR,
    in1.C_CHAR10 AS C_CHAR10,
    in1.C_STRING AS C_STRING,
    in1.C_STRING20 AS C_STRING20,
    in1.C_TEXT AS C_TEXT,
    in1.C_TEXT30 AS C_TEXT30,
    in1.C_BINARY AS C_BINARY,
    in1.C_BINARY100 AS C_BINARY100,
    in1.C_VARBINARY AS C_VARBINARY,
    in1.C_BOOL AS C_BOOL,
    in1.C_TIMESTAMP AS C_TIMESTAMP,
    in1.C_DATE AS C_DATE,
    in1.C_DATETIME AS C_DATETIME,
    in1.C_TIME AS C_TIME,
    in1.C_ARRAY AS C_ARRAY,
    in1.C_OBJECT AS C_OBJECT,
    in1.C_GEOGRAPHY AS C_GEOGRAPHY
  
  FROM raw_customers AS in0
  RIGHT JOIN Reformat_1 AS in1
     ON in0.first_name != in1.C_STRING
  LEFT JOIN qa_database_qa_simple_schema_ungrouped_customers AS in2
     ON in1.C_STRING != in2.first_name

)

SELECT *

FROM Join_1

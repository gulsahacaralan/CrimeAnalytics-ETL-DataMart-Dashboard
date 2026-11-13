DROP TABLE IF EXISTS TRANSFORM_LOCATION;

CREATE TABLE TRANSFORM_LOCATION (
    region_key BIGINT PRIMARY KEY,
    region_id BIGINT ,
    region_name STRING,
    area STRING,
    city STRING,
    source_system STRING
);

-- TODO(migration): rewrite in PySpark: Oracle sequences are not supported in Spark SQL; generate keys with row_number()/monotonically_increasing_id() or Delta IDENTITY
-- CREATE SEQUENCE TRANSFORM_LOCATION_SEQ
--     INCREMENT BY 1
--     START WITH 1
--     CACHE 20
--     NOORDER
--     NOCYCLE;


-- TODO(migration): rewrite in PySpark: row-level trigger with sequence surrogate key assignment cannot be expressed in Spark SQL; use Delta IDENTITY or row_number()
-- CREATE OR REPLACE TRIGGER TRANSFORM_LOCATION_TRIGGER
--     BEFORE INSERT ON TRANSFORM_LOCATION
--     FOR EACH ROW
-- BEGIN
--     :NEW.region_key := TRANSFORM_LOCATION_SEQ.NEXTVAL;  
-- END;
/


-- TODO(migration): rewrite in PySpark: PL/SQL procedure with MERGE and trigger-generated surrogate keys must be rewritten as PySpark logic
-- CREATE OR REPLACE PROCEDURE PR_TRANS_LOCATION
-- AS
-- BEGIN
--     MERGE INTO TRANSFORM_LOCATION T
--     USING GOOD_BAD_DATA G
--     ON (T.region_id = G.REGION_ID)
--     WHEN MATCHED THEN
--         UPDATE SET 
--             T.region_name = G.REGION_NAME,
--             T.area = G.CRIME_LOCATION,
--             T.city = G.STATION_NAME,
--             T.source_system = G.SOURCE_SYSTEM
--     WHEN NOT MATCHED THEN
--         INSERT (region_id, region_name, area, city, source_system)
--         VALUES 
--             (
--              G.REGION_ID, 
--              G.REGION_NAME, 
--              G.CRIME_LOCATION, 
--              G.STATION_NAME, 
--              G.SOURCE_SYSTEM);
-- END;
/



DROP TABLE IF EXISTS TRANSFORM_TIME;
CREATE TABLE TRANSFORM_TIME (
    date_id BIGINT PRIMARY KEY, 
    crime_id BIGINT,
    full_date DATE,
    year BIGINT,
    month BIGINT,
    day BIGINT,
    quarter BIGINT,
    date_type STRING
);

-- TODO(migration): rewrite in PySpark: Oracle sequences are not supported in Spark SQL; generate keys with row_number()/monotonically_increasing_id() or Delta IDENTITY
-- CREATE SEQUENCE TRANSFORM_TIME_SEQ
--     INCREMENT BY 1
--     START WITH 1
--     CACHE 20
--     NOORDER
--     NOCYCLE;


-- TODO(migration): rewrite in PySpark: row-level trigger with sequence surrogate key assignment cannot be expressed in Spark SQL; use Delta IDENTITY or row_number()
-- CREATE OR REPLACE TRIGGER TRANSFORM_TIME_TRIGGER
--     BEFORE INSERT ON TRANSFORM_TIME
--     FOR EACH ROW
-- BEGIN
--     :NEW.date_id := TRANSFORM_TIME_SEQ.NEXTVAL;  
-- END;
/


-- TODO(migration): rewrite in PySpark: PL/SQL procedure with MERGE and trigger-generated surrogate keys must be rewritten as PySpark logic
-- CREATE OR REPLACE PROCEDURE PR_TRANS_TIME
-- AS
-- BEGIN
--     MERGE INTO TRANSFORM_TIME T
--     USING GOOD_BAD_DATA G
--     ON (T.crime_id = G.CRIME_ID AND T.full_date = G.REPORT_DATE AND T.date_type = 'Reported')
--     WHEN MATCHED THEN
--         UPDATE SET 
--             T.year = EXTRACT(YEAR FROM G.REPORT_DATE),
--             T.month = EXTRACT(MONTH FROM G.REPORT_DATE),
--             T.day = EXTRACT(DAY FROM G.REPORT_DATE),
--             T.quarter = CASE 
--                            WHEN EXTRACT(MONTH FROM G.REPORT_DATE) IN (1, 2, 3) THEN 1
--                            WHEN EXTRACT(MONTH FROM G.REPORT_DATE) IN (4, 5, 6) THEN 2
--                            WHEN EXTRACT(MONTH FROM G.REPORT_DATE) IN (7, 8, 9) THEN 3
--                            ELSE 4
--                        END
--     WHEN NOT MATCHED THEN
--         INSERT (crime_id, full_date, year, month, day, quarter, date_type)
--         VALUES 
--             (G.CRIME_ID, G.REPORT_DATE, 
--              EXTRACT(YEAR FROM G.REPORT_DATE),
--              EXTRACT(MONTH FROM G.REPORT_DATE),
--              EXTRACT(DAY FROM G.REPORT_DATE),
--              CASE 
--                 WHEN EXTRACT(MONTH FROM G.REPORT_DATE) IN (1, 2, 3) THEN 1
--                 WHEN EXTRACT(MONTH FROM G.REPORT_DATE) IN (4, 5, 6) THEN 2
--                 WHEN EXTRACT(MONTH FROM G.REPORT_DATE) IN (7, 8, 9) THEN 3
--                 ELSE 4
--               END,
--              'Reported');
--
--     MERGE INTO TRANSFORM_TIME T
--     USING GOOD_BAD_DATA G
--     ON (T.crime_id = G.CRIME_ID AND T.full_date = G.CLOSE_DATE AND T.date_type = 'Closed')
--     WHEN MATCHED THEN
--         UPDATE SET 
--             T.year = EXTRACT(YEAR FROM G.CLOSE_DATE),
--             T.month = EXTRACT(MONTH FROM G.CLOSE_DATE),
--             T.day = EXTRACT(DAY FROM G.CLOSE_DATE),
--             T.quarter = CASE 
--                            WHEN EXTRACT(MONTH FROM G.CLOSE_DATE) IN (1, 2, 3) THEN 1
--                            WHEN EXTRACT(MONTH FROM G.CLOSE_DATE) IN (4, 5, 6) THEN 2
--                            WHEN EXTRACT(MONTH FROM G.CLOSE_DATE) IN (7, 8, 9) THEN 3
--                            ELSE 4
--                        END
--     WHEN NOT MATCHED THEN
--         INSERT (crime_id, full_date, year, month, day, quarter, date_type)
--         VALUES 
--             (G.CRIME_ID, G.CLOSE_DATE, 
--              EXTRACT(YEAR FROM G.CLOSE_DATE),
--              EXTRACT(MONTH FROM G.CLOSE_DATE),
--              EXTRACT(DAY FROM G.CLOSE_DATE),
--              CASE 
--                 WHEN EXTRACT(MONTH FROM G.CLOSE_DATE) IN (1, 2, 3) THEN 1
--                 WHEN EXTRACT(MONTH FROM G.CLOSE_DATE) IN (4, 5, 6) THEN 2
--                 WHEN EXTRACT(MONTH FROM G.CLOSE_DATE) IN (7, 8, 9) THEN 3
--                 ELSE 4
--               END,
--              'Closed');
-- END;
/



DROP TABLE IF EXISTS TRANSFORM_CRIME_TYPE;

CREATE TABLE TRANSFORM_CRIME_TYPE (
    crime_type_key BIGINT PRIMARY KEY,
    crime_id BIGINT ,
    crime_type STRING,
    region_id STRING,
    crime_category STRING,
    severity_level STRING,
    source_system STRING
);

-- TODO(migration): rewrite in PySpark: Oracle sequences are not supported in Spark SQL; generate keys with row_number()/monotonically_increasing_id() or Delta IDENTITY
-- CREATE SEQUENCE TRANSFORM_CRIME_TYPE_SEQ
--     INCREMENT BY 1
--     START WITH 1
--     CACHE 20
--     NOORDER
--     NOCYCLE;


-- TODO(migration): rewrite in PySpark: row-level trigger with sequence surrogate key assignment cannot be expressed in Spark SQL; use Delta IDENTITY or row_number()
-- CREATE OR REPLACE TRIGGER TRANSFORM_CRIME_TYPE_TRIGGER
--     BEFORE INSERT ON TRANSFORM_CRIME_TYPE
--     FOR EACH ROW
-- BEGIN
--     :NEW.crime_type_key := TRANSFORM_CRIME_TYPE_SEQ.NEXTVAL;  
-- END;
/


-- TODO(migration): rewrite in PySpark: PL/SQL procedure with MERGE and trigger-generated surrogate keys must be rewritten as PySpark logic
-- CREATE OR REPLACE PROCEDURE PR_TRANS_CRIME_TYPE
-- AS
-- BEGIN
--     MERGE INTO TRANSFORM_CRIME_TYPE T
--     USING GOOD_BAD_DATA G
--     ON (T.crime_id = G.CRIME_ID)
--     WHEN MATCHED THEN
--         UPDATE SET 
--             T.crime_type = G.CRIME_TYPE,
--             T.region_id = G.region_id,
--             T.crime_category = NULL,  
--             T.severity_level = G.CRIME_SEVERITY,
--             T.source_system = G.SOURCE_SYSTEM
--     WHEN NOT MATCHED THEN
--         INSERT (crime_id, crime_type, region_id, crime_category, severity_level, source_system)
--         VALUES 
--             (G.CRIME_ID, G.CRIME_TYPE, G.region_id, NULL, G.CRIME_SEVERITY, G.SOURCE_SYSTEM);
-- END;
/


DROP TABLE IF EXISTS TRANSFORM_POLICE_STATION;

CREATE TABLE TRANSFORM_POLICE_STATION (
    station_key BIGINT PRIMARY KEY,
    station_id BIGINT ,
    station_name STRING,
    region_id BIGINT,
    source_system STRING
);

-- TODO(migration): rewrite in PySpark: Oracle sequences are not supported in Spark SQL; generate keys with row_number()/monotonically_increasing_id() or Delta IDENTITY
-- CREATE SEQUENCE TRANSFORM_POLICE_STATION_SEQ
--     INCREMENT BY 1
--     START WITH 1
--     CACHE 20
--     NOORDER
--     NOCYCLE;


-- TODO(migration): rewrite in PySpark: row-level trigger with sequence surrogate key assignment cannot be expressed in Spark SQL; use Delta IDENTITY or row_number()
-- CREATE OR REPLACE TRIGGER TRANSFORM_POLICE_STATION_TRIGGER
--     BEFORE INSERT ON TRANSFORM_POLICE_STATION
--     FOR EACH ROW
-- BEGIN
--     :NEW.station_key := TRANSFORM_POLICE_STATION_SEQ.NEXTVAL;  
-- END;
/


-- TODO(migration): rewrite in PySpark: PL/SQL procedure with MERGE and trigger-generated surrogate keys must be rewritten as PySpark logic
-- CREATE OR REPLACE PROCEDURE PR_TRANS_POLICE_STATION
-- AS
-- BEGIN
--     MERGE INTO TRANSFORM_POLICE_STATION T
--     USING GOOD_BAD_DATA G
--     ON (T.station_id = G.STATION_ID)
--     WHEN MATCHED THEN
--         UPDATE SET 
--             T.station_name = G.STATION_NAME,
--             T.region_id = G.REGION_ID,
--             T.source_system = G.SOURCE_SYSTEM
--     WHEN NOT MATCHED THEN
--         INSERT (station_id, station_name, region_id, source_system)
--         VALUES 
--             (G.STATION_ID, G.STATION_NAME, G.REGION_ID, G.SOURCE_SYSTEM);
-- END;
/


DROP TABLE IF EXISTS TRANSFORM_CRIME_STATUS;

CREATE TABLE TRANSFORM_CRIME_STATUS (
    crime_status_key BIGINT PRIMARY KEY,
    crime_status_id BIGINT,
    crime_status STRING,
    source_system STRING
);

-- TODO(migration): rewrite in PySpark: Oracle sequences are not supported in Spark SQL; generate keys with row_number()/monotonically_increasing_id() or Delta IDENTITY
-- CREATE SEQUENCE TRANSFORM_CRIME_STATUS_SEQ
--     INCREMENT BY 1
--     START WITH 1
--     CACHE 20
--     NOORDER
--     NOCYCLE;


-- TODO(migration): rewrite in PySpark: row-level trigger with sequence surrogate key assignment cannot be expressed in Spark SQL; use Delta IDENTITY or row_number()
-- CREATE OR REPLACE TRIGGER TRANSFORM_CRIME_STATUS_TRIGGER
--     BEFORE INSERT ON TRANSFORM_CRIME_STATUS
--     FOR EACH ROW
-- BEGIN
--     :NEW.crime_status_key := TRANSFORM_CRIME_STATUS_SEQ.NEXTVAL;  
-- END;
/


-- TODO(migration): rewrite in PySpark: PL/SQL procedure with MERGE and trigger-generated surrogate keys must be rewritten as PySpark logic
-- CREATE OR REPLACE PROCEDURE PR_TRANS_CRIME_STATUS
-- AS
-- BEGIN
--     MERGE INTO TRANSFORM_CRIME_STATUS T
--     USING GOOD_BAD_DATA G
--     ON (T.crime_status_id = G.CRIME_ID)
--     WHEN MATCHED THEN
--         UPDATE SET 
--             T.crime_status = G.CRIME_STATUS,
--             T.source_system = G.SOURCE_SYSTEM
--     WHEN NOT MATCHED THEN
--         INSERT (crime_status_id, crime_status, source_system)
--         VALUES 
--             (G.CRIME_ID, G.CRIME_STATUS, G.SOURCE_SYSTEM);
-- END;
/


-- TODO(migration): rewrite in PySpark: anonymous PL/SQL block calling procedures cannot be expressed in Spark SQL; orchestrate with a PySpark job/workflow
-- BEGIN
--     PR_TRANS_LOCATION;
--     PR_TRANS_TIME;
--     PR_TRANS_CRIME_TYPE;
--     PR_TRANS_POLICE_STATION;
--     PR_TRANS_CRIME_STATUS;
-- END;
/


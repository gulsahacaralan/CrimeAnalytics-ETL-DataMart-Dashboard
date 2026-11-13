-- TODO(migration): rewrite in PySpark: row-level BEFORE INSERT trigger is procedural PL/SQL; surrogate key generation must use row_number()/monotonically_increasing_id() or a Delta IDENTITY column instead of the Oracle sequence
CREATE OR REPLACE TRIGGER "STAGING_CRIME_TRIGGER"
    BEFORE INSERT ON STAGING_CRIME_DATA
    FOR EACH ROW
-- TODO(migration): rewrite in PySpark: procedural trigger body (BEGIN/END block with :NEW bind variables) cannot be expressed in Spark SQL
BEGIN
    :NEW.STAGING_CRIME_ID := row_number() OVER (ORDER BY 1); -- Spark surrogate key equivalent of STAGING_CRIME_SEQ
END;

-- TODO(migration): rewrite in PySpark: row-level BEFORE INSERT trigger is procedural PL/SQL; surrogate key generation must use row_number()/monotonically_increasing_id() or a Delta IDENTITY column instead of the Oracle sequence
CREATE OR REPLACE TRIGGER "GB_ID_TRIGGER"
    BEFORE INSERT ON GOOD_BAD_DATA
    FOR EACH ROW
-- TODO(migration): rewrite in PySpark: procedural trigger body (BEGIN/END block with :NEW bind variables) cannot be expressed in Spark SQL
BEGIN
    :NEW.GB_ID := row_number() OVER (ORDER BY 1); -- Spark surrogate key equivalent of GB_ID_SEQ
END;

-- TODO(migration): rewrite in PySpark: row-level BEFORE INSERT trigger is procedural PL/SQL; surrogate key generation must use row_number()/monotonically_increasing_id() or a Delta IDENTITY column instead of the Oracle sequence
CREATE OR REPLACE TRIGGER TRANSFORM_LOCATION_TRIGGER
    BEFORE INSERT ON TRANSFORM_LOCATION
    FOR EACH ROW
-- TODO(migration): rewrite in PySpark: procedural trigger body (BEGIN/END block with :NEW bind variables) cannot be expressed in Spark SQL
BEGIN
    :NEW.region_key := row_number() OVER (ORDER BY 1); -- Spark surrogate key equivalent of TRANSFORM_LOCATION_SEQ
END;

-- TODO(migration): rewrite in PySpark: row-level BEFORE INSERT trigger is procedural PL/SQL; surrogate key generation must use row_number()/monotonically_increasing_id() or a Delta IDENTITY column instead of the Oracle sequence
CREATE OR REPLACE TRIGGER TRANSFORM_TIME_TRIGGER
    BEFORE INSERT ON TRANSFORM_TIME
    FOR EACH ROW
-- TODO(migration): rewrite in PySpark: procedural trigger body (BEGIN/END block with :NEW bind variables) cannot be expressed in Spark SQL
BEGIN
    :NEW.date_id := row_number() OVER (ORDER BY 1); -- Spark surrogate key equivalent of TRANSFORM_TIME_SEQ
END;

-- TODO(migration): rewrite in PySpark: row-level BEFORE INSERT trigger is procedural PL/SQL; surrogate key generation must use row_number()/monotonically_increasing_id() or a Delta IDENTITY column instead of the Oracle sequence
CREATE OR REPLACE TRIGGER TRANSFORM_CRIME_TYPE_TRIGGER
    BEFORE INSERT ON TRANSFORM_CRIME_TYPE
    FOR EACH ROW
-- TODO(migration): rewrite in PySpark: procedural trigger body (BEGIN/END block with :NEW bind variables) cannot be expressed in Spark SQL
BEGIN
    :NEW.crime_type_key := row_number() OVER (ORDER BY 1); -- Spark surrogate key equivalent of TRANSFORM_CRIME_TYPE_SEQ
END;

-- TODO(migration): rewrite in PySpark: row-level BEFORE INSERT trigger is procedural PL/SQL; surrogate key generation must use row_number()/monotonically_increasing_id() or a Delta IDENTITY column instead of the Oracle sequence
CREATE OR REPLACE TRIGGER TRANSFORM_POLICE_STATION_TRIGGER
    BEFORE INSERT ON TRANSFORM_POLICE_STATION
    FOR EACH ROW
-- TODO(migration): rewrite in PySpark: procedural trigger body (BEGIN/END block with :NEW bind variables) cannot be expressed in Spark SQL
BEGIN
    :NEW.station_key := row_number() OVER (ORDER BY 1); -- Spark surrogate key equivalent of TRANSFORM_POLICE_STATION_SEQ
END;

-- TODO(migration): rewrite in PySpark: row-level BEFORE INSERT trigger is procedural PL/SQL; surrogate key generation must use row_number()/monotonically_increasing_id() or a Delta IDENTITY column instead of the Oracle sequence
CREATE OR REPLACE TRIGGER TRANSFORM_CRIME_STATUS_TRIGGER
    BEFORE INSERT ON TRANSFORM_CRIME_STATUS
    FOR EACH ROW
-- TODO(migration): rewrite in PySpark: procedural trigger body (BEGIN/END block with :NEW bind variables) cannot be expressed in Spark SQL
BEGIN
    :NEW.crime_status_key := row_number() OVER (ORDER BY 1); -- Spark surrogate key equivalent of TRANSFORM_CRIME_STATUS_SEQ
END;

-- TODO(migration): rewrite in PySpark: row-level BEFORE INSERT trigger is procedural PL/SQL; surrogate key generation must use row_number()/monotonically_increasing_id() or a Delta IDENTITY column instead of the Oracle sequence
CREATE OR REPLACE TRIGGER DIM_LOCATION_TRIGGER
    BEFORE INSERT ON DIM_LOCATION
    FOR EACH ROW
-- TODO(migration): rewrite in PySpark: procedural trigger body (BEGIN/END block with :NEW bind variables) cannot be expressed in Spark SQL
BEGIN
    :NEW.region_key := row_number() OVER (ORDER BY 1); -- Spark surrogate key equivalent of DIM_LOCATION_SEQ
END;

-- TODO(migration): rewrite in PySpark: row-level BEFORE INSERT trigger is procedural PL/SQL; surrogate key generation must use row_number()/monotonically_increasing_id() or a Delta IDENTITY column instead of the Oracle sequence
CREATE OR REPLACE TRIGGER DIM_TIME_TRIGGER
    BEFORE INSERT ON DIM_TIME
    FOR EACH ROW
-- TODO(migration): rewrite in PySpark: procedural trigger body (BEGIN/END block with :NEW bind variables) cannot be expressed in Spark SQL
BEGIN
    :NEW.time_key := row_number() OVER (ORDER BY 1); -- Spark surrogate key equivalent of DIM_TIME_SEQ
END;

-- TODO(migration): rewrite in PySpark: row-level BEFORE INSERT trigger is procedural PL/SQL; surrogate key generation must use row_number()/monotonically_increasing_id() or a Delta IDENTITY column instead of the Oracle sequence
CREATE OR REPLACE TRIGGER DIM_CRIME_STATUS_TRIGGER
    BEFORE INSERT ON DIM_CRIME_STATUS

    FOR EACH ROW
-- TODO(migration): rewrite in PySpark: procedural trigger body (BEGIN/END block with :NEW bind variables) cannot be expressed in Spark SQL
BEGIN
    :NEW.CRIME_STATUS_KEY := row_number() OVER (ORDER BY 1); -- Spark surrogate key equivalent of DIM_CRIME_STATUS_SEQ
END;

-- TODO(migration): rewrite in PySpark: row-level BEFORE INSERT trigger is procedural PL/SQL; surrogate key generation must use row_number()/monotonically_increasing_id() or a Delta IDENTITY column instead of the Oracle sequence
CREATE OR REPLACE TRIGGER DIM_CRIME_TYPE_TRIGGER
    BEFORE INSERT ON DIM_CRIME_TYPE
    FOR EACH ROW
-- TODO(migration): rewrite in PySpark: procedural trigger body (BEGIN/END block with :NEW bind variables) cannot be expressed in Spark SQL
BEGIN
    :NEW.crime_type_key := row_number() OVER (ORDER BY 1); -- Spark surrogate key equivalent of DIM_CRIME_TYPE_SEQ
END;

-- TODO(migration): rewrite in PySpark: row-level BEFORE INSERT trigger is procedural PL/SQL; surrogate key generation must use row_number()/monotonically_increasing_id() or a Delta IDENTITY column instead of the Oracle sequence
CREATE OR REPLACE TRIGGER DIM_POLICE_STATION_TRIGGER
    BEFORE INSERT ON DIM_POLICE_STATION
    FOR EACH ROW
-- TODO(migration): rewrite in PySpark: procedural trigger body (BEGIN/END block with :NEW bind variables) cannot be expressed in Spark SQL
BEGIN
    :NEW.police_station_key := row_number() OVER (ORDER BY 1); -- Spark surrogate key equivalent of DIM_POLICE_STATION_SEQ
END;

-- TODO(migration): rewrite in PySpark: row-level BEFORE INSERT trigger is procedural PL/SQL; surrogate key generation must use row_number()/monotonically_increasing_id() or a Delta IDENTITY column instead of the Oracle sequence
CREATE OR REPLACE TRIGGER FACT_CRIME_TRIGGER
    BEFORE INSERT ON FACT_CRIME
    FOR EACH ROW
-- TODO(migration): rewrite in PySpark: procedural trigger body (BEGIN/END block with :NEW bind variables) cannot be expressed in Spark SQL
BEGIN
    :NEW.FACT_CRIME_KEY := row_number() OVER (ORDER BY 1); -- Spark surrogate key equivalent of FACT_CRIME_SEQ
END;

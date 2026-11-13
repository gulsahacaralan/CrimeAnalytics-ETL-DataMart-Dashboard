-- TODO(migration): rewrite in PySpark: Oracle BEFORE INSERT triggers are procedural PL/SQL and cannot be expressed in Spark SQL; implement surrogate key generation (monotonically_increasing_id()/row_number() or Delta IDENTITY columns) in the PySpark ingestion jobs.
CREATE OR REPLACE TRIGGER "STAGING_CRIME_TRIGGER"
    BEFORE INSERT ON STAGING_CRIME_DATA
    FOR EACH ROW
BEGIN
    :NEW.STAGING_CRIME_ID := monotonically_increasing_id(); -- was STAGING_CRIME_SEQ.NEXTVAL
END;

-- TODO(migration): rewrite in PySpark: surrogate key via monotonically_increasing_id() or Delta IDENTITY column.
CREATE OR REPLACE TRIGGER "GB_ID_TRIGGER"
    BEFORE INSERT ON GOOD_BAD_DATA
    FOR EACH ROW
BEGIN
    :NEW.GB_ID := monotonically_increasing_id(); -- was GB_ID_SEQ.NEXTVAL
END;

-- TODO(migration): rewrite in PySpark: surrogate key via monotonically_increasing_id() or Delta IDENTITY column.
CREATE OR REPLACE TRIGGER TRANSFORM_LOCATION_TRIGGER
    BEFORE INSERT ON TRANSFORM_LOCATION
    FOR EACH ROW
BEGIN
    :NEW.region_key := monotonically_increasing_id(); -- was TRANSFORM_LOCATION_SEQ.NEXTVAL
END;

-- TODO(migration): rewrite in PySpark: surrogate key via monotonically_increasing_id() or Delta IDENTITY column.
CREATE OR REPLACE TRIGGER TRANSFORM_TIME_TRIGGER
    BEFORE INSERT ON TRANSFORM_TIME
    FOR EACH ROW
BEGIN
    :NEW.date_id := monotonically_increasing_id(); -- was TRANSFORM_TIME_SEQ.NEXTVAL
END;

-- TODO(migration): rewrite in PySpark: surrogate key via monotonically_increasing_id() or Delta IDENTITY column.
CREATE OR REPLACE TRIGGER TRANSFORM_CRIME_TYPE_TRIGGER
    BEFORE INSERT ON TRANSFORM_CRIME_TYPE
    FOR EACH ROW
BEGIN
    :NEW.crime_type_key := monotonically_increasing_id(); -- was TRANSFORM_CRIME_TYPE_SEQ.NEXTVAL
END;

-- TODO(migration): rewrite in PySpark: surrogate key via monotonically_increasing_id() or Delta IDENTITY column.
CREATE OR REPLACE TRIGGER TRANSFORM_POLICE_STATION_TRIGGER
    BEFORE INSERT ON TRANSFORM_POLICE_STATION
    FOR EACH ROW
BEGIN
    :NEW.station_key := monotonically_increasing_id(); -- was TRANSFORM_POLICE_STATION_SEQ.NEXTVAL
END;

-- TODO(migration): rewrite in PySpark: surrogate key via monotonically_increasing_id() or Delta IDENTITY column.
CREATE OR REPLACE TRIGGER TRANSFORM_CRIME_STATUS_TRIGGER
    BEFORE INSERT ON TRANSFORM_CRIME_STATUS
    FOR EACH ROW
BEGIN
    :NEW.crime_status_key := monotonically_increasing_id(); -- was TRANSFORM_CRIME_STATUS_SEQ.NEXTVAL
END;

-- TODO(migration): rewrite in PySpark: surrogate key via monotonically_increasing_id() or Delta IDENTITY column.
CREATE OR REPLACE TRIGGER DIM_LOCATION_TRIGGER
    BEFORE INSERT ON DIM_LOCATION
    FOR EACH ROW
BEGIN
    :NEW.region_key := monotonically_increasing_id(); -- was DIM_LOCATION_SEQ.NEXTVAL
END;

-- TODO(migration): rewrite in PySpark: surrogate key via monotonically_increasing_id() or Delta IDENTITY column.
CREATE OR REPLACE TRIGGER DIM_TIME_TRIGGER
    BEFORE INSERT ON DIM_TIME
    FOR EACH ROW
BEGIN
    :NEW.time_key := monotonically_increasing_id(); -- was DIM_TIME_SEQ.NEXTVAL
END;

-- TODO(migration): rewrite in PySpark: surrogate key via monotonically_increasing_id() or Delta IDENTITY column.
CREATE OR REPLACE TRIGGER DIM_CRIME_STATUS_TRIGGER
    BEFORE INSERT ON DIM_CRIME_STATUS

    FOR EACH ROW
BEGIN
    :NEW.CRIME_STATUS_KEY := monotonically_increasing_id(); -- was DIM_CRIME_STATUS_SEQ.NEXTVAL
END;

-- TODO(migration): rewrite in PySpark: surrogate key via monotonically_increasing_id() or Delta IDENTITY column.
CREATE OR REPLACE TRIGGER DIM_CRIME_TYPE_TRIGGER
    BEFORE INSERT ON DIM_CRIME_TYPE
    FOR EACH ROW
BEGIN
    :NEW.crime_type_key := monotonically_increasing_id(); -- was DIM_CRIME_TYPE_SEQ.NEXTVAL
END;

-- TODO(migration): rewrite in PySpark: surrogate key via monotonically_increasing_id() or Delta IDENTITY column.
CREATE OR REPLACE TRIGGER DIM_POLICE_STATION_TRIGGER
    BEFORE INSERT ON DIM_POLICE_STATION
    FOR EACH ROW
BEGIN
    :NEW.police_station_key := monotonically_increasing_id(); -- was DIM_POLICE_STATION_SEQ.NEXTVAL
END;

-- TODO(migration): rewrite in PySpark: surrogate key via monotonically_increasing_id() or Delta IDENTITY column.
CREATE OR REPLACE TRIGGER FACT_CRIME_TRIGGER
    BEFORE INSERT ON FACT_CRIME
    FOR EACH ROW
BEGIN
    :NEW.FACT_CRIME_KEY := monotonically_increasing_id(); -- was FACT_CRIME_SEQ.NEXTVAL
END;

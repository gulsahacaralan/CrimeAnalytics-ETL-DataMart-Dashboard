-- TODO(migration): rewrite in PySpark: Oracle CREATE SEQUENCE DDL (initial Value = 1, increment = 1, nocache/nocache 20) is not supported in Spark SQL; emulate sequences with a counter table + atomic increment or row_number() at load time.
DROP SEQUENCE STAGING_CRIME_SEQ;
CREATE SEQUENCE "STAGING_CRIME_SEQ"
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

-- TODO(migration): rewrite in PySpark: Oracle CREATE SEQUENCE DDL (initial Value = 1, increment = 1, cache 20, noorder) is not supported in Spark SQL; emulate sequences with a counter table + atomic increment or row_number() at load time.
DROP SEQUENCE GB_ID_SEQ;
CREATE SEQUENCE "GB_ID_SEQ"
    INCREMENT BY 1
    CACHE 20
    NOORDER
    NOCYCLE;

-- TODO(migration): rewrite in PySpark: Oracle CREATE SEQUENCE DDL (initial Value = 1, increment = 1, cache 20, noorder) is not supported in Spark SQL; emulate sequences with a counter table + atomic increment or row_number() at load time.
DROP SEQUENCE TRANSFORM_LOCATION_SEQ;
CREATE SEQUENCE TRANSFORM_LOCATION_SEQ
    INCREMENT BY 1
    CACHE 20
    NOORDER
    NOCYCLE;

-- TODO(migration): rewrite in PySpark: Oracle CREATE SEQUENCE DDL (initial Value = 1, increment = 1, cache 20, noorder) is not supported in Spark SQL; emulate sequences with a counter table + atomic increment or row_number() at load time.
DROP SEQUENCE TRANSFORM_TIME_SEQ;
CREATE SEQUENCE TRANSFORM_TIME_SEQ
    INCREMENT BY 1
    CACHE 20
    NOORDER
    NOCYCLE;

-- TODO(migration): rewrite in PySpark: Oracle CREATE SEQUENCE DDL (initial Value = 1, increment = 1, cache 20, noorder) is not supported in Spark SQL; emulate sequences with a counter table + atomic increment or row_number() at load time.
DROP SEQUENCE TRANSFORM_CRIME_TYPE_SEQ;
CREATE SEQUENCE TRANSFORM_CRIME_TYPE_SEQ
    INCREMENT BY 1
    CACHE 20
    NOORDER
    NOCYCLE;

-- TODO(migration): rewrite in PySpark: Oracle CREATE SEQUENCE DDL (initial Value = 1, increment = 1, cache 20, noorder) is not supported in Spark SQL; emulate sequences with a counter table + atomic increment or row_number() at load time.
DROP SEQUENCE TRANSFORM_POLICE_STATION_SEQ;
CREATE SEQUENCE TRANSFORM_POLICE_STATION_SEQ
    INCREMENT BY 1
    CACHE 20
    NOORDER
    NOCYCLE;

-- TODO(migration): rewrite in PySpark: Oracle CREATE SEQUENCE DDL (initial Value = 1, increment = 1, cache 20, noorder) is not supported in Spark SQL; emulate sequences with a counter table + atomic increment or row_number() at load time.
DROP SEQUENCE TRANSFORM_CRIME_STATUS_SEQ;
CREATE SEQUENCE TRANSFORM_CRIME_STATUS_SEQ
    INCREMENT BY 1
    CACHE 20
    NOORDER
    NOCYCLE;

-- TODO(migration): rewrite in PySpark: Oracle CREATE SEQUENCE DDL (initial Value = 1, increment = 1, cache 20, noorder) is not supported in Spark SQL; emulate sequences with a counter table + atomic increment or row_number() at load time.
DROP SEQUENCE DIM_LOCATION_SEQ;

-- Create sequence for DIM_LOCATION
CREATE SEQUENCE DIM_LOCATION_SEQ
    INCREMENT BY 1
    CACHE 20
    NOORDER
    NOCYCLE;
--
-- TODO(migration): rewrite in PySpark: Oracle CREATE SEQUENCE DDL (initial Value = 1, increment = 1, cache 20, noorder) is not supported in Spark SQL; emulate sequences with a counter table + atomic increment or row_number() at load time.
DROP SEQUENCE DIM_TIME_SEQ;
-- Create sequence for DIM_TIME
CREATE SEQUENCE DIM_TIME_SEQ
    INCREMENT BY 1
    CACHE 20
    NOORDER
    NOCYCLE;
--
-- TODO(migration): rewrite in PySpark: Oracle CREATE SEQUENCE DDL (initial Value = 1, increment = 1, cache 20, noorder) is not supported in Spark SQL; emulate sequences with a counter table + atomic increment or row_number() at load time.
DROP SEQUENCE DIM_CRIME_TYPE_SEQ;

-- Create sequence for DIM_CRIME_TYPE
CREATE SEQUENCE DIM_CRIME_TYPE_SEQ
    INCREMENT BY 1
    CACHE 20
    NOORDER
    NOCYCLE;

--

-- TODO(migration): rewrite in PySpark: Oracle CREATE SEQUENCE DDL (initial Value = 1, increment = 1, cache 20, noorder) is not supported in Spark SQL; emulate sequences with a counter table + atomic increment or row_number() at load time.
DROP SEQUENCE DIM_POLICE_STATION_SEQ;
-- Create sequence for DIM_POLICE_STATION
CREATE SEQUENCE DIM_POLICE_STATION_SEQ
    INCREMENT BY 1
    CACHE 20
    NOORDER
    NOCYCLE;

--

-- TODO(migration): rewrite in PySpark: Oracle CREATE SEQUENCE DDL (initial Value = 1, increment = 1, cache 20, noorder) is not supported in Spark SQL; emulate sequences with a counter table + atomic increment or row_number() at load time.
DROP SEQUENCE DIM_CRIME_STATUS_SEQ;
-- Create sequence for DIM_CRIME_STATUS
CREATE SEQUENCE DIM_CRIME_STATUS_SEQ
    INCREMENT BY 1
    CACHE 20
    NOORDER
    NOCYCLE;

CREATE DATABASE urban_mobility;

use urban_mobility;


CREATE DATABASE urban_mobility;

USE urban_mobility;

CREATE TABLE urban_mobility_data (
    Time VARCHAR(10),
    Time_24 VARCHAR(5),
    Day VARCHAR(10),
    Congestion DECIMAL(5,2),
    Speed_kmh DECIMAL(6,2),
    Travel_Time VARCHAR(30),
    Area VARCHAR(10),
    Travel_Time_Seconds INT
);



USE urban_mobility;

SELECT COUNT(*) AS total_rows
FROM urban_mobility_master;



SELECT
    SUM(CASE WHEN Congestion IS NULL THEN 1 ELSE 0 END) AS missing_congestion,
    SUM(CASE WHEN Speed_kmh IS NULL THEN 1 ELSE 0 END) AS missing_speed,
    SUM(CASE WHEN Travel_Time_Seconds IS NULL THEN 1 ELSE 0 END) AS missing_travel_time
FROM urban_mobility_master;


SELECT
    COUNT(*) AS duplicate_rows
FROM (
    SELECT
        Time,
        Time_24,
        Day,
        Congestion,
        Speed_kmh,
        Travel_Time,
        Area,
        Travel_Time_Seconds
    FROM urban_mobility_data
    GROUP BY
        Time,
        Time_24,
        Day,
        Congestion,
        Speed_kmh,
        Travel_Time,
        Area,
        Travel_Time_Seconds
    HAVING COUNT(*) > 1
) AS duplicates;

SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'urban_mobility'
  AND TABLE_NAME = 'urban_mobility_master';
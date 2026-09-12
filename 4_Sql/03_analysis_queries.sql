USE urban_mobility;

SELECT
    ROUND(AVG(Congestion), 2) AS Avg_Congestion,
    ROUND(AVG(Speed_kmh), 2) AS Avg_Speed_kmh,
    ROUND(AVG(Travel_Time_Seconds) / 60, 2) AS Avg_Travel_Time_Minutes
FROM urban_mobility_master;


SELECT
    Area,
    ROUND(AVG(Congestion), 2) AS Avg_Congestion,
    ROUND(AVG(Speed_kmh), 2) AS Avg_Speed_kmh,
    ROUND(AVG(Travel_Time_Seconds) / 60, 2) AS Avg_Travel_Time_Minutes
FROM urban_mobility_master
GROUP BY Area;



SELECT
    Time_24,
    ROUND(AVG(Congestion), 2) AS Avg_Congestion
FROM urban_mobility_master
GROUP BY Time_24
ORDER BY Avg_Congestion DESC;


SELECT
    Day,
    ROUND(AVG(Congestion), 2) AS Avg_Congestion
FROM urban_mobility_master
GROUP BY Day
ORDER BY Avg_Congestion DESC;



SELECT
    Day,
    Time_24,
    Area,
    Congestion,
    Speed_kmh,
    Travel_Time,
    Travel_Time_Seconds
FROM urban_mobility_master
ORDER BY Congestion DESC
LIMIT 1;



SELECT
    Day,
    Time_24,
    Area,
    Congestion,
    Speed_kmh,
    Travel_Time,
    Travel_Time_Seconds
FROM urban_mobility_master
ORDER BY Travel_Time_Seconds DESC
LIMIT 1;



SELECT
    Day,
    ROUND(AVG(Speed_kmh), 2) AS Avg_Speed_kmh
FROM urban_mobility_master
GROUP BY Day
ORDER BY Avg_Speed_kmh ASC;

SELECT
    Time_24,
    ROUND(AVG(Congestion), 2) AS Avg_Congestion,
    ROUND(AVG(Speed_kmh), 2) AS Avg_Speed_kmh,
    ROUND(AVG(Travel_Time_Seconds) / 60, 2) AS Avg_Travel_Time_Minutes
FROM urban_mobility_master
WHERE Time_24 IN ('18:00', '20:00')
GROUP BY Time_24
ORDER BY Time_24;



-- Highest speed
SELECT
    Day,
    Time_24,
    Area,
    Speed_kmh,
    Congestion,
    Travel_Time
FROM urban_mobility_master
ORDER BY Speed_kmh DESC
LIMIT 1;


-- Lowest speed
SELECT
    Day,
    Time_24,
    Area,
    Speed_kmh,
    Congestion,
    Travel_Time
FROM urban_mobility_master
ORDER BY Speed_kmh ASC
LIMIT 1;


SELECT
    Area,
    COUNT(*) AS Total_Records,
    ROUND(AVG(Congestion), 2) AS Avg_Congestion,
    ROUND(AVG(Speed_kmh), 2) AS Avg_Speed_kmh,
    ROUND(AVG(Travel_Time_Seconds) / 60, 2) AS Avg_Travel_Time_Minutes,
    MAX(Congestion) AS Peak_Congestion
FROM urban_mobility_master
GROUP BY Area;

from fastapi import FastAPI, Depends
from database import get_db_connection, close_db_connection
from datetime import datetime, timedelta

app = FastAPI()

# 1. Retrieve total distance traveled by each vehicle in the last 30 days
@app.get("/vehicles/distance_traveled")
def get_total_distance():
    db = get_db_connection()
    cursor = db.cursor(dictionary=True)
    
    query = """
                SELECT 
                v.make,
                v.model,
                o.name AS owner_name,
                SUM(t.distance_travelled) AS total_distance
                FROM 
                Vehicles v
                JOIN 
                Trips t ON v.vehicle_id = t.vehicle_id
                JOIN 
                Owners o ON v.owner_id = o.owner_id
                WHERE 
                t.start_time >= NOW() - INTERVAL 30 DAY
                GROUP BY 
                v.vehicle_id, o.name;
    """
    
    cursor.execute(query)
    result = cursor.fetchall()
    
    close_db_connection(db)
    
    return result

# 2. Detect sensor anomalies
@app.get("/vehicles/sensor_anomalies")
def get_sensor_anomalies():
    db = get_db_connection()
    cursor = db.cursor(dictionary=True)
    
    query = """
    SELECT 
    v.vehicle_id,
    v.make,
    v.model,
    o.name AS owner_name,
    s.sensor_type,
    s.sensor_reading AS sensor_value,
    s.timestamp
    FROM 
    Sensors s
    JOIN 
    Vehicles v ON s.vehicle_id = v.vehicle_id
    JOIN 
    Owners o ON v.owner_id = o.owner_id
    WHERE 
    (s.sensor_type = 'speed' AND s.sensor_reading > 120)
    OR (s.sensor_type = 'fuel_level' AND s.sensor_reading < 10);
    """
    
    cursor.execute(query)
    result = cursor.fetchall()
    
    close_db_connection(db)
    
    return result


# 3. Get maintenance history
@app.get("/vehicles/{vehicle_id}/maintenance_history")
def get_maintenance_history(vehicle_id: int):

    db = get_db_connection()
    cursor = db.cursor(dictionary=True)
    
    query = """
    SELECT 
        m.maintenance_type,
        m.maintenance_date,
        m.maintenance_cost
    FROM 
        maintenance m
    WHERE 
        m.vehicle_id = %s;
    """
    
    cursor.execute(query, (vehicle_id,))
    result = cursor.fetchall()
    
    close_db_connection(db)
    
    return result

# 4. Find vehicles with frequent trips
@app.get("/vehicles/frequent_trips")
def get_frequent_trips():
    db = get_db_connection()
    cursor = db.cursor(dictionary=True)
    
    query = """
        SELECT 
    v.vehicle_id,
    v.make,
    v.model,
    COUNT(t.trip_id) AS number_of_trips
    FROM 
    vehicles v
    JOIN 
    trips t ON v.vehicle_id = t.vehicle_id
    WHERE 
    t.start_time >= NOW() - INTERVAL 7 DAY
    GROUP BY 
    v.vehicle_id, v.make, v.model
    HAVING 
    COUNT(t.trip_id) > 5;

    """
    
    cursor.execute(query)
    result = cursor.fetchall()
    
    close_db_connection(db)
    
    return result


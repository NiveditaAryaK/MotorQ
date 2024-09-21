import mysql.connector
from fastapi import HTTPException

def get_db_connection():
    try:
        connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="password", 
            database="Mech"
        )
        return connection
    except mysql.connector.Error as err:
        raise HTTPException(status_code=500, detail="Database connection failed: " + str(err))

def close_db_connection(connection):
    connection.close()


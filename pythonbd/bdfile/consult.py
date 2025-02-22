#pip install mysql-connector-python

def main():
    import mysql.connector              #crear conexion con bd
    
    connDB = mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="compra_on"
    )
    sQuery = "SELECT * FROM productos"  #consulta
    curDB = connDB.cursor()             #crea un cursor para la conexion
    curDB.execute(sQuery)               #ejecuta la consulta
    resultado = curDB.fetchall()        #respuesta, formato lista
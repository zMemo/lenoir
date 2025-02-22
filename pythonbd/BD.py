#pip install mysql-connector-python

import mysql.connector              #crear conexion con bd
import mysql.vendor

def conectarBD(miBase="compra_on"):
    connDB = mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database=miBase
    )
    return connDB

def closeBD():
    if connDB!=None:
        connDB.close()
        
def ejecutarConsulta(connDB,sQuery):
    base = connDB.cursor()    #crea un cursor para la conexion
    base.execute(sQuery)      #ejecuta la consulta
    resultado = base.fetchall() #respuesta, formato lista
    return resultado

def ejectuar(connDB,sQuery ):
    #INSERT UPDATE DELETE
    res =None
    base = connDB.cursor()    #crea un cursor para la conexion
    try:
        base.execute(sQuery)                                    #ejecuta la consulta
        connDB.commit()                                         #guarda los cambios
        res = base.rowcount                                     #numero de filas afectadas
    except mysql.connector.Error as e:                          #error en la consulta
        print("Error en la consulta y se hizo rollback: ", e)   #mensaje de error
        connDB.rollback()                                       #deshace los cambios
    return res
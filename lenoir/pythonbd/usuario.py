def modificarUsuario(id, campo, valorNuevo):
    # Modificar usuario
    SQL = "UPDATE usuarios SET {}={} WHERE id = {}".format(campo,valorNuevo,id)
    connDB = conectarBD()
    res=ejecutar(connDB,sQuery)
    cerrarBD(connDB)
    return res

def consultarUsuarioXDNI(dni):
    connDB=conectarBD()
    sQuery = "SELECT * FROM usuarios WHERE dni = {}".format(dni)
    res=ejecutarConsulta(connDB,sQuery)
    cerrarBD(connDB)
    return res

def consultarUsuarioXID(id):
    connDB=conectarBD()
    sQuery = "SELECT * FROM usuarios WHERE id = {}".format(id)
    res=ejecutarConsulta(connDB,sQuery)
    cerrarBD(connDB)
    return res

def altaUsuario(nombre, apellido, email, dni, direccion):
    sQuery ="""
        INSERT INTO usuarios
        (nombre, apellido, email, dni, direccion)
        VALUES
        (NULL, '{}', '{}', '{}', '{}', '{}')
        """.format(nombre, apellido, email, dni, direccion)
    print(sQuery)
    connDB = conectarBD()
    res=ejecutar(connDB,sQuery)
    cerrarBD(connDB)
    return res


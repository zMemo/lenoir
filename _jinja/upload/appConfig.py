from os import path
config={}
#directorio del proyecto
config['dir']=path.dirname(path.abspath(__file__))
#directorio de la carpeta para subir archivos
config['dirUpload']=path.join(config['dir'],'uploads')
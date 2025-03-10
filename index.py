# INDEX-------------------------------------------------------------------

from flask import Flask, render_template,request, redirect,url_for, flash
import mysql.connector 

app = Flask(__name__)

#obtenemos la conexion
miConexion = mysql.connector.connect( host='localhost', user= 'root', passwd= '', db= 'bd_deportes' )
cur = miConexion.cursor()

app.secret_key = 'mysecretkey'


# RUTA 1_INICIO-----------------------------------------------

@app.route('/')
def home():

    return render_template('pagina1.html')






# RUTA 2_instructoreS-------------------------------------------

@app.route('/pagina2', methods=["GET", "POST"]) 
def pagina2():
    miConexion = mysql.connector.connect( host='localhost', user= 'root', passwd='', db='bd_deportes' )
    cur = miConexion.cursor()

    #establecemos consulta SQL
    sql = "SELECT * FROM estudiantes"
    #ejecutar consulta
    cur.execute(sql)
    print(cur)

    return render_template("pagina2.html", estudiantes = cur)

@app.route('/agregar_estudiante', methods=["GET","POST"])
def pagina2_agregar_estudiante():
    if request.method=='POST':
        tipo_documento=request.form['tipo_documento']
        id_estudiante=request.form['id_estudiante']
        nombres=request.form['nombres']
        apellidos=request.form['apellidos']
        direccion=request.form['direccion']
        celular=request.form['celular']
        email=request.form['email']

        miConexion = mysql.connector.connect( host='localhost', user= 'root', passwd='', db='bd_deportes' )
        cur = miConexion.cursor()
 
        #establecemos consulta SQL
        sql = "INSERT INTO estudiantes (tipo_documento, id_estudiante, nombres, apellidos, direccion, celular, email) VALUES (%s, %s, %s, %s, %s, %s, %s)"
        val = (tipo_documento, id_estudiante, nombres, apellidos, direccion, celular, email)
 
        #ejecutar consulta SQL - cur (objeto/variable)
        cur.execute(sql, val)
        #guardamos en la BD
        miConexion.commit()
        #cerrar conexion
        #miConexion.close

        #flash('Registro insertado.')

    return redirect(url_for('pagina2'))


@app.route('/borrarestudiante/<string:id>')
def borrar_estudiante(id):
    miConexion = mysql.connector.connect( host='localhost', user= 'root', passwd='', db='bd_deportes' )
    cur = miConexion.cursor()

    #establecemos consulta SQL
    sql = "DELETE FROM estudiantes WHERE id_estudiante= {0}".format(id)
    #ejecutar consulta
    cur.execute(sql)
    #guardamos en la BD
    miConexion.commit()
    #cerrar conexion
    #miConexion.close

    #flash('Registro eliminado.')

    return redirect(url_for('pagina2'))


@app.route('/editarestudiante/<string:id>')
def editar_estudiante(id): # definir metodo pagina()
    miConexion = mysql.connector.connect( host='localhost', user= 'root', passwd='', db='bd_deportes' )
    cur = miConexion.cursor()

    #establecemos consulta SQL
    sql = "SELECT * FROM estudiantes WHERE id_estudiante= {0}".format(id)
 
    #ejecutar consulta
    cur.execute(sql)
    #los datos que se traen de la consulta se guardan en data
    data = cur.fetchall()
    #verificando en la terminal los datos a modificar
    print(data)
 
    #llamando a la vista donde se va a mostrar el registro a modificar
    #se va a utilizar la variable cat en la vista para mostrar los datos
    
    #return render_template("editar_estudiante.html", cat = data[0])

    
    return render_template("editar_estudiante.html", cat = data [0])



@app.route('/actualizarestudiante/<string:id>', methods=["POST"])
def cambiar_estudiante(id): # definir metodo pagina()
    if request.method=='POST':
        miConexion = mysql.connector.connect( host='localhost', user= 'root', passwd='', db='bd_deportes' )
        cur = miConexion.cursor()

        #capturar datos del formulario
        tipo_documento=request.form['tipo_documento']
        id_estudiante=request.form['id_estudiante']
        nombres=request.form['nombres']
        apellidos=request.form['apellidos']
        direccion=request.form['direccion']
        celular=request.form['celular']
        email=request.form['email']
 
 
        #establecemos consulta SQL
        sql = "UPDATE estudiantes SET tipo_documento = %s, nombres = %s, apellidos = %s, direccion = %s, celular = %s, email = %s WHERE id_estudiante= %s"
        val = (tipo_documento, nombres, apellidos, direccion, celular, email, id_estudiante)
        #ejecutar consulta
        cur.execute(sql, val)
        #guardamos en la BD
        miConexion.commit()
        #cerrar conexion
        #miConexion.close 
        
        return redirect(url_for("pagina2"))


# RUTA 3_INSTRUCTORES---------------------------------------------------

@app.route('/pagina3', methods=["GET", "POST"]) 
def pagina3():
    miConexion = mysql.connector.connect( host='localhost', user= 'root', passwd='', db='bd_deportes' )
    cur = miConexion.cursor()

    #establecemos consulta SQL
    sql = "SELECT * FROM instructores"
    #ejecutar consulta
    cur.execute(sql)
    print(cur)

    return render_template("pagina3.html", instructores = cur)

@app.route('/agregar_instructor', methods=["GET","POST"])
def pagina3_agregar_instructor():
    if request.method=='POST':
        tipo_documento=request.form['tipo_documento']
        id_instructor=request.form['id_instructor']
        nombres=request.form['nombres']
        apellidos=request.form['apellidos']
        direccion=request.form['direccion']
        celular=request.form['celular']
        email=request.form['email']

        miConexion = mysql.connector.connect( host='localhost', user= 'root', passwd='', db='bd_deportes' )
        cur = miConexion.cursor()
 
        #establecemos consulta SQL
        sql = "INSERT INTO instructores (tipo_documento, id_instructor, nombres, apellidos, direccion, celular, email) VALUES (%s, %s, %s, %s, %s, %s, %s)"
        val = (tipo_documento, id_instructor, nombres, apellidos, direccion, celular, email)
 
        #ejecutar consulta SQL - cur (objeto/variable)
        cur.execute(sql, val)
        #guardamos en la BD
        miConexion.commit()
        #cerrar conexion
        #miConexion.close

        #flash('Registro insertado.')

    return redirect(url_for('pagina3'))


@app.route('/borrarinstructor/<string:id>')
def borrar_instructore(id):
    miConexion = mysql.connector.connect( host='localhost', user= 'root', passwd='', db='bd_deportes' )
    cur = miConexion.cursor()

    #establecemos consulta SQL
    sql = "DELETE FROM instructores WHERE id_instructor= {0}".format(id)
    #ejecutar consulta
    cur.execute(sql)
    #guardamos en la BD
    miConexion.commit()
    #cerrar conexion
    #miConexion.close

    #flash('Registro eliminado.')

    return redirect(url_for('pagina2'))


@app.route('/editarinstructor/<string:id>')
def editar_instructore(id): # definir metodo pagina()
    miConexion = mysql.connector.connect( host='localhost', user= 'root', passwd='', db='bd_deportes' )
    cur = miConexion.cursor()

    #establecemos consulta SQL
    sql = "SELECT * FROM instructores WHERE id_instructor= {0}".format(id)

    #ejecutar consulta
    cur.execute(sql)
    #los datos que se traen de la consulta se guardan en data
    data = cur.fetchall()
    #verificando en la terminal los datos a modificar
    print(data)

    #llamando a la vista donde se va a mostrar el registro a modificar
    #se va a utilizar la variable cat en la vista para mostrar los datos
    
    #return render_template("editar_instructore.html", cat = data[0])

    
    return render_template("editar_instructor.html", cat = data [0])



@app.route('/actualizarinstructor/<string:id>', methods=["POST"])
def cambiar_instructore(id): # definir metodo pagina()
    if request.method=='POST':
        miConexion = mysql.connector.connect( host='localhost', user= 'root', passwd='', db='bd_deportes' )
        cur = miConexion.cursor()

        #capturar datos del formulario
        tipo_documento=request.form['tipo_documento']
        id_instructor=request.form['id_instructor']
        nombres=request.form['nombres']
        apellidos=request.form['apellidos']
        direccion=request.form['direccion']
        celular=request.form['celular']
        email=request.form['email']

        #establecemos consulta SQL
        sql = "UPDATE instructores SET tipo_documento = %s, nombres = %s, apellidos = %s, direccion = %s, celular = %s, email = %s WHERE id_instructor= %s"
        val = (tipo_documento, nombres, apellidos, direccion, celular, email, id_instructor)
        #ejecutar consulta
        cur.execute(sql, val)
        #guardamos en la BD
        miConexion.commit()
        #cerrar conexion
        #miConexion.close 
        
        return redirect(url_for("pagina3"))




# RUTA 4_CATEGORIAS -----------------------------------------------------

@app.route('/pagina4', methods=["GET", "POST"])
def pagina4():
    miConexion = mysql.connector.connect( host='localhost', user= 'root', passwd='', db='bd_deportes' )
    cur = miConexion.cursor()

    #establecemos consulta SQL
    sql = "SELECT * FROM categorias"
    #ejecutar consulta
    cur.execute(sql)
    #for (codigo, descripcion) in cur:
    print(cur)
    
    return render_template("pagina4.html", categorias = cur)

@app.route('/agregar_categoria', methods=["GET", "POST"])
def pagina4_agregar_cat():
    if request.method=='POST':
        id_categoria=request.form['id_categoria']
        descripcion_categoria=request.form['descripcion_categoria']
        print(id_categoria)#imprimir en la terminal el id
        print(descripcion_categoria)#imprimir en la terminal la descripcion

        #obtenemos la conexion
        miConexion = mysql.connector.connect( host='localhost', user= 'root', passwd='', db='bd_deportes' )
        cur = miConexion.cursor()
        #establecemos consulta sql
        sql = "INSERT INTO categorias (id_categoria, descripcion_categoria) VALUES (%s, %s)"
        val = (id_categoria, descripcion_categoria)
        #ejecutar consulta
        cur.execute(sql, val)
        #guardamos en la BD
        miConexion.commit()
        #cerrar conexion
        miConexion.close
        #enviar mensaje
        flash('Registro insertado')
    return redirect(url_for('pagina4'))

@app.route('/borrarcategoria/<string:id>')
def borrar_categoria(id):
    
    miConexion = mysql.connector.connect( host='localhost', user= 'root', passwd='', db='bd_deportes' )
    cur = miConexion.cursor()    
    #establecemos consulta SQL
    sql = "DELETE FROM categorias WHERE id_categoria= {0}".format(id)
    #ejecutar consulta
    cur.execute(sql)
    #guardamos en la bd
    miConexion.commit()

    flash('Registro eliminado.')

    return redirect(url_for('pagina4'))

@app.route('/editarcategoria/<string:id>')
def editar_categoria(id):
    miConexion = mysql.connector.connect( host='localhost', user= 'root', passwd='', db='bd_deportes' )
    cur = miConexion.cursor()
    
    
    #establecemos consulta SQL
    sql = "SELECT * FROM categorias WHERE id_categoria= {0}".format(id)

    #ejecutar consulta
    cur.execute(sql)
    #los datos que se traen de la consulta se guardan en data
    data = cur.fetchall()
    #Verificando en la terminal los datos a modificar
    print(data)

    #llamando a la vista donde se va a mostrar el registro a modificar
    #Se va a utilizar la variable cat en la vista para mostrar los datos
    return render_template("editar_categoria.html", cat = data [0])


@app.route('/actualizarcategoria/<string:id>', methods=["POST"])
def cambiar_categoria(id):
    if request.method=='POST':
        #capturar datos del formulario
        id_categoria=request.form['id_categoria']
        descripcion_categoria=request.form['descripcion_categoria']

        miConexion = mysql.connector.connect( host='localhost', user= 'root', passwd='', db='bd_deportes' )
        cur = miConexion.cursor()


        #establecemos consulta SQL
        sql = "UPDATE categorias SET descripcion_categoria = %s WHERE id_categoria= %s"
        val = (descripcion_categoria, id_categoria)
        #ejecutar consulta
        cur.execute(sql, val)
        #guardamos en la BD
        miConexion.commit()
        #cerrar conexion
        miConexion.close

        return redirect(url_for("pagina4"))


# RUTA5_MATRICULAS ----------------------------------------------------

@app.route('/pagina5', methods=["GET", "POST"])
def pagina5():
    miConexion = mysql.connector.connect( host='localhost', user= 'root', passwd='', db='bd_deportes' )
    cur = miConexion.cursor()

    #establecemos consulta SQL
    sql = "SELECT * FROM registro_matriculas"
    #ejecutar consulta
    cur.execute(sql)
    #for (codigo, descripcion) in cur:
    print(cur)
    
    return render_template("pagina5.html", registro_matriculas = cur)

@app.route('/agregar_registro_matricula', methods=["GET", "POST"])
def pagina5_agregar_mat():
    if request.method=='POST':
        id_matricula=request.form['id_matricula']
        id_estudiante=request.form['id_estudiante']
        fecha_matricula=request.form['fecha_matricula']
        id_categoria=request.form['id_categoria']
        id_horario=request.form['id_horario']
        valor_matricula=request.form['valor_matricula']
        valor_mensualidad=request.form['valor_mensualidad']
        id_instructor=request.form['id_instructor']
        
        
        print(id_matricula)#imprimir en la terminal el id
        print(id_estudiante)#imprimir en la terminal el id
        print(fecha_matricula)
        print(id_categoria)#imprimir en la terminal el id
        print(id_horario)
        print(valor_matricula)
        print(valor_mensualidad)
        print(id_instructor)

        #obtenemos la conexion
        miConexion = mysql.connector.connect( host='localhost', user= 'root', passwd='', db='bd_deportes' )
        cur = miConexion.cursor()
        #establecemos consulta sql
        sql = "INSERT INTO categorias (id_categoria, id_estudiante, fecha_matricula, id_categoria, id_horario, valor_matricula, valor_mensualidad, id_instructor) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"
        val = (id_categoria, id_estudiante, fecha_matricula, id_categoria, id_horario, valor_matricula, valor_mensualidad, id_instructor)
        #ejecutar consulta
        cur.execute(sql, val)
        #guardamos en la BD
        miConexion.commit()
        #cerrar conexion
        miConexion.close
        #enviar mensaje
        flash('Registro insertado')
    return redirect(url_for('pagina5'))

@app.route('/borrarregitro_matricula/<string:id>')
def borrar_regitro_matricula(id):
    
    miConexion = mysql.connector.connect( host='localhost', user= 'root', passwd='', db='bd_deportes' )
    cur = miConexion.cursor()    
    #establecemos consulta SQL
    sql = "DELETE FROM registro_matriculas WHERE id_matricula= {0}".format(id)
    #ejecutar consulta
    cur.execute(sql)
    #guardamos en la bd
    miConexion.commit()

    flash('Registro eliminado.')

    return redirect(url_for('pagina5'))

@app.route('/editarregistrar_matricula/<string:id>')
def editar_registrar_matricula(id):
    miConexion = mysql.connector.connect( host='localhost', user= 'root', passwd='', db='bd_deportes' )
    cur = miConexion.cursor()
    
    
    #establecemos consulta SQL
    sql = "SELECT * registro_matriculas WHERE id_matricula= {0}".format(id)

    #ejecutar consulta
    cur.execute(sql)
    #los datos que se traen de la consulta se guardan en data
    data = cur.fetchall()
    #Verificando en la terminal los datos a modificar
    print(data)

    #llamando a la vista donde se va a mostrar el registro a modificar
    #Se va a utilizar la variable cat en la vista para mostrar los datos
    return render_template("editar_matricula.html", cat = data [0])


@app.route('/actualizarregistro_matricula/<string:id>', methods=["POST"])
def cambiar_registro_matricula(id):
    if request.method=='POST':
        #capturar datos del formulario
        id_matricula=request.form['id_matricula']
        id_estudiante=request.form['id_estudiante']
        fecha_matricula=request.form['fecha_matricula']
        id_categoria=request.form['id_categoria']
        id_horario=request.form['id_horario']
        valor_matricula=request.form['valor_matricula']
        valor_mensualidad=request.form['valor_mensualidad']
        id_instructor=request.form['id_instructor']

        miConexion = mysql.connector.connect( host='localhost', user= 'root', passwd='', db='bd_deportes' )
        cur = miConexion.cursor()


        #establecemos consulta SQL
        sql = "UPDATE registro_matriculas SET id_estudiante = %s, fecha_matricula = %s, id_categoria = %s, id_horario = %s, valor_matricula = %s, valor_mensualidad = %s, id_instructor = %s WHERE id_matricula= %s"
        val = (id_estudiante, fecha_matricula, id_categoria, id_horario, valor_matricula, valor_mensualidad, id_instructor, id_matricula)
        #ejecutar consulta
        cur.execute(sql, val)
        #guardamos en la BD
        miConexion.commit()
        #cerrar conexion
        miConexion.close

        return redirect(url_for("pagina5"))



#-----------------------------------------------------------------------------

# RUTA6_EVALUACIONES

@app.route('/pagina6',methods=["GET","POST"])
def pagina6():

    return render_template("pagina6.html")




#-----------------------------------------------------------------------------
# RUTA 7_COMPETENCIAS

@app.route('/pagina7',methods=["GET","POST"])
def pagina7():

    return render_template("pagina7.html")



#-----------------------------------------------------------------------------
# RUTA 8_Fotogaleria

@app.route('/pagina8',methods=["GET","POST"])
def pagina8():

    return render_template("pagina8.html")



# RUTA 9_Creditos---------------------------------------------------
@app.route('/pagina9',methods=["GET","POST"])
def pagina9():

    return render_template("pagina9.html")

    
#-----------------------------------------------------------------------------    
    
if __name__ == '__main__':     # Validar el archivo principal para correr la aplicacion
    app.run(debug=True)
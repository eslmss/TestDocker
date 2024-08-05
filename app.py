from flask import Flask, render_template # esta en el contenedor asi que se puede ignorar el warning
import os # debug

# app = Flask(__name__)
app = Flask(__name__, template_folder='.')  # esto indica que la carpeta de templates está en el directorio actual
# app = Flask(__name__, template_folder='templates/')  # esto indica que

@app.route('/')
def hello():
    # return "¡Hola desde Docker!"
    return render_template('index.html')

if __name__ == '__main__':
    # app.run(debug=True)
    app.run(host='0.0.0.0', port=5000)
    
# docker build -t test-mi-app-python .          # esto dockeriza la app (genera imagen 'test-mi-app-python' y su build que no sé por qué se llama 'text_docker')
# docker run -p 5000:5000 test-mi-app-python    # esto genera una instancia nueva de contenedor por cada vez que se corre (usando la imagen anterior)
# docker start {nombre_o_id_contenedor}         # inicia el contenedor que creamos recién (si está recién creado ya está iniciado)
# imagen de la version de py
FROM python:3.9-slim-buster

# setea el directorio actual para todos los comandos que  vienen luego -> '/app' toma el directorio donde la app.py y el resto de archivos están
WORKDIR /app

# copia desde la máquina local al contenedor -> nombre del archivo que se copia -> '.' indica el directorio de la máquina local
COPY requirements.txt .
# copia desde la máquina local al contenedor -> nombre de la carpeta que se copia -> '.' indica el directorio de la máquina local dentro de esa carpeta (copia todo)
COPY templates/ .

# corre comandos de consola en el contenedor
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

    # copia desde la máquina local al contenedor -> nombre del archivo que se copia -> '.' indica el directorio de la máquina local
COPY app.py .

# expone el puerto que la aplicación estará usando
EXPOSE 5000

# le dice a docker que corra el intérprete de python y ejecute 'app.py' cuando el contenedor arranca. Setea el entry point en 'app.py'
CMD ["python", "app.py"]
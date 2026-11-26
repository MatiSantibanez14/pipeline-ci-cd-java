
#!/bin/bash

set -e

echo "Iniciando despliegue en ambiente de prueba..."

APP_JAR="target/pipeline-ci-cd-java-1.0-SNAPSHOT.jar"
ENV_DIR="deployment/test-environment"
BACKUP_DIR="deployment/backup"

# Verificar que exista el archivo JAR
if [ ! -f "$APP_JAR" ]; then
    echo "ERROR: No se encontro el archivo JAR."
    exit 1
fi

# Guardar respaldo de la version anterior
if [ -f "$ENV_DIR/app.jar" ]; then
    mkdir -p "$BACKUP_DIR"
    cp "$ENV_DIR/app.jar" "$BACKUP_DIR/app.jar"
    echo "Respaldo de version anterior creado."
fi

# Crear ambiente de prueba
mkdir -p "$ENV_DIR"

# Desplegar nueva version
cp "$APP_JAR" "$ENV_DIR/app.jar"

# Verificar despliegue
if [ -s "$ENV_DIR/app.jar" ]; then
    echo "Despliegue realizado correctamente."
else
    echo "ERROR: El despliegue fallo."
    exit 1
fi

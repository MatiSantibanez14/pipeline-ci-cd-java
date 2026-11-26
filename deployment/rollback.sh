
#!/bin/bash

set -e

echo "Iniciando rollback..."

# Verificar si existe una version anterior
if [ -f deployment/backup/app.jar ]; then
    mkdir -p deployment/test-environment

    cp deployment/backup/app.jar deployment/test-environment/app.jar

    echo "Rollback realizado correctamente."
else
    echo "ERROR: No existe una version anterior para recuperar."
    exit 1
fi

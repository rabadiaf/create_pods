#!/bin/bash

set -e

# Ruta destino del archivo embebido
OUTPUT_FILE="kubeconfig.embedded.yaml"

# Obtener IP del cluster Minikube
MINIKUBE_IP=$(minikube ip)
echo "[INFO] IP de Minikube: $MINIKUBE_IP"

# Extraer el puerto usado por el server actual
PORT=$(kubectl config view --minify -o jsonpath='{.clusters[0].cluster.server}' | grep -o '[0-9]\{4,5\}')
echo "[INFO] Puerto del API server: $PORT"

# Crear kubeconfig con todos los datos embebidos
kubectl config view --flatten --minify --raw > "$OUTPUT_FILE"

# Reemplazar 127.0.0.1 por la IP real
sed -i "s|https://127.0.0.1:${PORT}|https://${MINIKUBE_IP}:${PORT}|g" "$OUTPUT_FILE"

echo "[OK] kubeconfig embebido generado correctamente en: $OUTPUT_FILE"


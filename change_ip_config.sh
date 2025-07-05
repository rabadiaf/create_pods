#!/bin/bash

# Ruta del kubeconfig que vas a editar
CONFIG_FILE="kubeconfig.embedded.yaml"

# Puerto del servidor Kubernetes que estás usando (ajústalo si es diferente)
PORT="32791"

# IP del host (usada por contenedores para alcanzar el host en Linux)
HOST_IP=$(ip route | grep default | awk '{print $3}')

if [ -z "$HOST_IP" ]; then
  echo "❌ No se pudo determinar la IP del host."
  exit 1
fi

echo "🔧 Reemplazando server en $CONFIG_FILE con https://$HOST_IP:$PORT"

# Hacer el reemplazo
sed -i "s|server: .*|server: https://$HOST_IP:$PORT|" "$CONFIG_FILE"

echo "✅ kubeconfig.embedded.yaml actualizado con server: https://$HOST_IP:$PORT"

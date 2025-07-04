#!/bin/bash
echo "Starting deployment..."

# Usa kubeconfig embebido
export KUBECONFIG=/app/kubeconfig.embedded.yaml

ansible-playbook /app/playbook.yml

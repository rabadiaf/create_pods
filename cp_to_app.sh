#!/bin/bash

echo "🚀 Iniciando contenedor con archivos montados en /app ..."
docker run --rm --network host -v "$(pwd)":/app -it rabadiaf/ci-demo:latest sh

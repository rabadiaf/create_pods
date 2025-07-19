FROM node:18-slim

# Crear un usuario sin privilegios
RUN useradd -m rodolfo

# Establecer ese usuario como el que ejecutará lo que sigue
USER rodolfo

# Directorio de trabajo
WORKDIR /app

# Copiar y ejecutar con ese usuario
COPY . .
CMD ["node", "app.js"]


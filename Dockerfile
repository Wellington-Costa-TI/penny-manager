# Usa a imagem oficial do PostgreSQL como base
FROM postgres:12.18-bullseye

COPY initial_bd.sql /docker-entrypoint-initdb.d/ 

# Variáveis de ambiente para configuração do PostgreSQL
ENV POSTGRES_DB=penny-manager \
    POSTGRES_USER=pmanager \
    POSTGRES_PASSWORD=fev@2024

# Expõe a porta padrão do PostgreSQL (5432)
EXPOSE 5432

# Comandos opcionais para personalização adicional
# VOLUME /var/lib/postgresql/data  # Define um volume para armazenar dados persistentes do banco de dados

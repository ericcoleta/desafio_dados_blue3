# Usa uma imagem base com Python 3.11
FROM python:3.11-slim

# Define variáveis de ambiente
ENV VIRTUAL_ENV=/opt/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Cria o ambiente virtual
RUN python3 -m venv $VIRTUAL_ENV

# Atualiza o pip no ambiente virtual
RUN pip install --upgrade pip

# Instala dependências para compilação e para o PostgreSQL
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Copia o arquivo requirements.txt para o container
COPY requirements.txt /tmp/

# Ativa o ambiente virtual e instala as dependências Python a partir de requirements.txt
RUN . $VIRTUAL_ENV/bin/activate && pip install -r /tmp/requirements.txt

# Instala o JupyterLab, ipykernel, psycopg2-binary e sqlalchemy no ambiente virtual
RUN . $VIRTUAL_ENV/bin/activate && pip install jupyterlab ipykernel psycopg2-binary sqlalchemy ipython-sql

# Copia o script start-notebook.sh para o container e dá permissão de execução
COPY start-notebook.sh /usr/local/bin/start-notebook.sh
RUN chmod +x /usr/local/bin/start-notebook.sh

# Define o diretório de trabalho
WORKDIR /home/candidato/work

# Comando para ativar o ambiente virtual e rodar o JupyterLab diretamente
CMD ["start-notebook.sh"]
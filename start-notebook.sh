#!/bin/bash

# Ativa o ambiente virtual
source /opt/venv/bin/activate

# Inicia o JupyterLab
jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root \
    --NotebookApp.token='' --NotebookApp.password='' \
    --NotebookApp.notebook_dir='/home/candidato/work'
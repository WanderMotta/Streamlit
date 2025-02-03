FROM python:3.9-slim

WORKDIR /app

# Copiando o arquivo de requisitos
COPY requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copiando todo o conteúdo do projeto
COPY . .

EXPOSE 8501

CMD ["streamlit", "run", "processador_ofx.py", "--server.enableCORS", "false"]
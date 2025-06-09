# Usa uma imagem base leve do Python
FROM python:3.9-slim

# Define o diretório de trabalho
WORKDIR /app

# Copia o arquivo de dependências primeiro para otimizar cache de build
COPY requirements.txt .

# Instala o pip atualizado e as dependências da aplicação
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copia o restante dos arquivos da aplicação
COPY . .

# Expõe a porta 80 (em vez de 8501)
EXPOSE 80

# Comando para iniciar a aplicação Streamlit na porta 80
CMD ["streamlit", "run", "processador_ofx.py", "--server.port=80", "--server.enableCORS=false", "--server.enableXsrfProtection=false"]

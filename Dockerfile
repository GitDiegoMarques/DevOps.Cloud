FROM python:3.13.4-alpine3.22

#Define o diretório de trabalho dentro do conteiner
WORKDIR /app

# Copia o arquivo de requisitos e instala as dependencias 
# Usamos --no-cache-dir para evitar o cache de pacotes e reduzir o tamanho da imagem
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

#copia o restando do código da aplicação para o diretório de trabalho
COPY . .

# Expõe a porta que a aplicação FastAPI irá Rodar (padrão é 8000)
EXPOSE 8000

# Comando para rodar a aplicação usando uvicorn
# O host 0.0.0.0 permite que a aplicação seja acessível de fora do contêiner
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload""]


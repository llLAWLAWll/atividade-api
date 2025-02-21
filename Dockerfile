# Usa a imagem oficial do Ruby
FROM ruby:3.2.6

# Instala dependências do sistema necessárias para SQLite e Node.js (caso precise para assets)
RUN apt-get update -qq && apt-get install -y sqlite3 libsqlite3-dev nodejs

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Copia apenas os arquivos necessários para instalar as gems (evita reinstalação desnecessária)
COPY Gemfile Gemfile.lock ./

# Garante que o Bundler instale os executáveis corretamente
RUN gem install bundler && bundle install --binstubs

# Copia o restante do código para dentro do container
COPY . .

# Adiciona o caminho dos binários ao PATH (para evitar erro "command not found")
ENV PATH="/app/bin:$PATH"

# Exposição da porta usada pelo Rails
EXPOSE 3000

# Comando para iniciar o servidor Rails
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]

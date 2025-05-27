FROM ubuntu:22.04

# Instala dependências
RUN apt update && apt install -y \
    build-essential \
    git \
    cmake \
    libmariadb-dev \
    libpcre3-dev \
    zlib1g-dev \
    libmariadb-dev-compat \
    libmariadb-dev \
    mysql-client \
    nano \
    && rm -rf /var/lib/apt/lists/*

# Clona o rAthena se necessário
RUN git clone https://github.com/rathena/rathena.git
WORKDIR /rathena

# Compila
RUN mkdir build && cd build && cmake .. && make

# Define o entrypoint
#CMD ["sh", "-c", "./login-server & ./char-server & ./map-server && tail -f /dev/null"]
CMD ["sh", "-c", "./athena-start start && tail -f /dev/null"]

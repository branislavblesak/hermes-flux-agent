FROM ubuntu:22.04

# Zamedzenie interaktívnym výzvam počas inštalácie
ENV DEBIAN_FRONTEND=noninteractive

# Inštalácia systémových závislostí
RUN apt-get update && apt-get install -y \
    curl \
    git \
    sudo \
    && rm -rf /var/lib/apt/lists/*

# Inštalácia Hermes AI Agenta
RUN curl -fsSL https://hermes.nous.research/install.sh | bash

# Nastavenie pracovného adresára
WORKDIR /root

# Exponovanie portu pre prípadnú komunikáciu
EXPOSE 8080

# Príkaz na automatické spustenie brány po štarte kontajnera
CMD ["hermes", "gateway", "start"]

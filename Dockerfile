# Use a compatible base image for Pterodactyl
FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
    software-properties-common \
    curl \
    wget \
    git \
    build-essential \
    python3 \
    python3-pip \
    python3-venv \
    nodejs \
    npm \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

USER 		container
ENV 		USER=container HOME=/home/container
RUN			npm install -g n && n lts

RUN 		npm install dotenv fs cors express nodemailer body-parser

RUN 		python3 -m pip install --upgrade pip

RUN			pip install flask flask-login

WORKDIR 	/home/container

COPY        ./../entrypoint.sh /entrypoint.sh

CMD         [ "/bin/bash", "/entrypoint.sh" ]

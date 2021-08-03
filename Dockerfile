FROM ubuntu:20.04

WORKDIR /usr/src/app

ENV TZ UTC

RUN chmod 777 /usr/src/app

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends python3.9 && \
    apt-get install -y --no-install-recommends python3.9-dev && \
    apt-get install -y --no-install-recommends python3-pip && \
    apt-get install -y curl && \
    apt-get install -y git && \
    apt-get install -y gnupg
RUN curl -sL https://deb.nodesource.com/setup_16.x  | bash -
RUN apt-get -y install nodejs
RUN npm install --global yarn

RUN curl -O https://raw.githubusercontent.com/VinzGh1/server/main/requirements.txt && \
    pip3 install -r requirements.txt --no-cache-dir

ENV PATH="/usr/src/app/.local/bin:${PATH}"

COPY . .

RUN chmod +x setup.sh start.sh
RUN ./setup.sh

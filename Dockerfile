FROM golang:1.11

RUN apt-get update -y
RUN apt-get install -yq gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 \
    libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 \
    libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 \
    libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 \
    ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget \
    xvfb x11-xkb-utils xfonts-100dpi xfonts-75dpi zip \
    xfonts-scalable xfonts-cyrillic x11-apps clang \
    libgtk2.0-dev libnotify-dev libgnome-keyring-dev libgconf2-dev \
    libcap-dev libxtst-dev \
    gcc-multilib g++-multilib python3 python3-pip fonts-migmix && apt-get clean

# Install node
RUN wget http://nodejs.org/dist/v10.15.1/node-v10.15.1.tar.gz && \
  tar -zxvf node-v10.15.1.tar.gz && \
  cd node-v10.15.1 && ./configure && make && \
  make install

RUN go version
RUN pip3 install awscli
RUN npm i -g yarn

COPY ./xvfbd /usr/local/bin
RUN chmod 755 /usr/local/bin/xvfbd

RUN chmod 755 /usr/local/bin/xvfbd

RUN curl -L -o /tmp/docker.tgz https://get.docker.com/builds/Linux/x86_64/docker-17.03.0-ce.tgz
RUN tar -xz -C /tmp -f /tmp/docker.tgz
RUN mv /tmp/docker/* /usr/bin

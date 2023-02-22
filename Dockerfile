FROM ubuntu:latest

ENV NODE_ENV=production
ENV GOOGLE_CHROME_STABLE_VERSION=2
WORKDIR /usr/src/app

# Install Google Chrome
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    libx11-dev \
    libxtst-dev \
    libpng++-dev 
RUN curl -sSL https://dl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main"
RUN apt-get update && apt-get install -y google-chrome-stable

# Install Xvfb and xdotool
RUN apt-get install -y xvfb xdotool

# Install imagemagick
RUN apt-get install -y imagemagick

# Setup Timezone for tzdata
RUN ln -snf /usr/share/zoneinfo/$(curl https://ipapi.co/timezone) /etc/localtime

# Install x11vnc
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y x11vnc

# Install Python 2.7, NodeJS and npm
RUN apt-get install -y python2.7 nodejs npm

# Copy files
# COPY . .

# # Run npm install
# RUN npm install

# # Run cd core && npm install
# RUN cd core && npm install

# ENV DISPLAY :99

# # Set entrypoint
# CMD node server.js
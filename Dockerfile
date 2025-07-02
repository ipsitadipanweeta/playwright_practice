FROM maven:3.9.6-eclipse-temurin-17

RUN apt-get update && apt-get install -y \
    curl wget unzip xvfb x11-utils \
    libgtk-3-0 libxss1 libasound2 libnss3 libx11-xcb1 \
    libxcomposite1 libxdamage1 libxrandr2 libgbm1 libpango-1.0-0 \
    libatk-bridge2.0-0 libcups2 libxshmfence1 libxfixes3 libxrender1 \
    libdbus-1-3 fonts-liberation libatk1.0-0 libxkbcommon0 \
    gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-libav \
    libxslt1.1 libwoff1 libvpx7 libevent-2.1-7 libopus0 \
    libwebpdemux2 libharfbuzz-icu0 libenchant-2-2 libsecret-1-0 \
    libhyphen0 libflite1 libgles2 libx264-dev xvfb \
    && apt-get clean

# Optional: install Allure CLI
RUN wget https://github.com/allure-framework/allure2/releases/download/2.25.0/allure-2.25.0.tgz \
    && tar -xvzf allure-2.25.0.tgz -C /opt/ \
    && ln -s /opt/allure-2.25.0/bin/allure /usr/bin/allure \
    && rm allure-2.25.0.tgz

WORKDIR /usr/
COPY . .

ENV DISPLAY=:99

CMD ["sh", "-c", "xvfb-run -a mvn clean test && allure generate --clean -o allure-report"]

#test1



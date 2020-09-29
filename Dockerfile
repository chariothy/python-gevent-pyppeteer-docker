# For getmiaoss project
# @version 1.0

ARG PYVER
FROM chariothy/python-gevent:${PYVER}
LABEL maintainer="chariothy@gmail.com"

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

ARG TARGETPLATFORM
ARG BUILDPLATFORM

LABEL maintainer="chariothy" \
  org.opencontainers.image.created=$BUILD_DATE \
  org.opencontainers.image.url="https://github.com/chariothy/python-gevent-pyppeteer.git" \
  org.opencontainers.image.source="https://github.com/chariothy/python-gevent-pyppeteer.git" \
  org.opencontainers.image.version=$VERSION \
  org.opencontainers.image.revision=$VCS_REF \
  org.opencontainers.image.vendor="chariothy" \
  org.opencontainers.image.title="python-gevent-pyppeteer" \
  org.opencontainers.image.description="Docker for python spider" \
  org.opencontainers.image.licenses="MIT"

RUN apt-get update \
	&& apt-get install -y libnss3 xvfb gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 \
  libdbus-1-3 libexpat1 libfontconfig1 libgbm1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 \
  libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 \
  libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 \
  libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils \
  && apt-get autoclean \
  && rm -rf /var/lib/apt/lists/*

RUN pip install -U pip && pip install --no-cache-dir --user pyppeteer && pyppeteer-install

WORKDIR /usr/src/app

ENV PATH=/root/.local/bin:$PATH
CMD [ "python" ]
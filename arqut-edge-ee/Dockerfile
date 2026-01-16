ARG BUILD_FROM
FROM $BUILD_FROM

RUN apt-get update \
    && apt-get install -y iproute2 \
    && rm -rf /var/lib/apt/lists/*

ARG BINARY_PATH

ENV LANG=C.UTF-8

COPY run.sh /
COPY ${BINARY_PATH} /arqut-edge-ee

RUN chmod +x /run.sh
RUN chmod +x /arqut-edge-ee

# Fix line endings
RUN sed -i 's/\r$//' /run.sh

# Uses /bin for compatibility purposes
# hadolint ignore=DL4005
RUN if [ ! -f /bin/sh ] && [ -f /usr/bin/sh ]; then ln -s /usr/bin/sh /bin/sh; fi && \
    if [ ! -f /bin/bash ] && [ -f /usr/bin/bash ]; then ln -s /usr/bin/bash /bin/bash; fi

VOLUME [ "/data" ]
WORKDIR /

ENTRYPOINT [ "/usr/bin/env" ]
CMD ["/run.sh"]